DELIMITER &&  
CREATE PROCEDURE
SelectMoviesByGenre_LinChiKin(genre VARCHAR(100))
BEGIN
	SELECT m.name , m.year , m.rank
	FROM movies AS m
    LEFT JOIN movies_genres AS mg ON m.id = mg.movie_id
    WHERE mg.genre = genre;
END &&  
DELIMITER ;

DELIMITER &&  
CREATE PROCEDURE
ComputeAverageRatingByDirector_LinChiKin(
	p_first_name VARCHAR(100),
	p_last_name VARCHAR(100),
    OUT average_rank NUMERIC(2,1)
)
BEGIN
	SELECT AVG(m.rank)
    FROM movies AS m
    INNER JOIN movies_directors AS md ON (md.movie_id = m.id)
    INNER JOIN directors AS d ON (d.id = md.director_id)
    WHERE d.first_name = p_first_name AND d.last_name = p_last_name;
END &&
DELIMITER ;

