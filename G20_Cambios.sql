--SCRIPT CAMBIOS
--1)
--a)
ALTER TABLE GR20_comenta ADD CONSTRAINT ck_g20_fecha_menor check(
	fecha_primer_com < fecha_ultimo_com and fecha_ultimo_com is not null or fecha_ultimo_com is null);
INSERT INTO GR20_comenta(id_usuario, id_juego, fecha_primer_com, fecha_ultimo_com)VALUES (0,0,'2020-06-19 18:35:00','2018-06-19 18:35:00');--test restriccion
--b)
ALTER TABLE GR20_comentario ADD CONSTRAINT ck_g20_comentario_por_dia CHECK NOT EXISTS(                                   --Chequea que un usuario solo pueda hacer un solo comentario por dia
    SELECT c.id_usuario FROM GR20_comentario c GROUP BY c.fecha_comentario, c.id_usuario, c.id_juego HAVING count(*) > 1;);    --FECHA COMENTARIO HACER EXTRACT DE ANIO, DIA y MES
--c)
CREATE ASSERTION ck_g20_recomendar_sin_votar
CHECK NOT EXISTS(SELECT 1 FROM gr20_recomendacion r WHERE NOT EXISTS (
            SELECT 1 FROM gr20_voto v WHERE v.id_usuario = r.id_usuario and v.id_juego = r.id_juego)); --BIEN trae todos los que recomendaron y no votaron
--d)
CREATE ASSERTION ck_g20_comentar_sin_jugar
CHECK NOT EXISTS(SELECT 1 FROM gr20_comenta c WHERE NOT EXISTS (
            SELECT 1 FROM gr20_juega j WHERE c.id_usuario = j.id_usuario and c.id_juego = j.id_juego)); --BIEN trae todos los que comentan y no jugaron



--2) (TRIGGERS)
--b)

CREATE TRIGGER TR_GR20_GR20_GR20_comentario_unico_comentario_diario
    BEFORE INSERT OR UPDATE OF id_juego, id_usuario, fecha_comentario
    ON gr20_comentario
    FOR EACH ROW
    EXECUTE PROCEDURE TRFN_GR20_comentario_unico_comentario_diario();

CREATE OR REPLACE FUNCTION TRFN_GR20_comentario_unico_comentario_diario()
RETURNS TRIGGER AS $body$
DECLARE contador integer;
    BEGIN
        SELECT count(*) INTO contador FROM GR20_comentario c
            WHERE extract(year from NEW.fecha_comentario) = extract(year from c.fecha_comentario) and extract(month from NEW.fecha_comentario) = extract(month from c.fecha_comentario)
              and extract(day from NEW.fecha_comentario) = extract(day from c.fecha_comentario)
                and NEW.id_usuario = c.id_usuario and NEW.id_juego = c.id_juego;
        IF(CONTADOR =1) THEN
        RAISE EXCEPTION 'SOLO PODES COMENTAR UNA VEZ POR DIA';
        END IF;
        return new;
    END$body$
    LANGUAGE 'plpgsql';





--c)


CREATE TRIGGER TR_GR20_GR20_GR20_recomendacion_recomendar_sin_votar
    BEFORE INSERT OR UPDATE OF id_juego, id_usuario
    ON gr20_recomendacion
    FOR EACH ROW
    EXECUTE PROCEDURE TRFN_GR20_recomendar_sin_votar();

CREATE OR REPLACE FUNCTION TRFN_GR20_recomendar_sin_votar()
RETURNS TRIGGER AS $body$
DECLARE contador integer;
    BEGIN
        SELECT COUNT(*) INTO contador FROM gr20_recomendacion r WHERE NOT EXISTS (
            SELECT 1 FROM gr20_voto v WHERE new.id_usuario = v.id_usuario and new.id_juego = v.id_juego);
        IF(contador>=1) THEN
            RAISE EXCEPTION 'No podes recomendar sin votar';
        END IF;
        return new;
        END$body$
    LANGUAGE 'plpgsql';


--d)

CREATE TRIGGER TR_GR20_GR20_GR20_comenta_comentar_sin_jugar
    BEFORE INSERT OR UPDATE OF id_juego, id_usuario
    ON gr20_comenta
    FOR EACH ROW
    EXECUTE PROCEDURE TRFN_GR20_comentar_sin_jugar();

CREATE OR REPLACE FUNCTION TRFN_GR20_comentar_sin_jugar()
RETURNS TRIGGER AS $body$
DECLARE contador integer;
    BEGIN
        SELECT COUNT(*) INTO contador FROM gr20_comenta c WHERE NOT EXISTS (
            SELECT 1 FROM gr20_juega j WHERE new.id_usuario = j.id_usuario and new.id_juego = j.id_juego);
        IF(contador>0) THEN
            RAISE EXCEPTION 'No podes comentar sin jugar';
        END IF;
        return new;
        END$body$
    LANGUAGE 'plpgsql';

