# TODO (in `body`)
* 5070 l
* 4848 seg
* 2058 hi
* 1662 lb
* 1626 term
* 15743 ex
* 1353 p
*  975 div
*  525 head
*  504 note
*  186 item
*  162 add
*  114 title
*   95 biblScope
*   89 bibl
*   80 author
*   78 figure
*   69 foreign
*   53 date
*   51 list
*   42 pubPlace
*   39 em
*   36 publisher
*   34 figDesc
*   26 strong
*   24 listBibl
*   21 sup
*   17 label
*    <strike>9 xref</strike>
*    <strike>8 span</strike>
*    7 lg
*    <strike>7 i</strike
*    7 editor
*    <strike>6 li</strike>
*    5 cb
*    4 biblScop
*    3 space
*    3 series
*    3 q
*    2 del
*    <strike>2 br</strike>
*    <strike>1 u</strike>
*    1 quote
*    <strike>1 graphic</strike>
*    <strike>1 edition</strike>
*    <strike>1 blockquote</strike>
*    <strike>1 a</strike>


# structure `body`

```txt
div[@type="facsimile"]
[@type="text"]
  [@type="transcription"]
  [@type="translation"]
  [@type="regeste"]
  ?
[@type="speech"]
[@type="diplomatic"]
[@type="history"]
[@type="paleography"]
```


## Commentaires


**enrichissement typographique**
* italique (`tei:hi[@rend="i"]` => `html:i` | `html:em` AND `html:cite` ?)
* gras (`tei:hi[@rend="b"]` => `html:b` | `html:strong`)
* sous-ligné (`tei:hi[@rend="u"]` => `html:u` – déprécié, on remplace par quoi ?)
* exposant (`tei:hi[@rend="sup"]` => `html:sup`)
* petites caps (`tei:hi[@rend="sc"]` => `html:span[@class="sc"]`)
* citations inline (`«`,`»`) (`tei:quote`=> `html:q`)
* des liens (`tei:ref[@target]` => `html:a[@href]`)

**structure éditoriale**
* titres hiérarchiques (`tei:head` => `html:h1`, `html:h2`, `html:h3`…)
* blocs citation (`tei:quote` => `html:blockquote`)

**transcription**
* développement abréviation (`tei:ex` => `html:span[@class="ex"] | tei:ins` ?)
* texte supprimé (`tei:del` => `html:del`)


**partie du discours, typologie**



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
