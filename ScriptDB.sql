-- public.insurence definition

-- Drop table

-- DROP TABLE public.insurence;

CREATE TABLE public.insurence (
	id_ins int4 NOT NULL,
	title varchar NOT NULL,
	address varchar NULL,
	inn float4 NULL,
	rs float4 NULL,
	bik varchar NULL,
	CONSTRAINT insurence_pk PRIMARY KEY (id_ins)
);


-- public."order" definition

-- Drop table

-- DROP TABLE public."order";

CREATE TABLE public."order" (
	id_order int4 NOT NULL,
	"date" date NOT NULL,
	stat_ord varchar NULL,
	CONSTRAINT order_pk PRIMARY KEY (id_order)
);


-- public."role" definition

-- Drop table

-- DROP TABLE public."role";

CREATE TABLE public."role" (
	id_role int4 NOT NULL,
	title varchar NOT NULL,
	CONSTRAINT role_pk PRIMARY KEY (id_role)
);


-- public.service definition

-- Drop table

-- DROP TABLE public.service;

CREATE TABLE public.service (
	id_service int4 NOT NULL,
	title varchar NOT NULL,
	price float4 NOT NULL,
	code float4 NULL,
	term date NULL,
	sred_office varchar NULL,
	CONSTRAINT service_pk PRIMARY KEY (id_service)
);


-- public.type_policy definition

-- Drop table

-- DROP TABLE public.type_policy;

CREATE TABLE public.type_policy (
	id_type_policy int4 NOT NULL,
	title varchar NOT NULL,
	CONSTRAINT type_policy_pk PRIMARY KEY (id_type_policy)
);


-- public.order_service definition

-- Drop table

-- DROP TABLE public.order_service;

CREATE TABLE public.order_service (
	id_order_serv int4 NOT NULL,
	id_serv int4 NOT NULL,
	id_ord int4 NOT NULL,
	status_serv varchar NULL,
	CONSTRAINT order_service_pk PRIMARY KEY (id_order_serv),
	CONSTRAINT order_service_fk FOREIGN KEY (id_serv) REFERENCES public.service(id_service),
	CONSTRAINT order_service_fk1 FOREIGN KEY (id_ord) REFERENCES public."order"(id_order)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	id_user int4 NOT NULL,
	login varchar NOT NULL,
	"password" varchar NOT NULL,
	id_role int4 NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (id_user),
	CONSTRAINT users_fk FOREIGN KEY (id_role) REFERENCES public."role"(id_role)
);


-- public.account definition

-- Drop table

-- DROP TABLE public.account;

CREATE TABLE public.account (
	id_account int4 NOT NULL,
	fio varchar NOT NULL,
	id_user int4 NOT NULL,
	CONSTRAINT account_pk PRIMARY KEY (id_account),
	CONSTRAINT account_fk FOREIGN KEY (id_user) REFERENCES public.users(id_user)
);


-- public.lab definition

-- Drop table

-- DROP TABLE public.lab;

CREATE TABLE public.lab (
	id_lab int4 NOT NULL,
	id_user int4 NOT NULL,
	fio varchar NULL,
	last_entry date NULL,
	CONSTRAINT lab_pk PRIMARY KEY (id_lab),
	CONSTRAINT lab_fk FOREIGN KEY (id_user) REFERENCES public.users(id_user)
);


-- public.lab_serv definition

-- Drop table

-- DROP TABLE public.lab_serv;

CREATE TABLE public.lab_serv (
	id int4 NOT NULL,
	id_serv int4 NULL,
	id_lab int4 NULL,
	CONSTRAINT lab_serv_pk PRIMARY KEY (id),
	CONSTRAINT lab_serv_fk FOREIGN KEY (id_lab) REFERENCES public.lab(id_lab),
	CONSTRAINT lab_serv_fk1 FOREIGN KEY (id_serv) REFERENCES public.service(id_service)
);


-- public.patient definition

-- Drop table

-- DROP TABLE public.patient;

