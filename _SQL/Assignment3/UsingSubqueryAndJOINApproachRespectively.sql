USE imdb;

--1. Who directed the movie “Fight Club”?
SELECT d.first_name , d.last_name
FROM movies AS m
INNER JOIN movies_directors AS md ON (m.id = md.movie_id)
INNER JOIN directors AS d ON (md.director_id = d.id)
WHERE m.name = 'Fight Club';

--2. What are the names of all the people who played a part in the movie “Lost in Translation” in alphabetical order?
SELECT a.first_name , a.last_name
FROM actors AS a
INNER JOIN roles AS r ON (a.id = r.actor_id)
INNER JOIN movies AS m ON (m.id = r.movie_id)
WHERE m.name = 'Lost in Translation'
ORDER BY a.first_name ASC , a.last_name ASC;

--3. What are the names of all movies Clint Eastwood has directed in alphabetical order?
SELECT m.name
FROM movies AS m
INNER JOIN movies_directors AS md ON (m.id = md.movie_id)
INNER JOIN directors AS d ON (md.director_id = d.id)
WHERE d.first_name = 'Clint' AND d.last_name = 'Eastwood'
ORDER BY m.name ASC;

--4 [Hard] What are the names of every actor who has appeared in a movie directed by Christopher Nolan in alphabetical order without duplicates?
WITH movie_nolan(movie_id) AS (
	SELECT ms.id
	FROM movies AS ms
	INNER JOIN movies_directors AS md ON (ms.id = md.movie_id)
	INNER JOIN directors AS d ON (md.director_id = d.id)
	WHERE d.first_name = 'Christopher' AND d.last_name = 'Nolan'
)
SELECT DISTINCT(CONCAT(a.first_name , ' ', a.last_name)) AS nolan_actors
FROM actors AS a
INNER JOIN roles AS r ON (a.id = r.actor_id)
INNER JOIN movie_nolan AS mn ON (mn.movie_id = r.movie_id)
ORDER BY a.first_name ASC , a.last_name ASC;

--5.1
SELECT mg.genre , COUNT(mg.movie_id) AS count
	FROM movies_genres AS mg
	GROUP BY mg.genre
    Having count > 10000
    ORDER BY mg.genre ASC;

--5.2
WITH movies_genres_count(movie_genre , counts) AS (
	SELECT mg.genre , COUNT(mg.movie_id)
	FROM movies_genres AS mg
	GROUP BY mg.genre
)
SELECT mgc.movie_genre , MAX(mgc.counts)
FROM movies_genres_count AS mgc