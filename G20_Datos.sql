--SCRIPT DATOS
-- tipos usuario
insert into gr20_tipo_usuario (id_tipo_usuario, descripcion) VALUES (1,'Admin');
insert into gr20_tipo_usuario (id_tipo_usuario, descripcion) VALUES (2,'Socializado');
insert into gr20_tipo_usuario (id_tipo_usuario, descripcion) VALUES (3,'Competidor');

-- usuario
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (1,'Vega','Kasimir','a tortor.',2,'Proin');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (2,'Waller','Amir','mollis non,',1,'magna.');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (3,'Hendrix','Xerxes','Morbi vehicula.',2,'massa.');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (4,'Mcknight','Samson','feugiat non,',3,'vitae');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (5,'Sellers','Ila','mattis. Integer',3,'orci');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (6,'George','Ocean','Etiam laoreet,',3,'dui');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (7,'Ryan','Baker','mus. Aenean',1,'quis');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (8,'Vang','Yasir','egestas, urna',1,'molestie');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (9,'Burnett','Jasmine','auctor ullamcorper,',1,'Praesent');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (10,'Miller','Elmo','Vivamus nisi.',1,'vel,');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (11,'Schultz','Colt','eu dui.',1,'quam,');
INSERT INTO "gr20_usuario" (id_usuario,apellido,nombre,email,id_tipo_usuario,password) VALUES (12,'Ratliff','Lewis','Sed neque.',2,'arcu.');

-- nivel juego
insert into gr20_nivel (id_nivel_juego, descripcion) VALUES (1,'principiante');
insert into gr20_nivel (id_nivel_juego, descripcion) VALUES (2,'intermedio');
insert into gr20_nivel (id_nivel_juego, descripcion) VALUES (3,'avanzado');

-- categoria juego
insert into gr20_categoria (id_categoria, descripcion, id_nivel_juego) VALUES (1,'aaa',1);
insert into gr20_categoria (id_categoria, descripcion, id_nivel_juego) VALUES (2,'bbb',2);
insert into gr20_categoria (id_categoria, descripcion, id_nivel_juego) VALUES (3,'ccc',3);

-- juego
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (1,'est','tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (2,'aptent','Sed neque.',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (3,'dignissim.','eget, dictum placerat, augue.',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (4,'lorem','at auctor ullamcorper, nisl arcu iaculis enim,',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (5,'libero.','eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi.',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (6,'mollis','amet, consectetuer',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (7,'luctus','lobortis ultrices.',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (8,'aliquet','quis',2);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (9,'dolor','sem semper erat, in consectetuer ipsum nunc id enim.',1);
INSERT INTO "gr20_juego" (id_juego,nombre_juego,descripcion_juego,id_categoria) VALUES (10,'pede','justo eu arcu. Morbi sit',2);

-- juega
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('true',5,6);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('false',9,5);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('false',8,2);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('true',10,5);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('true',11,3);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('true',9,1);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('false',2,8);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('false',2,4);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('true',10,6);
INSERT INTO "gr20_juega" (finalizado,id_usuario,id_juego) VALUES ('false',2,2);

-- voto
INSERT INTO "gr20_voto" (id_voto,valor_voto,id_usuario,id_juego) VALUES (1,10,5,6);
INSERT INTO "gr20_voto" (id_voto,valor_voto,id_usuario,id_juego) VALUES (2,4,9,5);
INSERT INTO "gr20_voto" (id_voto,valor_voto,id_usuario,id_juego) VALUES (3,8,8,2);
INSERT INTO "gr20_voto" (id_voto,valor_voto,id_usuario,id_juego) VALUES (4,6,10,5);
INSERT INTO "gr20_voto" (id_voto,valor_voto,id_usuario,id_juego) VALUES (5,9,11,3);
INSERT INTO "gr20_voto" (id_voto,valor_voto,id_usuario,id_juego) VALUES (6,8,9,1);

-- comentario
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (5,6,1,'09-07-19','lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan');
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (9,5,2,'01-01-20','rhoncus id, mollis nec, cursus a,');
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (8,2,3,'2-03-20','dapibus rutrum, justo. Praesent');
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (10,5,4,'06-11-20','nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo');
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (11,3,5,'1-04-19','est, congue a, aliquet vel,');

-- recomendacion
INSERT INTO "gr20_recomendacion" (id_recomendacion,email_recomendado,id_usuario,id_juego) VALUES (1,'ac orci.',5,6);
INSERT INTO "gr20_recomendacion" (id_recomendacion,email_recomendado,id_usuario,id_juego) VALUES (2,'adipiscing, enim',9,5);
INSERT INTO "gr20_recomendacion" (id_recomendacion,email_recomendado,id_usuario,id_juego) VALUES (3,'ut, pharetra',8,2);
INSERT INTO "gr20_recomendacion" (id_recomendacion,email_recomendado,id_usuario,id_juego) VALUES (4,'quam a',10,5);
INSERT INTO "gr20_recomendacion" (id_recomendacion,email_recomendado,id_usuario,id_juego) VALUES (5,'Curabitur sed',11,3);
INSERT INTO "gr20_recomendacion" (id_recomendacion,email_recomendado,id_usuario,id_juego) VALUES (6,'vulputate, risus',9,1);


--TEST RESTRICCIONES Y TRIGGERS

--TEST 1A) FECHA PRIMER COMENTARIO MENOR A FECHA ULTIMO COMENTARIO
INSERT INTO gr20_comenta(id_usuario, id_juego, fecha_primer_com, fecha_ultimo_com) VALUES (2,2,'2003-04-12 04:05:06','2002-04-12 04:05:06');
--TEST 1B) TRIGGER UNICO COMENTARIO DIARIO
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (5,6,6,'09-08-19','test unico comentario diario por juego');
INSERT INTO "gr20_comentario" (id_usuario,id_juego,id_comentario,fecha_comentario,comentario) VALUES (5,6,7,'09-08-19','test unico comentario diario por juego');
--TEST 1C) TRIGGER RECOMENDAR SIN VOTAR
INSERT INTO gr20_recomendacion(id_recomendacion, email_recomendado, id_usuario, id_juego) VALUES (7,'aa',2,2);
--TEST 1D) TRIGGER COMENTAR UN JUEGO QUE NO AH JUGADO
INSERT INTO gr20_comenta(id_usuario, id_juego, fecha_primer_com, fecha_ultimo_com) VALUES (1,1,'09-08-19',null);
--TEST SERVICIOS
SELECT * FROM gr20_comenta;
INSERT INTO gr20_comentario(id_usuario, id_juego, id_comentario, fecha_comentario, comentario) VALUES (2,2,7,'09-08-19','test trigger');
SELECT * FROM gr20_comenta;
INSERT INTO gr20_comentario(id_usuario, id_juego, id_comentario, fecha_comentario, comentario) VALUES (2,2,8,'10-08-27','test trigger');
SELECT * FROM gr20_comenta;
DELETE FROM gr20_comentario WHERE id_comentario = 8;
SELECT * FROM gr20_comenta;
--FIN