CREATE TABLE public.patient (
	id_patient int4 NOT NULL,
	fio varchar NOT NULL,
	id_user int4 NOT NULL,
	bday date NULL,
	sin float4 NULL,
	phone numeric NULL,
	email varchar NULL,
	CONSTRAINT patient_pk PRIMARY KEY (id_patient),
	CONSTRAINT patient_fk FOREIGN KEY (id_user) REFERENCES public.users(id_user)
);


-- public."policy" definition

-- Drop table

-- DROP TABLE public."policy";

CREATE TABLE public."policy" (
	id_policy int4 NOT NULL,
	id_patient int4 NOT NULL,
	id_ins int4 NOT NULL,
	id_type_policy int4 NOT NULL,
	"number" float4 NOT NULL,
	CONSTRAINT policy_pk PRIMARY KEY (id_policy),
	CONSTRAINT policy_fk FOREIGN KEY (id_type_policy) REFERENCES public.type_policy(id_type_policy),
	CONSTRAINT policy_fk1 FOREIGN KEY (id_ins) REFERENCES public.insurence(id_ins),
	CONSTRAINT policy_fk2 FOREIGN KEY (id_patient) REFERENCES public.patient(id_patient)
);


-- public.complete definition

-- Drop table

-- DROP TABLE public.complete;

CREATE TABLE public.complete (
	id_com int4 NOT NULL,
	id_serv int4 NOT NULL,
	id_lab int4 NOT NULL,
	id_patient int4 NOT NULL,
	id_alalizer int4 NOT NULL,
	id_order int4 NOT NULL,
	CONSTRAINT commpls_pk PRIMARY KEY (id_com),
	CONSTRAINT complete_fk FOREIGN KEY (id_serv) REFERENCES public.service(id_service),
	CONSTRAINT complete_fk1 FOREIGN KEY (id_order) REFERENCES public."order"(id_order),
	CONSTRAINT complete_fk2 FOREIGN KEY (id_lab) REFERENCES public.lab(id_lab),
	CONSTRAINT complete_fk3 FOREIGN KEY (id_patient) REFERENCES public.patient(id_patient)
);


-- public."check" definition

-- Drop table

-- DROP TABLE public."check";

