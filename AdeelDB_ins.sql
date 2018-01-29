DELETE FROM institution;
DELETE FROM country;
DELETE FROM type_acte;
DELETE FROM tradition;
DELETE FROM language;

INSERT INTO 'institution' ('instit_ref', 'instit_name')
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


INSERT INTO 'country' ('country_ref', 'country_label')
  VALUES
  ('http://www.geonames.org/3017382/republic-of-france.html','France'),
  ('http://www.geonames.org/2510769/kingdom-of-spain.html','Espagne'),
  ('http://www.geonames.org/2635167/united-kingdom-of-great-britain-and-northern-ireland.html','Angleterre'),
  ('http://www.geonames.org/3077311/czechia.html','République tchèque');


INSERT INTO 'language' ('lang_code', 'lang_label')
  VALUES
  ('fre','Français'),
  ('lat','Latin'),
  ('oci','Occitan');


INSERT INTO 'tradition' ('tradition_id', 'tradition_label')
  VALUES
  ('cartulaire','Cartulaire'),
  ('cp_authentique','Copie authentique'),
  ('cp_figuree','Copie figurée'),
  ('cp_informe','Copie informe'),
  ('orig','Original'),
  ('orig_multiple','Original multiple'),
  ('chancellerie','Registre de chancellerie');


-- valeurs autorisées
INSERT INTO 'type_acte' ('type_id', 'type_label')
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
