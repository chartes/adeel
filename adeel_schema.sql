PRAGMA encoding = 'UTF-8';

-- prototype de base pour Adeel
-- TODO: définir les index en fonction de la logique de recherche

-- description d’un document
CREATE TABLE document (
  docid        INTEGER UNIQUE NOT NULL,   -- ! id du document
  title        TEXT,                      -- ! titre principal
  subtitle     TEXT,                      -- ! sous-titre
  creationlab  TEXT,                      -- ! creation_label in tableau OGJ; dc:creation, non normalisé, en toutes lettres (les intervalles notamment), pour lecture
  creation     INTEGER,                   -- ! creation_norm in tableau OGJ;  dc:creation normalisée pour les traitements, [0-9]{4} ; la dernière date en cas d’intervalle
  copyyear     INTEGER,                   -- ? copyYear_label in tableau OGJ; année de la copie non normalisée, en toutes lettres (les intervalles notamment), pour lecture
  copycent     INTEGER,                   -- ? copyCentury_norm in tableau OGJ; siècle de la copie, [0-9]{1,2} NB: retenir la date la plus récente
  institution  INTEGER REFERENCES institution(rowid), -- ? institution de conservation
  pressmark    TEXT                       -- ? cote de conservation
);
CREATE UNIQUE INDEX document_docid ON document(docid);
CREATE INDEX document_title ON document(title);

-- typologie des actes par OGJ
CREATE TABLE type (
  typeid       INTEGER UNIQUE NOT NULL,  -- ! identifiant du type
  typelabel    TEXT UNIQUE NOT NULL      -- ! label du type
);
-- valeurs autorisées
INSERT INTO 'type' ('typeid', 'typelabel')
  VALUES
  ('1','Abbé, maison religieuse'),
  ('2','Actes privés sous le sceau et/ou la signature de l’auteur'),
  ('3','Actes privés sous le/les sceaux d’autorités locales'),
  ('4','Administration centrale'),
  ('5','Administration locale'),
  ('6','Chapitre cathédral'),
  ('7','Documents comptables, financiers et fiscaux'),
  ('8','Documents de gestion domaniale'),
  ('9','Documents féodaux'),
  ('10','Documents judiciaires'),
  ('11','Evêque'),
  ('12','Juridiction gracieuse ecclésiastique'),
  ('13','Juridiction gracieuse laïque'),
  ('14','Juridiction gracieuse municipale'),
  ('15','Légat'),
  ('16','Notaire public'),
  ('17','Notariats traditionnels'),
  ('18','Notices'),
  ('19','Pape'),
  ('20','Prince, comte…'),
  ('21','Souverain');
-- relation document/types
CREATE TABLE hasType (
  document     INTEGER NOT NULL REFERENCES document(docid),
  type         INTEGER REFERENCES type(typeid),
  UNIQUE(document, type) ON CONFLICT REPLACE
);
CREATE INDEX hasType_document ON hasType(document);
CREATE INDEX hasType_type     ON hasType(type);

-- typologie de la tradition par OGJ
CREATE TABLE tradition (
  tradid       TEXT UNIQUE NOT NULL,     -- ! identifiant (traditions in tableau OGJ)
  tradlabel    TEXT UNIQUE NOT NULL      -- ! label
);
-- les valeurs autorisées
INSERT INTO 'tradition' ('tradid', 'tradlabel')
  VALUES
  ('cartulaire','Cartulaire'),
  ('cp_authentique','Copie authentique'),
  ('cp_figuree','Copie figurée'),
  ('cp_informe','Copie informe'),
  ('orig','Original'),
  ('orig_multiple','Original multiple'),
  ('chancellerie','Registre de chancellerie');

-- relation document/traditions
CREATE TABLE hasTradition (
  document     INTEGER NOT NULL REFERENCES document(docid),
  tradition    INTEGER REFERENCES tradition(tradid),
  UNIQUE(document, tradition) ON CONFLICT REPLACE
);
CREATE INDEX hasTradition_document  ON hasTradition(document);
CREATE INDEX hasTradition_tradition ON hasTradition(tradition);


