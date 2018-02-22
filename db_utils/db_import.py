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

"""
XPATH
"""
XPATH_TI_FACSIM_COORDS_TRANSCRIPTION="//ti:div[@type='facsimile']//ti:seg/@rend"
XPATH_TI_FACSIM_ANNO_TRANSCRIPTION="//ti:div[@type='facsimile']//ti:seg"

XPATH_TI_FACSIM_COORDS_FIGDESC="//ti:figDesc//ti:seg/@rend"
XPATH_TI_FACSIM_ANNO_FIGDESC="//ti:figDesc//ti:seg"

"""
helpers
"""
get_manifest_url = lambda id: "http://193.48.42.68/adele/iiif/manifests/man{0}.json".format(id)
get_image_id = lambda id: "http://193.48.42.68/loris/adele/dossiers/{0}.jpg/full/full/0/default.jpg".format(id)
get_insert_stmt = lambda table,fields,values : "INSERT INTO {0} ({1}) VALUES ({2});".format(table, fields, values)
get_delete_stmt = lambda table,where_clause="" : "DELETE FROM {0} {1};".format(table, where_clause)


def stringify(node):
    parts = ([node.text] +
             list(chain((ET.tounicode(c) for c in node.getchildren()))) +
             [node.tail])
    parts = filter(None, parts)
    return ''.join(parts).strip()


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
            t["note"]]
        )
        zone_id += 1
    #generate insert statements
    stmts = [
        get_insert_stmt(
            "image_zone",
            "manifest_url,img_id,zone_id,coords,note",
            ",".join(['"{0}"'.format(v.replace("\"", "&quot;"))
                      if v is not None else "null" for v in value])
        )
        for value in values
    ]
    return stmts

"""
validity checks
"""
check_coords_validity = lambda coords : [int(c) for c in coords.split(",")]
facsim_coords_error = []


"""
processing
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
        "manifest_url": get_manifest_url(id),
        "img_id": get_image_id(id),
        "image_zone" : []
    }

    """
    table image_zone
    """
    doc = ET.parse(os.path.join(ROOT,f))

    facsim_coord_tr = doc.xpath(XPATH_TI_FACSIM_COORDS_TRANSCRIPTION, namespaces={"ti":"http://www.tei-c.org/ns/1.0"})
    facsim_note_tr = doc.xpath(XPATH_TI_FACSIM_ANNO_TRANSCRIPTION, namespaces={"ti":"http://www.tei-c.org/ns/1.0"})

    facsim_coord_figdesc = doc.xpath(XPATH_TI_FACSIM_COORDS_FIGDESC, namespaces={"ti":"http://www.tei-c.org/ns/1.0"})
    facsim_note_figdesc = doc.xpath(XPATH_TI_FACSIM_ANNO_FIGDESC, namespaces={"ti":"http://www.tei-c.org/ns/1.0"})

    facsim_image_zone_transcription = zip(facsim_coord_tr, facsim_note_tr)
    facsim_image_zone_figdesc = zip(facsim_coord_figdesc, facsim_note_figdesc)

    # Récupérations des zones de transcription
    for coords_tr, note_tr in facsim_image_zone_transcription:
        try:
            check_coords_validity(coords_tr)
            dossiers[f]["image_zone"].append({"coords": coords_tr, "note": None})
        except ValueError:
            facsim_coords_error.append((f, coords_tr))
    # Récupération des zones d'annotations & l'annotation associée
    for coords_figdesc, note_figdesc in facsim_image_zone_figdesc:
        try:
            check_coords_validity(coords_figdesc)
            dossiers[f]["image_zone"].append({"coords": coords_figdesc, "note": stringify(note_figdesc)})
        except ValueError:
            facsim_coords_error.append((f, coords_figdesc))

    """
    table XXX
    """


"""
display
"""
print("=" * 80)
print("facsim coords error:")
pprint.pprint(set(facsim_coords_error))

print("=" * 80)
pprint.pprint(dossiers["1.xml"])

print("=" * 80)
cnt = 0
for dossier in dossiers.values():
    for i in insert_image_zone(dossier):
        print(i)
        cnt+=1
print("NB_INSERT image_zone:", cnt)



print("=" * 80)
print("SQL statements written to 'insert_statements.sql'")
with open('insert_statements.sql', 'w') as f:
    for dossier in dossiers.values():
        f.write(get_delete_stmt("image_zone"))
        f.write("\n" + "--" + "=="*40 + "\n")
        for i in insert_image_zone(dossier):
            f.write(i + "\n")

#for d in insert_image_zone(dossiers["20.xml"]):
#    print(d)
