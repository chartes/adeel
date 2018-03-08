# -*- coding: utf-8 -*-
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import create_session
from sqlalchemy import create_engine



def name_for_collection_relationship(base, local_cls, referred_cls,constraint):
    disc = '_'.join(col.name for col in constraint.columns)
    return referred_cls.__name__.lower() + '_' + disc + "_collection"

def delete_insert_alignment_transcription_translation(doc_id):

    Base = automap_base()
    engine = create_engine("sqlite:////Users/mrgecko/Documents/Dev/Data/adele/adele.sqlite")
    Base.prepare(engine, reflect=True, name_for_collection_relationship=name_for_collection_relationship)
    session = create_session(bind=engine)
    txt = session.execute("SELECT content from transcription where doc_id={0};".format(doc_id)).fetchone()[0]
    txt_trs = session.execute("SELECT content from translation where doc_id={0};".format(doc_id)).fetchone()[0]

    def get_ptrs_from_verses(text):
        text = text.replace("</l>", "</l>@$")
        text = text.replace("<lb/>", "<lb/>@$")
        text = text.split("@$")[:-1]
        ptrs = []
        ptr_start = 1
        for i, l_tag in enumerate(text):
            #print("* " + l_tag)
            ptr_end = ptr_start + len(l_tag)
            ptrs.append((ptr_start, ptr_end))
            ptr_start = ptr_end
        return ptrs


    transcription_ptrs = get_ptrs_from_verses(txt)
    translation_ptrs = get_ptrs_from_verses(txt_trs)
    #print(translation_ptrs)
    alignment_translation_ptrs = zip(transcription_ptrs, translation_ptrs)
    #print(alignment_translation_ptrs)


    session.execute("DELETE FROM alignment_translation "
                    "WHERE translation_id={0} and transcription_id={0};".format(doc_id))

    for i, ((t1,t2), (l1,l2)) in enumerate(alignment_translation_ptrs):
        #print(
            # "ptr %i @%i-%i: %s" %(i, t1, t2, txt[t1:t2])
        #    "%s" % (txt[t1-1:t2-1])
        #)
        #print(
        #    "%s" % (txt_trs[l1-1:l2-1])
        #)
        #print('-' * 10)


        altr = Base.metadata.tables["alignment_translation"].insert()
        ins = altr.values(translation_id=doc_id,
            transcription_id=doc_id,
            ptr_transcription_start=t1,
            ptr_translation_start=l1,
            ptr_transcription_end=t2,
            ptr_translation_end=l2,
        )

        ins.compile()
        res = session.execute(ins)


delete_insert_alignment_transcription_translation(20)