-- langues des documents
CREATE TABLE language (
  langcode     TEXT UNIQUE NOT NULL,     -- ! code iso 639-2
  langlabel    TEXT UNIQUE NOT NULL      -- ! label pour impression
);
-- les valeurs autorisées
INSERT INTO 'language' ('langcode', 'langlabel')
  VALUES
  ('fre','Français'),
  ('lat','Latin'),
  ('oci','Occitan');

-- relation document/languages
CREATE TABLE hasLanguage (
  document     INTEGER NOT NULL REFERENCES document(docid),
  langcode     INTEGER REFERENCES language(langcode),
  UNIQUE(document, langcode) ON CONFLICT REPLACE
);
CREATE INDEX hasLanguage_document  ON hasLanguage(document);
CREATE INDEX hasLanguage_langcode  ON hasLanguage(langcode);


-- pays des documents
CREATE TABLE country (
  countryref   INTEGER UNIQUE NOT NULL,  -- ! id (geonames ref)
  countrylabel TEXT UNIQUE NOT NULL      -- ! label
);
INSERT INTO 'country' ('countryref', 'countrylabel')
  VALUES
  ('http://www.geonames.org/3017382/republic-of-france.html','France'),
  ('http://www.geonames.org/2510769/kingdom-of-spain.html','Espagne'),
  ('http://www.geonames.org/2635167/united-kingdom-of-great-britain-and-northern-ireland.html','Angleterre'),
  ('http://www.geonames.org/3077311/czechia.html','République tchèque');

-- relation document / pays de création
CREATE TABLE fromCountry (
  document     INTEGER NOT NULL REFERENCES document(docid),
  country      TEXT REFERENCES country(countryref),
  UNIQUE(document, country) ON CONFLICT REPLACE
);

-- institution de conservation
CREATE TABLE institution (
  institref    TEXT UNIQUE NOT NULL,     -- ? site Internet de l’Institution
  institname   TEXT NOT NULL             -- nom de l’institution pour affichage
);
INSERT INTO 'institution' ('institref', 'institname')
  VALUES
  ('http://data.bnf.fr/ark:/12148/cb12118141m', 'Archives départementales Haute-Vienne (France)'),
  ('http://data.bnf.fr/ark:/12148/cb11864291k', 'Archives départementales Hautes-Alpes (France)'),
  ('http://data.bnf.fr/ark:/12148/cb12006185c', 'Archives départementales Oise (France)'),
  ('http://data.bnf.fr/ark:/12148/cb11865380f', 'Archives départementales Pyrénées-Atlantiques (France)'),
  ('http://data.bnf.fr/ark:/12148/cb118653855', 'Archives départementales Pyrénées-Orientales (France)'),
  ('am_tarascon', 'Archives municipales Tarascon (France)'),
  ('http://data.bnf.fr/ark:/12148/cb11885523k', 'Archives municipales Valenciennes (France)'),
  ('http://data.bnf.fr/ark:/12148/cb11862272t', 'Archives nationales (France)'),
  ('http://data.bnf.fr/ark:/12148/cb12068304t', 'Biblioteca San Lorenzo (Florence, Italie)'),
  ('http://data.bnf.fr/ark:/12148/cb12381002j', 'Bibliothèque nationale de France'),
  ('http://data.bnf.fr/ark:/12148/cb118714563', 'British Library'),
  ('cp', 'Collection privée'),
  ('http://data.bnf.fr/ark:/12148/cb13197296q', 'Collection privée (« Cabinet B. Fillon à Fontenay-Vendée »)'),
  ('cp_bigne', 'Collection privée (« Mr de la Bigne »)'),
  ('cp_meyer', 'Collection privée (« Paul Meyer »)');
