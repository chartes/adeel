create table alignment_discours
(
	transcription_id INTEGER,
	ptr_start INT,
	ptr_end INT,
	speech_part_type_id INTEGER,
	note TEXT,
	constraint alignment_discours_transcription_id_ptr_start_pk
		primary key (transcription_id, ptr_start)
)
;

create table alignment_image
(
	transcription_id integer,
	zone_id integer,
	type TEXT not null,
	ptr_transcription_start integer,
	ptr_transcription_end integer,
	constraint alignement_transcription_facsimile
		primary key (transcription_id, zone_id, type)
)
;

create table alignment_translation
(
	transcription_id integer,
	translation_id integer,
	ptr_transcription_start integer not null,
	ptr_transcription_end integer not null,
	ptr_translation_start integer not null,
	ptr_translation_end integer not null,
	constraint alignement_transcription_translation
		primary key (transcription_id, translation_id, ptr_transcription_start)
)
;

create unique index alignment_translation_transcription_id_translation_id_ptr_transcription_start_uindex
	on alignment_translation (transcription_id, translation_id, ptr_transcription_start)
;

create table commentary
(
	doc_id INTEGER not null,
	com_id INTEGER
		primary key,
	type_id INTEGER not null,
	content TEXT not null,
	title TEXT
)
;

create unique index commentary_type_id_uindex
	on commentary (type_id)
;

create table country
(
	country_ref TEXT not null
		constraint country_country_ref_pk
			primary key,
	country_label TEXT not null
)
;

create unique index country_country_ref_uindex
	on country (country_ref)
;

create unique index country_country_label_uindex
	on country (country_label)
;

create table district
(
	district_id INTEGER
		primary key
		 autoincrement,
	district_label TEXT,
	country_ref TEXT
		constraint district_country_country_ref_fk
			references country (country_ref)
)
;

create unique index district_district_label_uindex
	on district (district_label)
;

create table document
(
	doc_id INTEGER
		primary key,
	title TEXT,
	subtitle TEXT,
	creation INTEGER,
	creation_lab TEXT,
	copy_year TEXT,
	copy_cent INTEGER,
	institution_ref TEXT,
	pressmark TEXT,
	argument TEXT,
	date_insert INTEGER,
	date_update INTEGER
)
;

alter table commentary
	add constraint commentary_document_doc_id_fk
		foreign key (doc_id) references document (doc_id)
;

create table documentFromCountry
(
	doc_id INTEGER not null
		constraint documentFromCountry_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	country_ref INTEGER not null
		constraint documentFromCountry_country_country_ref_fk
			references country (country_ref)
				on delete cascade,
	constraint documentFromCountry_doc_id_country_ref_pk
		primary key (doc_id, country_ref)
)
;

create unique index documentFromCountry_doc_id_country_ref_uindex
	on documentFromCountry (doc_id, country_ref)
;

create table documentFromDistrict
(
	doc_id INTEGER
		constraint documentFromDistrict_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	district_id INTEGER
		constraint documentFromDistrict_district_district_id_fk
			references district (district_id)
				on delete cascade,
	constraint documentFromDistrict_doc_id_district_id_pk
		primary key (doc_id, district_id)
)
;

create table documentHasEditor
(
	doc_id INTEGER
		constraint documentHasEditor_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	editor_name TEXT,
	constraint documentHasEditor_doc_id_author_name_pk
		primary key (doc_id, editor_name)
)
;

create table documentHasLanguage
(
	doc_id INTEGER
		constraint documentHasLangage_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	lang_code TEXT,
	constraint documentHasLangage_doc_id_lang_code_pk
		primary key (doc_id, lang_code)
)
;

create unique index documentHasLangage_doc_id_lang_code_uindex
	on documentHasLanguage (doc_id, lang_code)
;

create table documentHasTradition
(
	doc_id INTEGER
		constraint documentHasTradition_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	tradition_id TEXT,
	constraint documentHasTradition_doc_id_tradition_id_pk
		primary key (doc_id, tradition_id)
)
;

create unique index documentHasTradition_doc_id_tradition_id_uindex
	on documentHasTradition (doc_id, tradition_id)
;

create table documentHasTypeActe
(
	doc_id INTEGER
		constraint documentHasType_document_doc_id_fk
			references document (doc_id)
				on update cascade on delete cascade,
	type_id INTEGER,
	constraint documentHasType_doc_id_type_id_pk
		primary key (doc_id, type_id)
)
;

create unique index documentHasType_doc_id_type_id_uindex
	on documentHasTypeActe (doc_id, type_id)
;

create table documentLinkedToDocument
(
	doc_id INTEGER not null
		constraint documentLinkedToDocument_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	linked_doc_id INTEGER not null
		constraint documentLinkedToDocument_document_doc_id_fk
			references document (doc_id)
				on delete cascade,
	constraint documentLinkedToDocument_doc_id_linked_doc_id_pk
		primary key (doc_id, linked_doc_id)
)
;

create index documentLinkedToDocument_linked_doc_id_index
	on documentLinkedToDocument (linked_doc_id)
