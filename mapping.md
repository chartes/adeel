//seg[not(ancestor::div[@type="facsimile"]) and not(ancestor::div[@type="text"]) and not(ancestor::div[@type="speech"]) and not(ancestor::figDesc)]

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
*   <strike>39 em</strike>
*   36 publisher
*   34 figDesc
*   <strike>26 strong</strike>
*   24 listBibl
*   <strike>21 sup</strike>
*   <strike>17 label</strike>
*    <strike>9 xref</strike>
*    <strike>8 span</strike>
*    <strike>7 lg</strike>
*    <strike>7 i</strike>
*    7 editor
*    <strike>6 li</strike>
*    5 cb
*    4 biblScop
*    <strike>3 space</strike>
*    <strike>3 series</strike>
*    <strike>3 q</strike>
*    2 del
*    <strike>2 br</strike>
*    <strike>1 u</strike>
*    1 quote
*    <strike>1 graphic</strike>
*    <strike>1 edition</strike>
*    <strike>1 blockquote</strike>
*    <strike>1 a</strike>
* <strike>commentaires</strike>

# entités
Penser à transformer `&quot;` au chargement en base.

On conserve
* `&amp;`
* `&gt;`
* `&lt;`

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

**enrichissements sémantiques**
* citations inline (`«`,`»`) (`tei:quote`=> `html:q`)
* mention bibliographique (`bibl` => ?)
* titre (`tei:title` => `html:cite`)
* entités nommées
  * personne (`tei:persName/@ref` => )
  * lieu (`tei:placeName/@ref` => )
* des liens (`tei:ref[@target]` => `html:a[@href]`)

**structure éditoriale**
* titres hiérarchiques (`tei:head` => `html:h1`, `html:h2`, `html:h3`…)
* blocs citation (`tei:quote` => `html:blockquote`)

**transcription**
* développement abréviation (`tei:ex` => `html:span[@class="ex"] | tei:ins` ?)
* texte supprimé (`tei:del` => `html:del`)


# partie du discours, typologie

## état
* 1 Clause_decharge => clause_decharge
* 1 Date => date
* 1 Dispositif => dispositif
* 1 Exposé => expose
* 1 Liste_temoins => temoins
* 1 Nom_signature => signature
* 22 adresse
* 3 adresse_universelle
* 3 analyse => ???????
* 1 annonce => ???????
* 2 apprecation => ???????
* 4 clause
* 1 clause_comm  => clause
* 2 clause_corroboration
* 2 clause_finale
* 2 clause_garantie
* 3 clause_injonctive
* 4 clause_intentionnelle
* 2 clause_obligation
* 1 clause_penale
* 1 clause_prohi => clause_prohibitive
* 1 clause_prohibitive
* 3 clause_promesse
* 1 clause_pénale => clause_penale
* 1 clause_renonciation
* 2 clause_reserve
* 1 clause_soumission
* 2 coeur => ???????
* 1 collation
* 1 complements
* 2 contreseing
* 2 corps
* 1 corrobo => corroboration
* 23 corroboration
* 1 corroboration_2 => corroboration
* 1 corroboration_probatoire => corroboration
* 34 date
* 3 date_1 => date
* 3 date_2 => date
* 1 date_de_temps => date
* 3 date_finale => date
* 2 date_initiale => date
* 3 date_lieu
* 5 date_temps => date
* 1 datefin => date
* 1 description
* 1 dispo => dispositif
* 34 dispositif
* 1 dispositif_promesse => dispositif
* 1 dispositif_suite => dispositif
* 15 expose
* 1 expose_1 => expose
* 1 expose_2 => expose
* 1 expose_dispositif => expose
* 6 exposé => expose
* 1 garantie
* 1 injonctive
* 1 intentionnelle
* 4 invocation
* 2 invocation_figurée => invocation
* 4 invocation_verbale
* 3 jussio
* 1 laudatio
* 5 liste
* 2 liste_de_témoins => temoins
* 3 mention
* 1 mention_adventice
* 1 mention_attestation
* 1 mention_commandement
* 1 mention_copie
* 1 mention_delegation
* 1 mention_enregistrement
* 1 mention_enregistrement_1 => mention_enregistrement
* 1 mention_enregistrement_2 => mention_enregistrement
* 1 mention_publication
* 1 minute
* 2 monogramme
* 1 nom_signature => signature
* 3 notif => notification
* 18 notification
* 1 notification_1 => notification
* 1 notification_2 => notification
* 1 notification_secondaire => notification
* 4 notification_universelle
* 2 obligation
* 1 ordre
* 1 ordre_1 => ordre
* 1 ordre_2 => ordre
* 1 ordre_3 => ordre
* 1 ordre_4 => ordre
* 1 ordre_5 => ordre
* 1 ordre_6 => ordre
* 5 preambule
* 1 promesse
* 1 promesseparents => promesse
* 2 recognition
* 1 reference_minute
* 2 renonciation
* 1 requete_1 => requete
* 1 requete_2 => requete
* 1 requete_3 => requete
* 1 requete_4 => requete
* 1 requete_5 => requete
* 1 requete_6 => requete
* 20 salut
* 1 seing
* 1 sign => signature
* 12 signature
* 1 signature_greffier => signature
* 1 signature_parlement => signature
* 3 signatures => signature
* 5 souscription
* 1 souscription_auteur => souscription
* 1 souscription_royale => souscription
* 1 souscription_rédacteur => souscription
* 1 souscription_témoins => souscription
* 1 substitut
* 1 suscriptio => suscription
* 35 suscription
* 1 suscription_2 => suscription
* 1 suscription_depersonnalisee => suscription
* 1 suscritpion => suscription
* 1 temoins
* 2 vide
* 1 vidiadresse
* 1 vididate
* 1 vididispo
* 1 vidiexpose
* 1 vidinotification
* 2 vidisalut
* 1 vidisuscription
* 1 viditemoin
* 1 visa

## reprise
* 52 date
* 39 suscription
* 38 dispositif
* 26 corroboration
* 24 notification
* 24 expose
* 22 adresse
* 20 salut
* 19 signature
* 10 invocation
*  9 souscription
*  7 ordre
*  6 requete
*  5 preambule
*  5 liste
*  5 clause
*  4 temoins
*  4 notification_universelle
*  4 clause_intentionnelle
*  3 mention_enregistrement
*  3 mention
*  3 jussio
*  3 date_lieu
*  3 clause_promesse
*  3 clause_injonctive
*  3 analyse
*  3 adresse_universelle
*  2 vidisalut
*  2 vide
*  2 renonciation
*  2 recognition
*  2 promesse
*  2 obligation
*  2 monogramme
*  2 corps
*  2 contreseing
*  2 coeur
*  2 clause_reserve
*  2 clause_prohibitive
*  2 clause_penale
*  2 clause_obligation
*  2 clause_garantie
*  2 clause_finale
*  2 clause_corroboration
*  2 apprecation
*  1 visa
*  1 viditemoin
*  1 vidisuscription
*  1 vidinotification
*  1 vidiexpose
*  1 vididispo
*  1 vididate
*  1 vidiadresse
*  1 substitut
*  1 signatures
*  1 seing
*  1 reference_minute
*  1 minute
*  1 mention_publication
*  1 mention_delegation
*  1 mention_copie
*  1 mention_commandement
*  1 mention_attestation
*  1 mention_adventice
*  1 laudatio
*  1 intentionnelle
*  1 injonctive
*  1 garantie
*  1 exposé
*  1 description
*  1 date_temps
*  1 complements
*  1 collation
*  1 clause_soumission
*  1 clause_renonciation
*  1 clause_decharge
*  1 annonce

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
