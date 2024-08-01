USE `imdb`;

#What are the names of all movies released in 2007?
SELECT `name` FROM `movies` WHERE year = 2007;

#In what year was the movie “Troy” released?
SELECT year FROM movies WHERE name = 'Troy';

#How many actors have a last name that contains the word “sing”?
SELECT COUNT(id) AS Actors 
FROM actors 
WHERE LOWER(last_name) like '%sing%';

#How many directors have a last name that starts with the letter “Z”?
SELECT COUNT(id) AS Directors
FROM directors
WHERE LOWER(last_name) like 'Z%';

#How many years of movies does the database contain?
SELECT COUNT(DISTINCT(year)) AS Years
FROM movies;

#[Hard] How many people played a part in the movie “Fight Club” (1999)?
SELECT COUNT(DISTINCT(r.actor_id)) as People
FROM roles as r
WHERE r.movie_id = ANY(SELECT id FROM movies WHERE `name` = 'Fight Club' AND `year` = 1999);