CREATE TABLE public."check" (
	id_check int4 NOT NULL,
	id_com int4 NOT NULL,
	id_ins int4 NOT NULL,
	id_acc int4 NOT NULL,
	CONSTRAINT check_pk PRIMARY KEY (id_check),
	CONSTRAINT check_fk FOREIGN KEY (id_ins) REFERENCES public.insurence(id_ins),
	CONSTRAINT check_fk1 FOREIGN KEY (id_com) REFERENCES public.complete(id_com),
	CONSTRAINT check_fk2 FOREIGN KEY (id_acc) REFERENCES public.account(id_account)
);
INSERT INTO public."role" (id_role,title) VALUES
	 (1,'lab'),
	 (2,'patient'),
	 (3,'accountant');
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (1,'chacking0','4tzqHdkqzo4',1),
	 (3,'frolf2','7QpCwac0yi',1),
	 (4,'lraden3','5Ydp2mz',1),
	 (5,'bfollos4','ckmAJPQV',1),
	 (13,'nbountiffc','5xfyjS9ZULGA',1),
	 (16,'cstickinsf','QRYADbgNj',1),
	 (21,'kkinmank','qUr6fdWP6L5G',1),
	 (26,'mthurbyp','wg0uIskqei',1),
	 (39,'sbirney12','Ggygo2ePsETs',1),
	 (56,'bterrell1j','hswseW',1);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (57,'dbifield1k','oYAQ4URihIA',1),
	 (60,'ebartak1n','y3t4H1',1),
	 (61,'vwillshire1o','VFSLc2t',1),
	 (65,'cnorthrop1s','UIwCvTA7MRS0',1),
	 (70,'aeldon1x','rrywOQRmFKyh',1),
	 (71,'kcollin1y','Q0ZV21vew0',1),
	 (72,'ilarkins1z','DEFNpHtU',1),
	 (73,'wlound20','a2G4Ihh2o',1),
	 (78,'rleestut25','zq3C4rUR',1),
	 (80,'bdouch27','KAkwrli',1);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (82,'hizzat29','Uifdtu',1),
	 (86,'bpattenden2d','IOUkHpOn',1),
	 (87,'acockman2e','fDKhK7OK',1),
	 (90,'gciccoloi2h','w4dZ3hxiCiAg',1),
	 (92,'wgentiry2j','z2X9UH5',1),
	 (94,'ckulic2l','FLHYRN',1),
	 (96,'mrolinson2n','faGzyW8hEca',1),
	 (2,'nmably1','ukM0e6',2),
	 (6,'menterle5','0PRom6i',2),
	 (7,'mpeaker6','0Tc5oRc',2);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (8,'mrobichon7','LEwEjMlmE5X',2),
	 (11,'jfussiea','EGxXuLQ9',2),
	 (12,'santonaccib','YcXAhY3Pja',2),
	 (20,'abutteryj','ttOFbWWGtD',2),
	 (24,'cspeedingn','UCLYITfw2Vo',2),
	 (27,'croxbroughq','67CVVym',2),
	 (29,'icallejas','aeDvZk8o9',2),
	 (31,'sallseppu','t0ko0854Cpvv',2),
	 (32,'eabbatucciv','gUtNdsDu',2),
	 (33,'sgarnhamw','eml6RqbK',2);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (34,'rkitchensidex','xaa7miQ7yB',2),
	 (35,'udiy','dHqu78cU6NOP',2),
	 (36,'mbeidebekez','F5T5spAU9A4O',2),
	 (37,'bsavins10','l6sYf29NLN',2),
	 (38,'sriby11','Va34LYqFh',2),
	 (40,'ikleanthous13','3H0GS7a',2),
	 (41,'mskerme14','wy1HWA',2),
	 (43,'trusling16','abol9dYC8e',2),
	 (44,'jde17','gK6Hsl8Q',2),
	 (45,'fmcleoid18','B9zr0N7cJw',2);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (46,'nmegainey19','gph7QurFf',2),
	 (49,'nredington1c','DCbOb1SX',2),
	 (50,'lfrancie1d','DoGeHWuAAM',2),
	 (51,'ablowin1e','aQygVtMjN',2),
	 (55,'ecollett1i','Y0uMyKB0W',2),
	 (62,'esavin1p','axnJY9s',2),
	 (63,'pelsom1q','OXzMECG',2),
	 (64,'asemaine1r','MdJRkHor5SP',2),
	 (66,'reasson1t','3J0jgg9RWlXs',2),
	 (68,'hscholfield1v','1Pbs3K6qXYB',2);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (74,'mgillogley21','EjUHfCUFqF',2),
	 (76,'jleadbetter23','ZNsaKdgb',2),
	 (84,'sfierro2b','VjUrQ2',2),
	 (85,'ntroup2c','KmDDYf1Pu',2),
	 (88,'mhanscome2f','xBHzpa7eP0u',2),
	 (89,'sleblanc2g','T2et1U5M',2),
	 (91,'ssayburn2i','1hTM7EVKaS',2),
	 (93,'rwestall2k','xLgunbO9x6',2),
	 (98,'bretchless2p','WraGihh',2),
	 (99,'rjerzak2q','hAp8jki',2);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (100,'vboots2r','bgJfSDEVEQm6',2),
	 (9,'srobken8','Cbmj3Yi',3),
	 (10,'btidmas9','dYDHbBQfK',3),
	 (14,'cbenjefieldd','tQOsP0ei9TuD',3),
	 (15,'ocorbyne','bG1ZIzwIoU',3),
	 (17,'dclarageg','Yp59ZIDnWe',3),
	 (18,'jmccawleyh','g58zLcmCYON',3),
	 (19,'dbandi','yFAaYuVW',3),
	 (22,'sskepperl','jHYN0v3',3),
	 (23,'ayeolandm','QQezRBV9',3);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (25,'ascarisbricko','fzBcv6GbyCp',3),
	 (28,'pmccotterr','QG5tdzRpGZJ2',3),
	 (30,'nbroscht','DmPJt2',3),
	 (42,'hcahey15','NSXcG9khd',3),
	 (47,'abliven1a','vVxlf94KpeX',3),
	 (48,'mrossoni1b','nLXj2lS',3),
	 (52,'vgoroni1f','bWr0QU',3),
	 (53,'sgrafom1g','JcNcVDAouYzA',3),
	 (54,'jgianneschi1h','oieX5u3sUfpD',3),
	 (58,'bstaig1l','MygqEtjMtUbC',3);
