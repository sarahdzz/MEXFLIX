/* Listado de Operaciones (queries) CRUD de mexflix */

/*movieseries*/
	/*Crear movieseries*/
	INSERT INTO movieseries SET imdb_id = 'tt3749900', title = 'Gotam', plot = '', author = '', actors = '', country = '', premiere = '2014', trailer = '', poster = '', rating = 8.0, genres = 'Crime, Drama, Thriller', category = 'Serie', status  = 3;

	/*Actualizar movieseries*/
	UPDATE movieseries SET title = 'Gotham', plot = 'In crime ridden Gotham City, Thomas and Martha Wayne are murdered before young Bruce Wayne\'s eyes. Although the idealistic Gotham City Police Dept. detective James Gordon, and his cynical partner, Harvey Bullock, seem to solve the case quickly, things are not so simple. Inspired by Bruce\'s traumatized desire for justice, Gordon vows to find it amid Gotham\'s corruption. Thus begins Gordon\'s lonely quest that would set him against his own comrades and the underworld with their own deadly rivalries and mysteries. In the coming wars, innocence will be lost and compromises will be made as some criminals will fall as casualties while others will rise as supervillains. All the while, young Bruce observes this war with a growing obsession that would one day drive him to seek his own revenge as The Batman.', genres = 'Crime, Drama, Thriller', author = 'Bruno Heller', actors = 'Zabryna Guevara, Ben McKenzie, Donal Logue, David Mazouz', country = 'USA', premiere = '2014', trailer = 'https://www.youtube.com/watch?v=_axxvmMBgQk', poster = 'http://ia.media-imdb.com/images/M/MV5BMTQ1ODk3NDczNF5BMl5BanBnXkFtZTgwODE5MDQ4NjE@._V1_SX300.jpg', rating = 8.0, category = 'Serie', status  = 3 
		WHERE imdb_id = 'tt3749900';

	/*Eliminar movieseries*/
	DELETE FROM movieseries WHERE imdb_id = 'tt3749900';

	/*Buscar Todas las movieseries*/
	SELECT ms.imdb_id, ms.title, ms.plot, ms.author, ms.actors, ms.country, ms.premiere, ms.poster, ms.trailer, ms.rating, ms.genres, ms.category, s.status
	FROM movieseries AS ms
	INNER JOIN status AS s
	ON ms.status = s.status_id; 
    --  junta la tablas y en ves  de poner el id trae el estus 

    /*Buscar una movieseries por títulos, personas (actores, autores), géneros*/
	SELECT ms.imdb_id, ms.title, ms.plot, ms.author, ms.actors, ms.country, ms.premiere, ms.poster, ms.trailer, ms.rating, ms.genres, ms.category, s.status
	FROM movieseries AS ms
	INNER JOIN status AS s
	ON ms.status = s.status_id
	WHERE MATCH(ms.title, ms.author, ms.actors, ms.genres)
	AGAINST('drama' IN BOOLEAN MODE);

    
	/*Buscar una movieseries por categoría*/
	SELECT ms.imdb_id, ms.title, ms.plot, ms.author, ms.actors, ms.country, ms.premiere, ms.poster, ms.trailer, ms.rating, ms.genres, ms.category, s.status
	FROM movieseries AS ms
    INNER JOIN status AS S
    ON ms.status=s.status_id
    WHERE ms.category='Movie';

	/*Buscar una movieseries por status*/
	SELECT ms.imdb_id, ms.title, ms.plot, ms.author, ms.actors, ms.country, ms.premiere, ms.poster, ms.trailer, ms.rating, ms.genres, ms.category, s.status
	FROM movieseries AS ms
    INNER JOIN status AS S
    ON ms.status=s.status_id
    WHERE ms.status='1';
