# -*- coding: utf-8 -*-
from xml.etree.ElementTree import tostring
import re
import os
import pprint
import lxml.etree as ET
from itertools import chain

"""
CONSTS
"""
ROOT="/Users/mrgecko/Documents/Dev/Data/adele/dossiers"
NS_TI={"ti":"http://www.tei-c.org/ns/1.0"}
USERNAME="jpilla"

"""
XPATH
"""
XPATH_TI_FACSIM_COORDS_TRANSCRIPTION="//ti:div[@type='facsimile']//ti:seg/@rend"
XPATH_TI_FACSIM_ANNO_TRANSCRIPTION="//ti:div[@type='facsimile']//ti:seg"

XPATH_TI_FACSIM_COORDS_FIGDESC="//ti:figDesc//ti:seg/@rend"
XPATH_TI_FACSIM_ANNO_FIGDESC="//ti:figDesc//ti:seg"

XPATH_TI_TRANSCRIPTION="//ti:div[@type='transcription']"
XPATH_TI_TRANSLATION="//ti:div[@type='translation']"



"""
helpers
"""
get_manifest_url = lambda id: "http://193.48.42.68/adele/iiif/manifests/man{0}.json".format(id)
get_image_id = lambda id: "http://193.48.42.68/loris/adele/dossiers/{0}.jpg/full/full/0/default.jpg".format(id)

get_insert_stmt = lambda table,fields,values: "INSERT INTO {0} ({1}) VALUES ({2});".format(table, fields, values)
get_delete_stmt = lambda table,where_clause="": "DELETE FROM {0} {1};".format(table, where_clause)


clean_entities = lambda s : s.replace("&amp;", "&").replace("&gt;", ">").replace("&lt;", "<")
nullIfNone = lambda v, callback=None : "null" if v is None else callback(v) if callback is not None else v
escapeQuotes = lambda s : s.replace('"', '\\"')


p = re.compile("<[^>]+>((.|\s)*)<\/[^>]+>")
def get_tag_xml_content(node):
    m = re.match(p, ET.tounicode(node))
    return m.group(1) if m is not None else None

def get_text_format(div):
    verses = div.xpath("ti:l", namespaces=NS_TI)
    head = div.xpath("ti:head", namespaces=NS_TI)
    p = div.xpath("ti:p", namespaces=NS_TI)
    return {
        "verses": verses, "has_verses" : len(verses) > 0,
        "head": head, "has_head" : len(head) > 0,
        "p": p, "has_p" : len(p) > 0
    }


"""
inserts
"""
def insert_image_zone(dossier):
    values = []
    zone_id = 1
    for t in dossier["image_zone"]:
        values.append([
            dossier["manifest_url"],
            dossier["img_id"],
            str(zone_id),
            t["coords"],
            nullIfNone(t["note"], lambda t: "'{0}'".format(t))
        ])
        zone_id += 1
    #generate insert statements
    stmts = [ get_insert_stmt("image_zone", "manifest_url,img_id,zone_id,coords,note",
                              '"{0}","{1}",{2},"{3}",{4}'.format(*value))
        for value in values
    ]
    return stmts

def insert_image(dossier):
    stmts = [
        get_insert_stmt("image",
                        "manifest_url,img_id,doc_id",
                        '"{0}","{1}",{2}'.format(dossier["manifest_url"], dossier["img_id"], dossier["id"]))
    ]
    return stmts

def insert_transcription(dossier):
    stmts = []
    if len(dossier["transcription"]) > 0:
        content = " ".join(dossier["transcription"])
        stmts = [
            get_insert_stmt("transcription",
                            "doc_id,user_ref,content",
                            "{0},'{1}','{2}'".format(dossier["id"],USERNAME,content)
                            )
        ]
    return stmts

def insert_translation(dossier):
    stmts = []
    if len(dossier["translation"]) > 0:
        content = " ".join(dossier["translation"])
        stmts = [
            get_insert_stmt("translation",
                            "doc_id,user_ref,content",
                            "{0},'{1}','{2}'".format(dossier["id"],USERNAME,content)
                            )
        ]
    return stmts

"""
validity checks
"""
check_coords_validity = lambda coords : [int(c) for c in coords.split(",")]
facsim_coords_error = []


cnt_trancription_has_verses = 0
cnt_trancription_has_head = 0
cnt_trancription_has_p = 0
cnt_translation_has_verses = 0
cnt_translation_has_head = 0
cnt_translation_has_p = 0

cnt_file_parsing_error = 0

"""
=====================================
processing
=====================================
"""
dossiers = {}
filenames = [f for f in os.listdir(ROOT) if f.endswith(".xml")]
filenames.sort()

