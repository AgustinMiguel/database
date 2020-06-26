-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-06-22 20:47:33.64

-- tables
-- Table: GR20_CATEGORIA
CREATE TABLE GR20_CATEGORIA (
    id_categoria int  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    id_nivel_juego int  NOT NULL,
    CONSTRAINT PK_GR20_CATEGORIA PRIMARY KEY (id_categoria)
);

-- Table: GR20_COMENTA
CREATE TABLE GR20_COMENTA (
    id_usuario int  NOT NULL,
    id_juego int  NOT NULL,
    fecha_primer_com timestamp  NOT NULL,
    fecha_ultimo_com timestamp  NULL,
    CONSTRAINT PK_GR20_COMENTA PRIMARY KEY (id_usuario,id_juego)
);

-- Table: GR20_COMENTARIO
CREATE TABLE GR20_COMENTARIO (
    id_usuario int  NOT NULL,
    id_juego int  NOT NULL,
    id_comentario int  NOT NULL,
    fecha_comentario timestamp  NOT NULL,
    comentario varchar(200)  NOT NULL,
    CONSTRAINT PK_GR20_COMENTARIO PRIMARY KEY (id_usuario,id_juego,id_comentario)
);

-- Table: GR20_JUEGA
CREATE TABLE GR20_JUEGA (
    finalizado boolean  NULL,
    id_usuario int  NOT NULL,
    id_juego int  NOT NULL,
    CONSTRAINT PK_GR20_JUEGA PRIMARY KEY (id_usuario,id_juego)
);

-- Table: GR20_JUEGO
CREATE TABLE GR20_JUEGO (
    id_juego int  NOT NULL,
    nombre_juego varchar(100)  NOT NULL,
    descripcion_juego varchar(2048)  NOT NULL,
    id_categoria int  NOT NULL,
    CONSTRAINT PK_GR20_JUEGO PRIMARY KEY (id_juego)
);

-- Table: GR20_NIVEL
CREATE TABLE GR20_NIVEL (
    id_nivel_juego int  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    CONSTRAINT PK_GR20_NIVEL PRIMARY KEY (id_nivel_juego)
);

-- Table: GR20_RECOMENDACION
CREATE TABLE GR20_RECOMENDACION (
    id_recomendacion int  NOT NULL,
    email_recomendado varchar(30)  NOT NULL,
    id_usuario int  NOT NULL,
    id_juego int  NOT NULL,
    CONSTRAINT PK_GR20_RECOMENDACION PRIMARY KEY (id_recomendacion)
);

-- Table: GR20_TIPO_USUARIO
CREATE TABLE GR20_TIPO_USUARIO (
    id_tipo_usuario int  NOT NULL,
    descripcion varchar(30)  NOT NULL,
    CONSTRAINT PK_GR20_NIVEL_USUARIO PRIMARY KEY (id_tipo_usuario)
);

-- Table: GR20_USUARIO
CREATE TABLE GR20_USUARIO (
    id_usuario int  NOT NULL,
    apellido varchar(50)  NOT NULL,
    nombre varchar(50)  NOT NULL,
    email varchar(30)  NOT NULL,
    id_tipo_usuario int  NOT NULL,
    password varchar(32)  NOT NULL,
    CONSTRAINT PK_GR20_USUARIO PRIMARY KEY (id_usuario)
);

-- Table: GR20_VOTO
CREATE TABLE GR20_VOTO (
    id_voto int  NOT NULL,
    valor_voto int  NOT NULL,
    id_usuario int  NOT NULL,
    id_juego int  NOT NULL,
    CONSTRAINT PK_GR20_VOTO PRIMARY KEY (id_voto)
);

-- foreign keys
-- Reference: FK_GR20_GR20_CATEGORIA_GR20_NIVEL (table: GR20_CATEGORIA)
ALTER TABLE GR20_CATEGORIA ADD CONSTRAINT FK_GR20_GR20_CATEGORIA_GR20_NIVEL
    FOREIGN KEY (id_nivel_juego)
    REFERENCES GR20_NIVEL (id_nivel_juego)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_COMENTARIO_GR20_COMENTA (table: GR20_COMENTARIO)
ALTER TABLE GR20_COMENTARIO ADD CONSTRAINT FK_GR20_GR20_COMENTARIO_GR20_COMENTA
    FOREIGN KEY (id_usuario, id_juego)
    REFERENCES GR20_COMENTA (id_usuario, id_juego)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_COMENTA_GR20_JUEGO (table: GR20_COMENTA)
ALTER TABLE GR20_COMENTA ADD CONSTRAINT FK_GR20_GR20_COMENTA_GR20_JUEGO
    FOREIGN KEY (id_juego)
    REFERENCES GR20_JUEGO (id_juego)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_COMENTA_GR20_USUARIO (table: GR20_COMENTA)
ALTER TABLE GR20_COMENTA ADD CONSTRAINT FK_GR20_GR20_COMENTA_GR20_USUARIO
    FOREIGN KEY (id_usuario)
    REFERENCES GR20_USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_JUEGA_GR20_JUEGO (table: GR20_JUEGA)
ALTER TABLE GR20_JUEGA ADD CONSTRAINT FK_GR20_GR20_JUEGA_GR20_JUEGO
    FOREIGN KEY (id_juego)
    REFERENCES GR20_JUEGO (id_juego)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_JUEGA_GR20_USUARIO (table: GR20_JUEGA)
ALTER TABLE GR20_JUEGA ADD CONSTRAINT FK_GR20_GR20_JUEGA_GR20_USUARIO
    FOREIGN KEY (id_usuario)
    REFERENCES GR20_USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_JUEGO_GR20_CATEGORIA (table: GR20_JUEGO)
ALTER TABLE GR20_JUEGO ADD CONSTRAINT FK_GR20_GR20_JUEGO_GR20_CATEGORIA
    FOREIGN KEY (id_categoria)
    REFERENCES GR20_CATEGORIA (id_categoria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_RECOMENDACION_GR20_JUEGA (table: GR20_RECOMENDACION)
ALTER TABLE GR20_RECOMENDACION ADD CONSTRAINT FK_GR20_GR20_RECOMENDACION_GR20_JUEGA
    FOREIGN KEY (id_usuario, id_juego)
    REFERENCES GR20_JUEGA (id_usuario, id_juego)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_USUARIO_GR20_TIPO_USUARIO (table: GR20_USUARIO)
ALTER TABLE GR20_USUARIO ADD CONSTRAINT FK_GR20_GR20_USUARIO_GR20_TIPO_USUARIO
    FOREIGN KEY (id_tipo_usuario)
    REFERENCES GR20_TIPO_USUARIO (id_tipo_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_GR20_VOTO_GR20_JUEGA (table: GR20_VOTO)
ALTER TABLE GR20_VOTO ADD CONSTRAINT FK_GR20_GR20_VOTO_GR20_JUEGA
    FOREIGN KEY (id_usuario, id_juego)
    REFERENCES GR20_JUEGA (id_usuario, id_juego)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

