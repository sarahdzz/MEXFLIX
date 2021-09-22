/*CONSULTAS O QUERYS CRUD 1 
CREATE-INSERT INTO
READ- SELECT
UPDATE-UPDATE
DELETE-DELETE*/

INSERT INTO movieseries SET imdb_id = 'tt3749900', title = 'Gotham', genres = 'Crime, Drama, Thriller', premiere = '2014', status = 3;

UPDATE movieseries SET author = 'Bruno Heller', actors = 'Ben McKenzie, Donal Logue, David Mazouz, Sean Pertwee', country = 'USA', poster = 'http://ia.media-imdb.com/images/M/MV5BMTQ1ODk3NDczNF5BMl5BanBnXkFtZTgwODE5MDQ4NjE@._V1_SX300.jpg', trailer = 'https://www.youtube.com/watch?v=_axxvmMBgQk', rating = 8.0 , category = 'Serie', plot = 'In crime ridden Gotham City, Thomas and Martha Wayne are murdered before young Bruce Wayne\'s eyes. Although the idealistic Gotham City Police Dept. detective James Gordon, and his cynical partner, Harvey Bullock, seem to solve the case quickly, things are not so simple. Inspired by Bruce\'s traumatized desire for justice, Gordon vows to find it amid Gotham\'s corruption. Thus begins Gordon\'s lonely quest that would set him against his own comrades and the underworld with their own deadly rivalrie and mysteries. In the coming wars, innocence will be lost and compromises will be made as some criminals will fall as casualties while others will rise as supervillains. All the while, young Bruce observes this war with a growing obsession that would one day drive him to seek his own revenge as The Batman.' WHERE imdb_id = 'tt3749900';

DELETE FROM movieseries WHERE imdb_id = 'tt3749900';

SELECT * FROM movieseries;

SELECT count(*) FROM movieseries;
 
 SELECT  title, category, country, genres, premiere, status FROM movieseries WHERE category='Serie';
 
 SELECT  title, category, country, genres, premiere, status FROM movieseries WHERE category='Serie'
 order by premiere;

 SELECT  title, category, country, genres, premiere, status FROM movieseries WHERE category='Movie' AND country='USA'
 order by premiere ;

 SELECT  title, category, country, genres, premiere, status FROM movieseries WHERE category='Movie' AND country LIKE '%USA'
 order by premiere ;

 SELECT  title, category, country, genres, premiere, status FROM movieseries WHERE category='Movie' AND country LIKE 'USA%'
 order by premiere ;

 SELECT  title, category, country, genres, premiere, status FROM movieseries WHERE genres LIKE '%Drama%' order by premiere ;

 SELECT title, category, country, genres, premiere, status FROM movieseries WHERE status = 1 OR status = 2 ORDER BY premiere;

SELECT title, category, country, genres, premiere, status FROM movieseries WHERE status = 3 OR status = 4 OR status = 5 ORDER BY premiere;

-- FIN CONSULTAS

-- 2.CONSULTAS MULTIPLES

SELECT * FROM movieseries AS ms INNER JOIN status AS s ;

SELECT * FROM movieseries AS ms INNER JOIN status AS s ON ms.status = s.status_id;

-- EN LUGAR DE MOSTRAR UN NUMERO EN EL CAMPO ESTATUS MUESTRA LO MUESTRAEN TEXTO 
SELECT ms.title,  ms.category,  ms.country,  ms.genres,  ms.premiere, s.status FROM movieseries 
 AS ms INNER JOIN status AS s ON ms.status = s.status_id ORDER by ms.premiere;

 
SELECT ms.title,  ms.category,  ms.country,  ms.genres,  ms.premiere, s.status FROM movieseries 
 AS ms INNER JOIN status AS s ON ms.status = s.status_id ORDER by ms.premiere DESC;

 SELECT ms.title,  ms.category,  ms.country,  ms.genres,  ms.premiere, s.status FROM movieseries 
 AS ms INNER JOIN status AS s ON ms.status = s.status_id where s.status='Canceled' ORDER by ms.premiere DESC;

SELECT ms.title, ms.category, ms.country, ms.genres, ms.premiere, s.status
	FROM movieseries AS ms INNER JOIN status AS s ON ms.status = s.status_id
	WHERE s.status = 'Canceled' OR s.status = 'Coming Soon' ORDER BY ms.premiere;

SELECT ms.title, ms.category, ms.country, ms.genres, ms.premiere, s.status
	FROM movieseries AS ms INNER JOIN status AS s ON ms.status = s.status_id
	WHERE s.status = 'Release' OR s.status = 'Finished' OR s.status = 'In Issue' AND ms.category = 'Serie' ORDER BY ms.premiere;

SELECT ms.title, ms.category, ms.country, ms.genres, ms.premiere, s.status
	FROM movieseries AS ms INNER JOIN status AS s ON ms.status = s.status_id
	WHERE (s.status = 'Release' OR s.status = 'Finished' OR s.status = 'In Issue') AND ms.category = 'Serie' ORDER BY ms.premiere;


/*CONSULTA FULLTEXT KEY 

FULLTEXT KEY :
*/

SELECT * FROM  movieseries 
WHERE MATCH(title, genres, actors, author)
AGAINST ('stallone' IN BOOLEAN MODE);

SELECT * FROM  movieseries 
WHERE MATCH(title, genres, actors, author)
AGAINST ('Comedy' IN BOOLEAN MODE);

SELECT ms.title, ms.category, ms.country, ms.genres, ms.premiere, s.status
	FROM movieseries AS ms
	INNER JOIN status AS s
	ON ms.status = s.status_id
	WHERE MATCH(ms.title, ms.author, ms.actors, ms.genres)
	AGAINST('drama' IN BOOLEAN MODE)
	ORDER BY ms.premiere;

-- 17.INTEGRIDAD REFERENCIAL

SELECT count(*) FROM movieseries WHERE status='1';
SELECT count(*) FROM movieseries WHERE status='2';
SELECT count(*) FROM movieseries WHERE status='3';
SELECT count(*) FROM movieseries WHERE status='4';
SELECT count(*) FROM movieseries WHERE status='5';

-- añadimos un nuevo status 
INSERT into status set status = 'otro status', status_id=0;

SELECT * FROM status;

SELECT COUNT(*) FROM movieseries WHERE status = 6;

/* MySQL permite eliminar los registros existentes en la tabla movieseries del status 1 'Coming Soon' */
DELETE FROM movieseries WHERE status = 1;

/* Permite eliminar el registro con el status_id 1 porque ya no hay registros asociados en la tabla dependiente(movieseries) */
DELETE FROM status WHERE status_id = 1;

/* MySQL no me permite eliminar el status_id 2 porque existen registros asociados a él en la tabla dependiente(movieseries) */
DELETE FROM status WHERE status_id = 2;

SELECT ms.title, ms.status, s.status_id, s.status
	FROM movieseries AS ms
	INNER JOIN status AS s
	ON ms.status = s.status_id
	ORDER BY s.status, ms.title;

/* Cuando Actualizo los valores del registro del status 2, en automático se actualizan los registros vinculados en la tabla dependiente(movieseries) */
UPDATE status 
	SET status_id = 7, status = 'Estrenada'
	WHERE status_id = 2;