for f in filenames:

    """
    Initialisation des dossiers
    """
    id = f.split(".")[0]
    dossiers[f] = {
        "id": id,
        "manifest_url": get_manifest_url(id),
        "img_id": get_image_id(id),
        "image_zone" : [],
        "notes" : [],
        "transcription" : [],
        "translation" : []
    }

    """
    tables image & image_zone
    """
    try:
        doc = ET.parse(os.path.join(ROOT,f))
    except:
        cnt_file_parsing_error += 1
        break

    #print(f)

    facsim_coord_tr = doc.xpath(XPATH_TI_FACSIM_COORDS_TRANSCRIPTION, namespaces=NS_TI)
    facsim_note_tr = doc.xpath(XPATH_TI_FACSIM_ANNO_TRANSCRIPTION, namespaces=NS_TI)

    facsim_coord_figdesc = doc.xpath(XPATH_TI_FACSIM_COORDS_FIGDESC, namespaces=NS_TI)
    facsim_note_figdesc = doc.xpath(XPATH_TI_FACSIM_ANNO_FIGDESC, namespaces=NS_TI)

    # Récupérations des zones de transcription
    for coords_tr, note_tr in zip(facsim_coord_tr, facsim_note_tr):
        try:
            check_coords_validity(coords_tr)
            dossiers[f]["image_zone"].append({"coords": coords_tr, "note": None})
        except ValueError:
            facsim_coords_error.append((f, coords_tr))
    # Récupération des zones d'annotations & l'annotation associée
    for coords_figdesc, note_figdesc in zip(facsim_coord_figdesc, facsim_note_figdesc):
        try:
            check_coords_validity(coords_figdesc)
            dossiers[f]["image_zone"].append({"coords": coords_figdesc, "note": clean_entities(get_tag_xml_content(note_figdesc))})
        except ValueError:
            facsim_coords_error.append((f, coords_figdesc))

    """
    tables transcription & note & transcriptionHasNote
    """
    transcriptions = doc.xpath(XPATH_TI_TRANSCRIPTION, namespaces=NS_TI)
    if len(transcriptions) > 0:
        tf =  get_text_format(transcriptions[0])
        #print(f, "verses: {0}, head: {1}, p:{2}".format(len(tf["verses"]), len(tf["head"]), len(tf["p"])))

        if tf["has_verses"]:
            cnt_trancription_has_verses += 1
        if tf["has_head"]:
            cnt_trancription_has_head += 1
        if tf["has_p"]:
            cnt_trancription_has_p += 1

        #creation d'une note preliminaire à la transcription
        for h in tf["head"]:
            dossiers[f]["notes"].append({
                "content": clean_entities(get_tag_xml_content(h)), "ptr_start":None, "ptr_end":None
            })

        #transcription
        for i, v in enumerate(tf["verses"]):
            extracted_verse = get_tag_xml_content(v)
            if extracted_verse is not None:
                dossiers[f]["transcription"].append(extracted_verse)
            else:
                #cas des vereses auto fermants <l/>
                dossiers[f]["transcription"].append("<br/>")

    """
    tables translation & note & translationHasNote
    """
    translations = doc.xpath(XPATH_TI_TRANSLATION, namespaces=NS_TI)
    if len(translations) > 0:
        tf = get_text_format(translations[0])
        # print(f, "verses: {0}, head: {1}, p:{2}".format(len(tf["verses"]), len(tf["head"]), len(tf["p"])))

        if tf["has_verses"]:
            cnt_translation_has_verses += 1
        if tf["has_head"]:
            cnt_translation_has_head += 1
        if tf["has_p"]:
            cnt_translation_has_p += 1

        # creation d'une note preliminaire à la transcription
        for h in tf["head"]:
            dossiers[f]["notes"].append({
                "content": clean_entities(get_tag_xml_content(h)), "ptr_start": None, "ptr_end": None
            })

        #translation
        for i, v in enumerate(tf["verses"]):
            extracted_verse = get_tag_xml_content(v)
            if extracted_verse is not None:
                dossiers[f]["translation"].append(extracted_verse)
            else:
                #cas des vereses auto fermants <l/>
                dossiers[f]["translation"].append("<br/>")


for t in dossiers["23.xml"]["transcription"]:
    print(t)
    print("***")



"""
display
"""
print("=" * 80)
print("facsim coords error:")
pprint.pprint(set(facsim_coords_error))
print("file parsing error (nb files): {0}".format(cnt_file_parsing_error))
print("=" * 80)
print("Transcription with verses: {0}".format(cnt_trancription_has_verses))
print("Transcription with head: {0}".format(cnt_trancription_has_head))
print("Transcription with p: {0}".format(cnt_trancription_has_p))
print("Translation with verses: {0}".format(cnt_translation_has_verses))
print("Translation with head: {0}".format(cnt_translation_has_head))
print("Translation with p: {0}".format(cnt_translation_has_p))

add_sql_comment = lambda f, c="=": f.write("--" + c * 40 + "\n")


print("=" * 80)
print("SQL statements written to 'insert_statements.sql'")
with open('insert_img_stmts.sql', 'w+') as f_img,\
     open('insert_transcription_stmts.sql', 'w+') as f_transcription,\
     open('insert_translation_stmts.sql', 'w+') as f_translation:

    f_img.write(get_delete_stmt("image_zone") + "\n")
    f_img.write(get_delete_stmt("image") + "\n")
    add_sql_comment(f_img, '#')

    for dossier in dossiers.values():
        #table image
        for i in insert_image(dossier):
            f_img.write(i + "\n")

        add_sql_comment(f_img, '-')

        #table image_zone
        for i in insert_image_zone(dossier):
            f_img.write(i + "\n")
        add_sql_comment(f_img, '=')

        #table transcription
        for t in insert_transcription(dossier):
            f_transcription.write(t + "\n")

        #table translation
        for t in insert_translation(dossier):
            f_translation.write(t + "\n")

