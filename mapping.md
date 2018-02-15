# div

## Commentaires

3 types à conserver :
* commentaire diplomatique : `@n="diplomatique"` devient `@subtype="diplomatic"` (NB: à articuler avec les parties du discours)
* commentaire historique : `@n="histoire|historique"` devient `@subtype="history"`
* commentaire paléographique = `@n="paleographie"` devient `@subtype="paleography"`

enrichissement typographique :


# Mapping
| description | card. | db | xpath |
|---|---|---:|---|
|titre| 1! | `document.title` | `/TEI/teiHeader/fileDesc/titleStmt/title` |
|sous-titre| 1? | `document.subtitle` | `/TEI/teiHeader/fileDesc/titleStmt/title[@type="sub"]` |
|éditeur scientifique (label)| 1! | `editor.editor_name` | `/TEI/teiHeader/fileDesc/titleStmt/editor` |
|éditeur scientifique (ref, URI)| 1? | `editor.editor_ref` | `/TEI/teiHeader/fileDesc/titleStmt/editor/@ref` |
|contributeur(s) (label)| 0+ | `user.firstname user.lastname` | `/TEI/teiHeader/fileDesc/editionStmt/respStmt/name` |
|contributeur(s) (ref)| 1! | `user.mail` | `/TEI/teiHeader/fileDesc/editionStmt/respStmt/name/@ref` |
|contribution (transcription, traduction, ?)| 1+ | inférer | `/TEI/teiHeader/fileDesc/editionStmt/respStmt/resp` |
|éditeur ("École nationale des chartes")| 1! | | `/TEI/teiHeader/fileDesc/publicationStmt/publisher` |
|date de publication| 1! | `document.date_insert` | `/TEI/teiHeader/fileDesc/publicationStmt/date/@when` |
|date de mise à jour| 1? | `document.date_update` | |
|série ("ADELE")| 1! | | `/TEI/teiHeader/fileDesc/seriesStmt/title` |
|id dossier| 1! | `document.doc_id` ? | `/TEI/teiHeader/fileDesc/seriesStmt/biblScope` AND `/TEI/@xml:id` ? |
|URI de référence| 1! |  | `/TEI/teiHeader/fileDesc/publicationStmt/idno` |
|date du document source (label)| 1! | `document.creation_lab` | `/TEI/teiHeader/profileDesc/creation/date` |
|date du document source (normalisée)| 1! | `document.creation` | `/TEI/teiHeader/profileDesc/creation/date/@when` |
|langue du document source (code)| 1+ | `language.lang_code` | `/TEI/teiHeader/profileDesc/langUsage/language/@ident` |
|langue du document source (label)| 1+ | `language.lang_label` |  |
|institution de conservation du document source (label)| 1! | `institution.instit_name` | `/TEI/teiHeader/fileDesc/sourceDesc/bibl` |
|institution de conservation du document source (ref)| 1? | `institution.instit_ref` | `/TEI/teiHeader/fileDesc/sourceDesc/bibl` |
|cote(s) du document source| 1! | `pressmark.label` | `/TEI/teiHeader/fileDesc/sourceDesc/bibl` |
|lien vers la notice du document source| 1? | `pressmark.ref` | `/TEI/teiHeader/fileDesc/sourceDesc/bibl/@source` |
|cote(s) du document dans la collection des facsim| 1? | `document.pressmark_enc` | `/TEI/teiHeader/fileDesc/sourceDesc/bibl` |
||  | `` | `` |
|Commentaire diplomatique| 1? | `commentary.content` | `/TEI/text/front/div[@type="diplomatic"]` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
||  | `` | `` |