INSERT INTO public.users (id_user,login,"password",id_role) VALUES
	 (59,'akennsley1m','CTUdBfJsy6qF',3),
	 (67,'aboleyn1u','3q2mQdDRmtr',3),
	 (69,'ccowpe1w','VHr417Ft0',3),
	 (75,'dmuccino22','E4okVgx',3),
	 (77,'gtrump24','6XXY7IS26Ci',3),
	 (79,'janscott26','5maCRrCZLu',3),
	 (81,'cossenna28','vfKJkCeohOzZ',3),
	 (83,'egimeno2a','oF1hbmKlZ',3),
	 (95,'lroux2m','98cCxHeeK31',3),
	 (97,'sellgood2o','3do5MME',3);
INSERT INTO public.service (id_service,title,price,code,term,sred_office) VALUES
	 (1,'Билирубин общий',102.85,176.0,NULL,NULL),
	 (2,'СПИД',341.78,229.0,NULL,NULL),
	 (3,'Креатинин',143.22,258.0,NULL,NULL),
	 (4,'Волчаночный антикоагулянт',290.11,287.0,NULL,NULL),
	 (5,'Амилаза',361.88,311.0,NULL,NULL),
	 (6,'Глюкоза',447.65,323.0,NULL,NULL),
	 (7,'Общий белок',396.03,346.0,NULL,NULL),
	 (8,'Кальций общий',419.9,415.0,NULL,NULL),
	 (9,'Гепатит В',176.83,501.0,NULL,NULL),
	 (10,'Гепатит С',289.99,543.0,NULL,NULL);
INSERT INTO public.service (id_service,title,price,code,term,sred_office) VALUES
	 (11,'Альбумин',234.09,548.0,NULL,NULL),
	 (12,'ВИЧ',490.77,557.0,NULL,NULL),
	 (13,'TSH',262.71,619.0,NULL,NULL),
	 (14,'Сифилис RPR',443.66,659.0,NULL,NULL),
	 (15,'АТ и АГ к ВИЧ 1/2',370.62,797.0,NULL,NULL),
	 (16,'Железо',105.32,836.0,NULL,NULL),
	 (17,'Ковид IgM',209.78,855.0,NULL,NULL);
INSERT INTO public.patient (id_patient,fio,id_user,bday,sin,phone,email) VALUES
	 (1,'Northrop Mably',2,NULL,NULL,NULL,NULL),
	 (2,'Mile Enterle',6,NULL,NULL,NULL,NULL),
	 (3,'Midge Peaker',7,NULL,NULL,NULL,NULL),
	 (4,'Manon Robichon',8,NULL,NULL,NULL,NULL),
	 (5,'Jeannette Fussie',11,NULL,NULL,NULL,NULL),
	 (6,'Stephen Antonacci',12,NULL,NULL,NULL,NULL),
	 (7,'Angil Buttery',20,NULL,NULL,NULL,NULL),
	 (8,'Claudie Speeding',24,NULL,NULL,NULL,NULL),
	 (9,'Cloe Roxbrough',27,NULL,NULL,NULL,NULL),
	 (10,'Iggie Calleja',29,NULL,NULL,NULL,NULL);
INSERT INTO public.patient (id_patient,fio,id_user,bday,sin,phone,email) VALUES
	 (11,'Shae Allsepp',31,NULL,NULL,NULL,NULL),
	 (12,'Eldridge Abbatucci',32,NULL,NULL,NULL,NULL),
	 (13,'Skip Garnham',33,NULL,NULL,NULL,NULL),
	 (14,'Ric Kitchenside',34,NULL,NULL,NULL,NULL),
	 (15,'Urbanus Di Meo',35,NULL,NULL,NULL,NULL),
	 (16,'Monty Beidebeke',36,NULL,NULL,NULL,NULL),
	 (17,'Byrann Savins',37,NULL,NULL,NULL,NULL),
	 (18,'Sonnie Riby',38,NULL,NULL,NULL,NULL),
	 (19,'Indira Kleanthous',40,NULL,NULL,NULL,NULL),
	 (20,'Maison Skerme',41,NULL,NULL,NULL,NULL);
