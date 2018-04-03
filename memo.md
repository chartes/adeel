# Lib
## Python
* Flask : http://flask.pocoo.org/
* Flask-SQLAlchemy : http://flask-sqlalchemy.pocoo.org/2.3/
* Flask-User v0.6 : http://flask-user.readthedocs.io/en/v0.6/


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
|italique|`hi[@rend="i"]`|`i`|transcription, traduction, commentaire, annotation facsimile|
|gras|`hi[@rend="b"]`|`strong`|transcription, traduction, commentaire, annotation facsimile|
|exposant|`hi[@rend="sup"]`|`sup`|transcription, traduction, commentaire, annotation facsimile|
|petites caps|`hi[@rend="sc"]`|`span[@class="sc"]`|transcription, traduction, commentaire|
|souligné|`hi[@rend="u"]`|`u`|transcription, traduction, commentaire, annotation facsimile|
|couleur|`hi[@style="$color"]`|?|commentaire|

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

# Type de document ou auteur
Choix multiple ; liste initiale, plus exhaustive que les cas déjà rencontrés.  
Une documentation (éventuellement un lien vers le [VID](http://www.cei.lmu.de/VID/)) serait souhaitable.

|label|définition|VID|
|-----|----------|---|
|Pape|||
|Légat|||
|Concile|||
|Évêque|||
|Chapitre cathédral|||
|Abbé, maison religieuse|||
|Autre ecclésiastique|||
|Souverain|||
|Prince, comte|||
|Administration centrale|||
|Administration locale|||
|Seigneur|||
|Municipalité|||
|Notariats traditionnels|||
|Notices|||
|Actes privéssous le sceau et/ou la signature de l’auteur|||
|Actes privéssous le/les sceaux d’autorités locales|||
|Notaire public|||
|Juridiction gracieuse ecclésiastique|||
|Juridiction gracieuse laïque|||
|Juridiction gracieuse municipale|||
|Documents de gestion domaniale|||
|Inventaires de biens et de trésors|||
|Documents féodaux|||
|Documents comptables, financiers et fiscaux|||
|Documents propres à la production, aux échanges, au travail|||
|Documents militaires|||
|Documents propres à la diplomatie et aux relations extérieures|||
|Documents judiciaires|||
|Documents propres à l’enseignement|||
|Documents propres à l’assistance|||
|Documents propres aux archives ecclésiastiques|||
|Documents propres aux archives royales et princières|||
|Documents propres aux archives municipales|||
|Documents propres aux archives seigneuriales et de particuliers|||

# Modes de tradition
Choix multiple ; liste initiale, plus exhaustive que les cas déjà rencontrés.  
Une documentation (éventuellement un lien vers le [VID](http://www.cei.lmu.de/VID/)) serait souhaitable.

|label|documentation|VID|
|-----|-------------|---|
|Original|||
|Original multiple|||
|Pancarte|||
|Copie informe|||
|Copie figurée|||
|Copie authentique|||
|Traduction|||
|Cartulaire|||
|Inventaire d’archives|||
|Supplique et pétition|||
|Formulaire|||
|Minute et brouillon|||
|Registre de notaire et de tabellion|||
|Registre de chancellerie|||
|Faux|||

# Parties du discours, typologie

## Proposition OGJ
http://theleme.enc.sorbonne.fr/cours/diplomatique#index_7  
http://www.cei.lmu.de/VID/

|label|occs|définition|
|-----|----|----------|
|`invocation`|10|(verbale = en toutes lettres, ou figurée = sous forme de signe graphique) : place l'acte sous le patronage d'une personne divine.|
|`suscription`|73|décline l'identité de l'auteur de l'acte : nom personnel ± pronom personnel ± titre ± formule de dévotion (« par la grâce de Dieu » etc.), dite plus justement formule « de légitimation » par les diplomatistes allemands (cf. « évêque par la grâce du Saint-Siège »).|
|`adresse`|30|décline l'identité du destinataire (pas forcément le bénéficiaire) de l'acte/lettre. Peut être individuelle, collective, universelle.|
|`salut`|24|de règle quand il y a une adresse. En l'absence d'adresse, rien (ce qui dénote des rapports très tendus) ou formule de perpétuité (p. ex. « ad perpetuam rei memoriam »).|
|`preambule`|6|ensemble de considérations générales, à valeur universelle, détachées du contexte particulier, qui motivent et légitiment l'acte.|
|`notification`|29|formule-outil qui déclare la volonté de porter à la connaissance des lecteurs/auditeurs de l'acte.|
|`expose`|29|exposé logico-chronologique des circonstances qui ont amené la prise de décision.|
|`dispositif`|44|cœur de l'acte, dévoile et explicite la décision, l'action juridique.|
|`clause_tradition`|0|description des cérémonies d'investiture, de déguerpissement...|
|`clause_jussio`|3|mention de l'ordre donné d'écrire l'acte (plutôt dans les actes royaux/princiers).|
|`clause_rogatio`|0|symétrique, mention de l'ordre reçu d'écrire l'acte (plutôt dans les actes privés).|
|`clause_stipulatio`|0|clause (« cum stipulatione subnexa » etc.) qui renvoie au droit romain antique et (à l'origine) indique que les parties ont échangé formellement leurs consentements.|
|`clause_corroboration`|28|annonce des moyens de validation finaux (peut être perpétuelle ; probatoire si elle inclut un mention du type « In cujus rei testimonium »).|
|`clause_intentionnelle`|5|exprime que l'acte traduit la volonté de l'auteur : « car ainsi le voulons »...|
|`clause_injonctive`|11|ordre donné aux agents d'appliquer l'acte : « Si donnons en mandement... ».|
|`clause_prohibitive`|2|inverse de la précédente : interdiction de mettre empêchement ou retard à l'application de l'acte.|
|`clause_derogative`|0|l'auteur déroge aux règles qui pourraient contrarier l'application de l'acte : « Nonobstant ordonnances...... a ce contraires ».|
|`clause_reserve`|2|inverse de la précédente, l'auteur affirmant que l'acte ne saurait empiéter sur les droits déjà acquis : « sauf en autres choses notre droit, et l'autrui [= le droit d'autrui] en toutes ».|
|`clause_penale`|3|prononce à l'avance une condamnation séculière), clause comminatoire (prononce à l'avance une condamnation spirituelle).|
|`clause_promesse`|5|l'auteur de l'action s'engage à respecter l'acte, par serment ou autre.|
|`clause_obligation`|8|de garantie, de soumission à juridiction (apportent le moyen de faire respecter la promesse : en s'obligeant soi et son corps, ses biens et ses héritiers ; en donnant des garants, ou pleiges, ou en constituant une garantie sur d'autres biens ; en se soumettant d'avance à un tribunal précis).|
|`clause_renonciation`|3|renonciations à diverses exceptions prévues par la loi [droit romain ou canonique] ou par la coutume, et qui permettraient de faire annuler l'acte après coup, de faire traîner un procès intenté pour non-respect de l'acte, etc.|
|`clause_consentement`|1|mentionnent le consentement donné par des parents ou alliés : laudatio parentum, par un seigneur...|
|`date`|58|date de temps.|
|`todo`|68|à normaliser par OGJ|

Étiquettes à normaliser (`todo`) avec OGJ dans 34 fichiers : 10, 18, 20, 22, 24, 31, 33, 34, 35, 39, 43, 46, 49, 51, 52, 53, 55, 58, 67, 69, 77, 78, 80, 82, 83, 105, 106, 107, 108, 109, 110, 114, 116, 117 – en remplacement essentiellement d’hapax.


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
