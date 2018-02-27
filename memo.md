# Lib
## Python
* Flask : http://flask.pocoo.org/

## IIIF
* leaflet : https://github.com/mejackreed/Leaflet-IIIF
* leaflet (+ annotation) : https://bl.ocks.org/mejackreed
* iiifviewer : https://github.com/klokantech/iiifviewer

## Editeur
* Quill : https://quilljs.com/docs/quickstart/
* Ace (XML) : https://ace.c9.io/
* ProseMirror : https://prosemirror.net/

## CSS + JavaScript
* Bulma : https://bulma.io/documentation/overview/start/
* Vue.js : https://vuejs.org/


# Structure (TOC) des dossiers – à revoir

```txt
div[@type="facsimile"]
[@type="text"]
  [@type="transcription"]
  [@type="translation"]
  [@type="regeste"]
  [@type="commentaire"] ?
[@type="speech"]
[@type="diplomatic"]
[@type="history"]
[@type="paleography"]
```

```txt
div[@type="facsimile"]
[@type="text"]
  [@type="transcription"]
  [@type="translation"]
  [@type="regeste"]
[@type="speech"]
[@type="comments"]
  [@type="diplomatic"]
  [@type="history"]
  [@type="paleography"]
  [@type="commentaire"] (unspecified)
```
TODO: revoir la normalisation div diplomatique / commentaire


# Markup des contenus textuels

## Effectifs
* `l` (5082)
* `seg` (4818)
* `hi` (2138)
  * `[@rend="i"]` (italique, 900)
  * `[@rend="b"]` (gras, 456)
  * `[@rend="sup"]` (exposant, 431)
  * `[@rend="sc"]` (petites caps, 214)
  * `[@rend="u"]` (sous-ligné, 99)
  * `[@rend="color"]` (couleur, 55)
* `lb` (1645)
* `term` (1624)
* `ex` (15739)
* `p` (1326)
*  `div` (972)
*  `head` (519)
*  `note` (503)
*  `item` (288)
*  `add` (161)
*  `title` (114)
*   `list` (79)
*   `figDesc` (36)
*   `figure` (34)
*    `quote` (5)
*    `cb` (4)
*    `del` (2)
*    `ref` (1)

## Structure éditoriale

|enrichissement|`TEI`|`HTML5`|éditeur(s)|
|--------------|-----|-------|------|
|division|`div`|`section`|commentaire|
|titre hiérarchique|`head`|`h2`, `h3`, `h4`…|commentaire|
|paragraphe|`p`|`p`|transcription, traduction, commentaire|
|liste|`list`|`ul`|commentaire|
|item de liste|`item`|`li`|commentaire|
|vers|`l`|`div[@class="l"]`|transcription, traduction, commentaire|
|saut de ligne|`lb`|`br`|transcription, traduction, commentaire|
|saut de colonne|`cb`|?|transcription, traduction, commentaire|
|note (point, segment)|`note`|`aside[class="note"]`|transcription, traduction, commentaire|

## Enrichissement typographique : `hi`

|enrichissement|`TEI`|`HTML5`|éditeur(s)|
|--------------|-----|-------|------|
|italique|`hi[@rend="i"]`|`i`|transcription, traduction, commentaire|
|gras|`hi[@rend="b"]`|`strong`|transcription, traduction, commentaire|
|exposant|`hi[@rend="sup"]`|`sup`|transcription, traduction, commentaire|
|petites caps|`hi[@rend="sc"]`|`span[@class="sc"]`|transcription, traduction, commentaire|
|sous-ligné|`hi[@rend="u"]`|`u`|transcription, traduction, commentaire|
|couleur|`hi[@style="$color"]`|?|transcription, traduction, commentaire|

## Enrichissements sémantiques