INSERT INTO public.patient (id_patient,fio,id_user,bday,sin,phone,email) VALUES
	 (21,'Tore Rusling',43,NULL,NULL,NULL,NULL),
	 (22,'Jeddy De Souza',44,NULL,NULL,NULL,NULL),
	 (23,'Flossi McLeoid',45,NULL,NULL,NULL,NULL),
	 (24,'Nikoletta Megainey',46,NULL,NULL,NULL,NULL),
	 (25,'Nappie Redington',49,NULL,NULL,NULL,NULL),
	 (26,'Lenka Francie',50,NULL,NULL,NULL,NULL),
	 (27,'Ashley Blowin',51,NULL,NULL,NULL,NULL),
	 (28,'Emilie Collett',55,NULL,NULL,NULL,NULL),
	 (29,'Egon Savin',62,NULL,NULL,NULL,NULL),
	 (30,'Phillie Elsom',63,NULL,NULL,NULL,NULL);
INSERT INTO public.patient (id_patient,fio,id_user,bday,sin,phone,email) VALUES
	 (31,'Adan Semaine',64,NULL,NULL,NULL,NULL),
	 (32,'Rodie Easson',66,NULL,NULL,NULL,NULL),
	 (33,'Hill Scholfield',68,NULL,NULL,NULL,NULL),
	 (34,'Mechelle Gillogley',74,NULL,NULL,NULL,NULL),
	 (35,'Joye Leadbetter',76,NULL,NULL,NULL,NULL),
	 (36,'Sybyl Fierro',84,NULL,NULL,NULL,NULL),
	 (37,'Nicol Troup',85,NULL,NULL,NULL,NULL),
	 (38,'Mord Hanscome',88,NULL,NULL,NULL,NULL),
	 (39,'Susy Leblanc',89,NULL,NULL,NULL,NULL),
	 (40,'Seamus Sayburn',91,NULL,NULL,NULL,NULL);
INSERT INTO public.patient (id_patient,fio,id_user,bday,sin,phone,email) VALUES
	 (41,'Rebekkah Westall',93,NULL,NULL,NULL,NULL),
	 (42,'Barbabra Retchless',98,NULL,NULL,NULL,NULL),
	 (43,'Robinetta Jerzak',99,NULL,NULL,NULL,NULL),
	 (44,'Vance Boots',100,NULL,NULL,NULL,NULL);
INSERT INTO public.account (id_account,fio,id_user) VALUES
	 (1,'Stavro Robken',9),
	 (2,'Bryan Tidmas',10),
	 (3,'Clemente Benjefield',14),
	 (4,'Orlan Corbyn',15),
	 (5,'Daveta Clarage',17),
	 (6,'Javier McCawley',18),
	 (7,'Daile Band',19),
	 (8,'Selena Skepper',22),
	 (9,'Alyson Yeoland',23),
	 (10,'Alaric Scarisbrick',25);
INSERT INTO public.account (id_account,fio,id_user) VALUES
	 (11,'Pegeen McCotter',28),
	 (12,'Nelle Brosch',30),
	 (13,'Hanan Cahey',42),
	 (14,'Adan Bliven',47),
	 (15,'Mohandis Rossoni',48),
	 (16,'Vale Goroni',52),
	 (17,'Suki Grafom',53),
	 (18,'Justis Gianneschi',54),
	 (19,'Blanca Staig',58),
	 (20,'Adriaens Kennsley',59);
INSERT INTO public.account (id_account,fio,id_user) VALUES
	 (21,'Alida Boleyn',67),
	 (22,'Cordell Cowpe',69),
	 (23,'Donal Muccino',75),
	 (24,'Gianina Trump',77),
	 (25,'Jill Anscott',79),
	 (26,'Cicily Ossenna',81),
	 (27,'Eddie Gimeno',83),
	 (28,'Lorilee Roux',95),
	 (29,'Shelbi Ellgood',97);