;

create table editor
(
	editor_ref TEXT,
	editor_name TEXT
		primary key
)
;

create index editor_editor_name_index
	on editor (editor_name)
;

alter table documentHasEditor
	add constraint documentHasEditor_editor_editor_name_fk
		foreign key (editor_name) references editor (editor_name)
;

create table image
(
	img_url TEXT not null
		primary key,
	doc_id INTEGER not null
		constraint image_document_doc_id_fk
			references document (doc_id),
	img_desc TEXT
)
;

create unique index image_img_url_uindex
	on image (img_url)
;

create table image_zone
(
	img_url TEXT not null
		constraint image_zone_image_img_url_fk
			references image (img_url)
				on delete cascade,
	zone_id INTEGER not null,
	coords TEXT,
	constraint image_zone_zone_id_img_url_pk
		primary key (img_url, zone_id)
)
;

create unique index image_zone_zone_id_img_url_uindex
	on image_zone (img_url, zone_id)
;

alter table alignment_image
	add constraint zone
		foreign key (zone_id) references image_zone (zone_id)
			on delete cascade
;

create table institution
(
	instit_ref TEXT not null
		primary key,
	instit_name INT not null
)
;

create unique index institution_instit_ref_uindex
	on institution (instit_ref)
;

alter table document
	add constraint document_institution_instit_ref_fk
		foreign key (institution_ref) references institution (instit_ref)
;

create table language
(
	lang_code TEXT,
	lang_label TEXT
)
;

create unique index langage_langcode_uindex
	on language (lang_code)
;

create index langage_lang_label_index
	on language (lang_label)
;

alter table documentHasLanguage
	add constraint documentHasLangage_langage_lang_code_fk
		foreign key (lang_code) references language (lang_code)
			on delete cascade
;

create table speech_part_type
(
	speech_part_type_id INTEGER,
	lang_code TEXT not null
		constraint speech_part_language_lang_code_fk
			references language (lang_code),
	label TEXT not null,
	definition TEXT,
	constraint speech_part_speech_part_id_lang_code_pk
		primary key (speech_part_type_id, lang_code)
)
;

alter table alignment_discours
	add constraint alignment_discours_speech_part_type_speech_part_type_id_fk
		foreign key (speech_part_type_id) references speech_part_type (speech_part_type_id)
;

create table tradition
(
	tradition_id TEXT not null
		primary key,
	tradition_label TEXT not null
)
;

create unique index tradition_tradition_id_uindex
	on tradition (tradition_id)
;

create index tradition_tradition_label_index
	on tradition (tradition_label)
;

alter table documentHasTradition
	add constraint documentHasTradition_tradition_tradition_id_fk
		foreign key (tradition_id) references tradition (tradition_id)
			on delete cascade
;

create table transcription
(
	transcription_id INTEGER
		primary key
		 autoincrement,
	doc_id INTEGER
		constraint transcription_document
			references document (doc_id)
				on delete cascade,
	user_ref TEXT,
	content TEXT
)
;

alter table alignment_discours
	add constraint alignment_discours_transcription_transcription_id_fk
		foreign key (transcription_id) references transcription (transcription_id)
;

alter table alignment_image
	add constraint transcription
		foreign key (transcription_id) references transcription (transcription_id)
			on delete cascade
;

alter table alignment_translation
	add constraint transcription
		foreign key (transcription_id) references transcription (transcription_id)
			on delete cascade
;

create table translation
(
	translation_id INTEGER
		primary key
		 autoincrement,
	doc_id INTEGER
		constraint document_id
			references document (doc_id)
				on delete cascade,
	user_ref TEXT,
	content TEXT
)
;

alter table alignment_translation
	add constraint translation
		foreign key (translation_id) references translation (translation_id)
			on delete cascade
;

create table type_acte
(
	type_id INTEGER not null,
	label TEXT not null,
	description TEXT
)
;

create unique index type_acte_type_id_uindex
	on type_acte (type_id)
;

create unique index type_acte_type_label_uindex
	on type_acte (label)
;

alter table documentHasTypeActe
	add constraint documentHasType_type_acte_type_id_fk
		foreign key (type_id) references type_acte (type_id)
			on update cascade on delete cascade
;

create table type_commentary
(
	type_id INTEGER not null,
	type_label TEXT not null
)
;

create unique index type_commentary_type_id_uindex
	on type_commentary (type_id)
;

create unique index type_commentary_type_label_uindex
	on type_commentary (type_label)
;

alter table commentary
	add constraint commentary_type_commentary_type_id_fk
		foreign key (type_id) references type_commentary (type_id)
;

create table user
(
	username TEXT not null
		primary key,
	firstname TEXT not null,
	lastname TEXT not null,
	mail TEXT not null
)
;

create unique index user_username_uindex
	on user (username)
;

alter table transcription
	add constraint transcription_user
		foreign key (user_ref) references user (username)
;

alter table translation
	add constraint translation_user
		foreign key (user_ref) references user (username)
;