|enrichissement|`TEI`|`HTML5`|éditeur(s)|
|--------------|-----|-------|------|
|développement abréviation|`ex`|`span[@class="ex"]`, `ins` ?|transcription|
|texte supprimé|`del`|`del`|transcription, traduction|
|liens|`ref[@target]`|`a[@href]`|commentaire|
|citations **inline**|`quote`|`q`|commentaire|
|citation **bloc**|`quote`|`blockquote`|commentaire|
|[mention bibliographique, titre](http://html5doctor.com/blockquote-q-cite/)|`title/@ref`|`cite/a`|commentaire|
|personne|`persName/@ref`|`a[@class="persName"]/@href`|transcription, traduction, commentaire|
|lieu|`placeName/@ref`|`a[@class="placeName"]/@href`|transcription, traduction, commentaire|

# Entités
On conserve :
* `&amp;`
* `&gt;`
* `&lt;`

**NB.** Penser à transformer `&quot;` au chargement en base.


# Parties du discours, typologie

## Proposition OGJ
http://theleme.enc.sorbonne.fr/cours/diplomatique#index_7

|label|définition|
|-----|----------|
|`invocation`|(verbale = en toutes lettres, ou figurée = sous forme de signe graphique) : place l'acte sous le patronage d'une personne divine.|
|`suscription`|décline l'identité de l'auteur de l'acte : nom personnel ± pronom personnel ± titre ± formule de dévotion (« par la grâce de Dieu » etc.), dite plus justement formule « de légitimation » par les diplomatistes allemands (cf. « évêque par la grâce du Saint-Siège »).|
|`adresse`|décline l'identité du destinataire (pas forcément le bénéficiaire) de l'acte/lettre. Peut être individuelle, collective, universelle.|
|`salut`|de règle quand il y a une adresse. En l'absence d'adresse, rien (ce qui dénote des rapports très tendus) ou formule de perpétuité (p. ex. « ad perpetuam rei memoriam »).|
|`preambule`|ensemble de considérations générales, à valeur universelle, détachées du contexte particulier, qui motivent et légitiment l'acte.|
|`notification`|formule-outil qui déclare la volonté de porter à la connaissance des lecteurs/auditeurs de l'acte.|
|`expose`|exposé logico-chronologique des circonstances qui ont amené la prise de décision.|
|`dispositif`|cœur de l'acte, dévoile et explicite la décision, l'action juridique.|
|`clause_tradition`|description des cérémonies d'investiture, de déguerpissement...|
|`clause_jussio`|mention de l'ordre donné d'écrire l'acte (plutôt dans les actes royaux/princiers).|
|`clause_rogatio`|symétrique, mention de l'ordre reçu d'écrire l'acte (plutôt dans les actes privés).|
|`clause_stipulatio`|clause (« cum stipulatione subnexa » etc.) qui renvoie au droit romain antique et (à l'origine) indique que les parties ont échangé formellement leurs consentements.|
|`clause_corroboration`|annonce des moyens de validation finaux (peut être perpétuelle ; probatoire si elle inclut un mention du type « In cujus rei testimonium »).|
|`clause_intentionnelle`|exprime que l'acte traduit la volonté de l'auteur : « car ainsi le voulons »...|
|`clause_injonctive`|ordre donné aux agents d'appliquer l'acte : « Si donnons en mandement... ».|
|`clause_prohibitive`|inverse de la précédente : interdiction de mettre empêchement ou retard à l'application de l'acte.|
|`clause_derogative`|l'auteur déroge aux règles qui pourraient contrarier l'application de l'acte : « Nonobstant ordonnances...... a ce contraires ».|
|`clause_reserve`|inverse de la précédente, l'auteur affirmant que l'acte ne saurait empiéter sur les droits déjà acquis : « sauf en autres choses notre droit, et l'autrui [= le droit d'autrui] en toutes ».|
|`clause_penale`|prononce à l'avance une condamnation séculière), clause comminatoire (prononce à l'avance une condamnation spirituelle).|
|`clause_promesse`|l'auteur de l'action s'engage à respecter l'acte, par serment ou autre.|
|`clause_obligation`|de garantie, de soumission à juridiction (apportent le moyen de faire respecter la promesse : en s'obligeant soi et son corps, ses biens et ses héritiers ; en donnant des garants, ou pleiges, ou en constituant une garantie sur d'autres biens ; en se soumettant d'avance à un tribunal précis).|
|`clause_renonciation`|renonciations à diverses exceptions prévues par la loi [droit romain ou canonique] ou par la coutume, et qui permettraient de faire annuler l'acte après coup, de faire traîner un procès intenté pour non-respect de l'acte, etc.|
|`clause_consentement`|mentionnent le consentement donné par des parents ou alliés : laudatio parentum, par un seigneur...|
|`date`|date de temps.|
|`todo`|à normaliser par OGJ|

## reprise => devienne `todo`
*  6 requete
*  5 liste
*  4 temoins
*  5 clause
*  3 mention_enregistrement
*  3 mention
*  3 date_lieu
*  3 analyse
*  2 vidisalut
*  2 vide
*  2 recognition
*  2 monogramme
*  2 corps
*  2 contreseing
*  2 coeur
*  2 clause_finale
*  2 apprecation
*  1 visa
*  1 viditemoin
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
*  1 description
*  1 complements
*  1 collation
*  1 clause_decharge
*  1 annonce


# Images

## Serveur IIIF:
* http://193.48.42.68/loris/adele/dossiers/95.jpg/full/full/0/default.jpg
* http://193.48.42.68/loris/adele/dossiers/95.jpg/info.json
* http://193.48.42.68/adele/iiif/manifests/
* http://193.48.42.68/adele/iiif/manifests/man95.json

## Leaflet
* http://193.48.42.68/Leaflet-IIIF/examples/annotations.html
* http://193.48.42.68/Leaflet-IIIF/examples/iiif-annotations.js

## Scenario
1. On soumet une liste de manisfestes (un manifeste par dossier).
1. Un dossier est créé pour chaque manifeste listé.
1. On transcrit à côté de l’image affichée dans Leaflet
1. On crée les zones du facsimilé en utilisant l’outil d’annotation de Leaflet
1. L’interface doit permettre d’établir la correspondance de ces zones avec des portions de la transcription.
1. (Caractères externes) On annote éventuellement l’image (certains détails) en utilisant Leaflet. On stocke en base l’onnotation inscrite dans l’objet JS à la saisie Leaflet (cf démo).

Travail Leaflet :
1. Afficher les zones et les annotations asssociées
1. Implémenter un bouton pour afficher / cacher les annotations à l’affichage (dossier en consultation).
1. Configurer un éditeur pour l’enrichissement typographique des annotations (italique, exposant, gras) : utiliser Quill comme éditeur de nos annotations dans leaflet ?
1. Créer des services : stocker en base le contenu de l’objet JS géré par Leaflet (create, update, delete)


# Mapping (output TEI)
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