INSERT INTO public.lab (id_lab,id_user,fio,last_entry) VALUES
	 (1,1,'Clareta Hacking','2020-02-10'),
	 (2,3,'Fabian Rolf','2020-05-19'),
	 (3,4,'Lauree Raden','2020-06-22'),
	 (4,5,'Barby Follos','2020-03-18'),
	 (5,13,'Niccolo Bountiff','2020-01-22'),
	 (6,16,'Coreen Stickins','2020-04-20'),
	 (7,21,'Kyla Kinman','2019-11-08'),
	 (8,26,'Marie Thurby','2019-09-18'),
	 (9,39,'Sherill Birney','2019-12-27'),
	 (10,56,'Byrom Terrell','2020-02-25');
INSERT INTO public.lab (id_lab,id_user,fio,last_entry) VALUES
	 (11,57,'Daphne Bifield','2020-07-29'),
	 (12,60,'Emlyn Bartak','2019-12-20'),
	 (13,61,'Victoria Willshire','2020-09-03'),
	 (14,65,'Constantino Northrop','2019-10-12'),
	 (15,70,'Alexandro Eldon','2019-12-04'),
	 (16,71,'Kayle Collin','2020-06-30'),
	 (17,72,'Inesita Larkins','2019-12-05'),
	 (18,73,'Waylin Lound','2020-01-26'),
	 (19,78,'Read LeEstut','2020-09-11'),
	 (20,80,'Bud Douch','2020-02-06');
INSERT INTO public.lab (id_lab,id_user,fio,last_entry) VALUES
	 (21,82,'Hew Izzat','2020-01-20'),
	 (22,86,'Bondy Pattenden','2020-06-15'),
	 (23,87,'Angus Cockman','2020-01-06'),
	 (24,90,'Gerard Ciccoloi','2020-02-03'),
	 (25,92,'Washington Gentiry','2020-04-10'),
	 (26,94,'Court Kulic','2020-06-26'),
	 (27,96,'Modestine Rolinson','2019-10-30');
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (1,12,1),
	 (2,16,1),
	 (3,4,1),
	 (4,1,2),
	 (5,16,2),
	 (6,1,3),
	 (7,3,3),
	 (8,10,4),
	 (9,8,4),
	 (10,13,4);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (11,12,4),
	 (12,6,5),
	 (13,5,5),
	 (14,12,5),
	 (15,12,6),
	 (16,7,7),
	 (17,17,7),
	 (18,6,7),
	 (19,12,7),
	 (20,9,7);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (21,11,8),
	 (22,17,8),
	 (23,16,9),
	 (24,3,9),
	 (25,13,9),
	 (26,4,10),
	 (27,12,10),
	 (28,10,10),
	 (29,13,11),
	 (30,6,11);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (31,17,11),
	 (32,2,11),
	 (33,10,12),
	 (34,12,13),
	 (35,4,13),
	 (36,16,13),
	 (37,4,13),
	 (38,1,14),
	 (39,2,14),
	 (40,16,15);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (41,7,15),
	 (42,16,5),
	 (43,7,16),
	 (44,11,17),
	 (45,3,17),
	 (46,5,17),
	 (47,2,17),
	 (48,13,18),
	 (49,14,18),
	 (50,7,18);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (51,6,19),
	 (52,4,19),
	 (53,14,19),
	 (54,1,19),
	 (55,4,20),
	 (56,4,21),
	 (57,9,21),
	 (58,4,21),
	 (59,5,21),
	 (60,16,22);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (61,2,22),
	 (62,7,22),
	 (63,7,22),
	 (64,6,23),
	 (65,2,23),
	 (66,3,23),
	 (67,3,23),
	 (68,8,23),
	 (69,11,24),
	 (70,5,24);
INSERT INTO public.lab_serv (id,id_serv,id_lab) VALUES
	 (71,7,24),
	 (72,5,24),
	 (73,6,25),
	 (74,17,25),
	 (75,2,25),
	 (76,6,26),
	 (77,5,27),
	 (78,17,27),
	 (79,15,27),
	 (80,17,27);