--SERVICIOS
--3)
CREATE OR REPLACE FUNCTION TRFN_GR20_sincro_comenta_comentario()
RETURNS TRIGGER AS $body$
    DECLARE  contador integer;
        BEGIN
            IF (TG_OP='INSERT') THEN
                SELECT COUNT(*)INTO contador FROM gr20_comenta c WHERE NEW.id_usuario = c.id_usuario AND NEW.id_juego = c.id_juego;
                    IF(contador =0) THEN
                        INSERT INTO GR20_comenta(id_usuario, id_juego, fecha_primer_com, fecha_ultimo_com)VALUES (NEW.id_usuario, NEW.id_juego,NEW.fecha_comentario, null);
                        RETURN NEW;
                    END IF;
                    IF(contador >= 1) THEN
                        UPDATE GR20_comenta c SET fecha_ultimo_com = NEW.fecha_comentario WHERE c.id_usuario = NEW.id_usuario AND c.id_juego = NEW.id_juego;
                        RETURN NEW;
                    END IF;
            END IF;

    END$body$
    LANGUAGE 'plpgsql';


CREATE TRIGGER TR_GR20_GR20_GR20_comentario_sincro_comenta_comentario
    BEFORE INSERT OR UPDATE OF id_juego, id_usuario
    ON gr20_comentario
    FOR EACH ROW
    EXECUTE PROCEDURE TRFN_GR20_sincro_comenta_comentario();




CREATE OR REPLACE FUNCTION TRFN_GR20_sincro_comenta_comentario_after()
RETURNS TRIGGER AS $body$
    DECLARE  fecha timestamp;
        BEGIN
        IF (TG_OP='DELETE') THEN
            SELECT fecha_comentario INTO fecha FROM gr20_comentario c WHERE OLD.id_usuario = c.id_usuario and OLD.id_juego = c.id_juego ORDER BY fecha_comentario DESC LIMIT 1;
            UPDATE GR20_comenta c SET fecha_ultimo_com = fecha WHERE c.id_usuario = OLD.id_usuario AND c.id_juego = OLD.id_juego;
            RETURN OLD;
        END IF;
        IF(TG_OP = 'UPDATE') THEN
                SELECT fecha_comentario INTO fecha FROM gr20_comentario ORDER BY fecha_comentario DESC LIMIT 1;
                UPDATE GR20_comenta  SET fecha_ultimo_com = fecha WHERE id_usuario = NEW.id_usuario AND id_juego = NEW.id_juego;
                RETURN NEW;
            END IF;
    END$body$
    LANGUAGE 'plpgsql';


CREATE TRIGGER TR_GR20_GR20_GR20_comentario_sincro_comenta_comentario_after
    AFTER DELETE or UPDATE OF id_juego, id_usuario, fecha_comentario
    ON gr20_comentario
    FOR EACH ROW
    EXECUTE PROCEDURE TRFN_GR20_sincro_comenta_comentario_after();




--VISTAS
--4)
--a)
CREATE VIEW GR20_comentarios_juegos_sin_categorias as
SELECT c.comentario, j.nombre_juego FROM GR20_comentario c JOIN GR20_juego j ON (c.id_juego = j.id_juego) JOIN GR20_categoria cat on (j.id_categoria = cat.id_categoria)
                    where fecha_comentario  >= date('now') - interval '1 month ' and cat.descripcion not like 'Sin Categoria';

SELECT * FROM GR20_comentarios_juegos_sin_categorias;

--b)
CREATE VIEW GR20_usuarios_full_comentarios AS
SELECT u.nombre from GR20_USUARIO u JOIN GR20_COMENTARIO c ON(u.id_usuario = c.id_usuario) GROUP BY u.nombre,c.id_usuario
                    HAVING COUNT(DISTINCT (c.id_juego)) = (SELECT COUNT(j.id_juego) FROM GR20_JUEGO j);

SELECT * FROM GR20_usuarios_full_comentarios;

--c)
CREATE VIEW GR20_top_juegos AS
SELECT j.*, AVG(v.valor_voto) as valoracion FROM GR20_JUEGO j JOIN GR20_VOTO v ON (j.id_juego = v.id_juego)
GROUP BY (V.id_juego,j.id_juego) HAVING count(DISTINCT id_voto) > 5 ORDER BY valoracion DESC LIMIT 20;

SELECT * FROM GR20_top_juegos;

--FIN
