#0.1
SELECT population FROM world
WHERE name = 'Germany'

#0.2
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway' ,'Denmark');

#0.3
SELECT name, area FROM world
WHERE area BETWEEN 200000 and 250000

#1.1
SELECT name FROM world
WHERE name LIKE 'Y%'

#1.2
SELECT name FROM world
WHERE name LIKE 'y%'

#1.3
SELECT name FROM world
WHERE name LIKE '%x%'

#1.4
SELECT name FROM world
WHERE name LIKE '%land'

#1.5
SELECT name FROM world
WHERE name LIKE 'C%ia'

#1.6
SELECT name FROM world
WHERE name LIKE '%oo%'

#1.7
SELECT name FROM world
WHERE name LIKE '%a%a%a%'

#1.8
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

#1.9
SELECT name FROM world
WHERE name LIKE '%o__o%'

#1.10
SELECT name FROM world
WHERE name LIKE '____'

#1.11
SELECT name
FROM world
WHERE name LIKE `capital`

#1.12
SELECT name
FROM world
WHERE capital LIKE concat(`name`, ' City')

#1.13
SELECT capital , name
FROM world
WHERE capital LIKE concat('%',`name`,'%')

#1.14
SELECT capital , name
FROM world
WHERE capital like concat(`name`,' %')

#1.15
SELECT name , replace(capital,name,'')
FROM world
WHERE capital LIKE concat(name,' %')

#2.1
SELECT name, continent, population FROM world

#2.2
SELECT name FROM world
WHERE population > 200000000

#2.3
SELECT name , gdp/population as `per capita GDP`
FROM world
WHERE population > 200000000

#2.4
SELECT name , population/1000000 AS `population in millions` 
FROM world 
WHERE continent = 'South America'

#2.5
SELECT name , population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

#2.6
SELECT name 
FROM world
WHERE name like '%United%'

#2.7
SELECT name , population , area
FROM world
WHERE area > 3000000 OR population > 250000000

#2.8
SELECT name , population , area
FROM world
WHERE area > 3000000 XOR population > 250000000

#2.9
SELECT name , ROUND(population/1000000,2) , ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America'

#2.10
SELECT name , ROUND(gdp/population,-3) AS `per-capita GDP`
FROM world
WHERE gdp > 1000000000000

#2.11
SELECT name,  capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

#2.12
SELECT name, capital
FROM world
WHERE (LEFT(name,1) = LEFT(capital,1)) AND (name <> capital)

#2.13
SELECT name
FROM world
WHERE 
 name LIKE '%a%' AND
 name LIKE '%i%' AND
 name LIKE '%u%' AND
 name LIKE '%e%' AND
 name LIKE '%o%' AND
 name NOT LIKE '% %'

#3.1
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

#3.2
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature'

#3.3
SELECT yr , subject
FROM nobel
WHERE winner = 'Albert Einstein'

#3.4
SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr >= 2000

#3.5
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject = 'literature'

#3.6
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter', 'Barack Obama')

#3.7
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

#3.8
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984)

#3.9
SELECT yr , subject , winner
FROM nobel
WHERE yr = 1980 AND !(subject IN ('chemistry','medicine'))

#3.10
SELECT yr , subject , winner
FROM nobel
WHERE ( subject = 'medicine' AND yr < 1910 ) OR ( subject = 'literature' AND yr >= 2004)

#3.11
SELECT * 
FROM nobel
WHERE winner = LOWER('PETER GRÜNBERG');

#3.12
SELECT * 
FROM nobel
WHERE winner = LOWER('EUGENE O\'NEILL');

#3.13
SELECT winner , yr , subject
FROM nobel
WHERE winner like 'Sir%'
ORDER BY yr DESC , winner ASC

#3.14
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('physics','chemistry') , subject , winner

#4.1
SELECT name FROM world
WHERE population >
    (SELECT population FROM world
      WHERE name='Russia')

#4.2
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

#4.3
SELECT name , continent 
FROM world
WHERE continent IN ('South America','Insular Oceania')

#4.4
SELECT name , population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') AND population < (SELECT population FROM world WHERE name = 'Germany')

#4.5
SELECT name , CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100,0),'%')
FROM world
WHERE continent = 'Europe'

#4.6
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe')

#4.7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

#4.8
SELECT continent, name FROM world x
  WHERE name = 
    (SELECT name FROM world y
        WHERE y.continent=x.continent
          AND name LIKE 'A%' limit 1)

#4.9
SELECT name
FROM world AS w2
WHERE w2.population = ALL(SELECT continent
  FROM world AS w1
  WHERE w1.population <= 25000000
)

#4.10
SELECT w2.name , w2.continent
FROM world AS w2 
WHERE w2.population > ALL(
   SELECT w1.population*3
   FROM world AS w1 
   WHERE w1.continent = w2.continent AND w1.name <> w2.name
)

#5.1
SELECT SUM(population)
FROM world

#5.2
SELECT DISTINCT(continent)
FROM world

#5.3
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

#5.4
SELECT COUNT(name)
FROM world
WHERE area > 1000000

#5.5
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

#5.6
SELECT continent , COUNT(name) AS sum_of_countries
FROM world
GROUP BY continent

#5.7
SELECT continent , COUNT(name) AS total_countries
FROM world
WHERE population > 10000000
GROUP BY continent

#5.8
SELECT continent 
FROM world
WHERE population > 100000000
GROUP BY continent

#6.1
SELECT matchid , player FROM goal 
WHERE teamid LIKE '%GER'

#6.2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

#6.3
SELECT player,teamid,stadium , mdate
FROM game AS ga
INNER JOIN goal AS go ON (ga.id=go.matchid)
WHERE go.teamid = 'GER'

#6.4
SELECT ga.team1,ga.team2,go.player
FROM goal as go
INNER JOIN game as ga ON (go.matchid = ga.id)
WHERE player LIKE 'Mario%'

#6.5
SELECT go.player, go.teamid, et.coach , go.gtime
FROM goal AS go
INNER JOIN eteam as et ON (go.teamid=et.id)
WHERE gtime<=10

#6.6
SELECT ga.mdate , et.teamname
FROM game AS ga
INNER JOIN eteam AS et ON (et.id = ga.team1)
WHERE et.coach = 'Fernando Santos'

#6.7
SELECT go.player
FROM goal AS go
INNER JOIN game AS ga ON (ga.id = go.matchid)
WHERE stadium = 'National Stadium, Warsaw'

#6.8
SELECT DISTINCT(go.player)
FROM goal AS go 
INNER JOIN game AS ga ON (go.matchid = ga.id) 
WHERE (ga.team1 = 'GER' OR ga.team2 = 'GER') AND (go.teamid <> 'GER')

#6.9
SELECT et.teamname , COUNT(go.teamid)
FROM goal AS go
INNER JOIN eteam AS et ON et.id = go.teamid
GROUP BY et.teamname

#6.10
SELECT ga.stadium , COUNT(go.player)
FROM game AS ga
INNER JOIN goal AS go ON (go.matchid = ga.id)
GROUP BY ga.stadium

#6.11
SELECT go.matchid, ga.mdate, COUNT(go.gtime)
FROM game AS ga
INNER JOIN goal AS go ON go.matchid = ga.id 
WHERE (ga.team1 = 'POL' OR ga.team2 = 'POL')
GROUP BY go.matchid

#6.12
SELECT go.matchid, ga.mdate, COUNT(go.teamid)
FROM game AS ga
INNER JOIN goal AS go ON (go.matchid = ga.id )
WHERE go.teamid = 'GER'
GROUP BY go.matchid

#6.13
SELECT ga.mdate,
  ga.team1,
  SUM(CASE 
     WHEN go.teamid=ga.team1 THEN 1 
     ELSE 0 
  END) AS score1,
  ga.team2,
  SUM(CASE
    WHEN go.teamid=ga.team2 THEN 1
    ELSE 0
  END) AS score2
FROM game AS ga
LEFT JOIN goal AS go ON ( go.matchid = ga.id )
GROUP BY ga.mdate , go.matchid , ga.team1 , ga.team2
ORDER BY ga.mdate , go.matchid , ga.team1 , ga.team2

#7.1
SELECT id, title
FROM movie
WHERE yr=1962

#7.2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

#7.3
SELECT id , title , yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

#7.4
SELECT id
FROM actor
WHERE name = 'Glenn Close'

#7.5
SELECT id
FROM movie
WHERE title = 'Casablanca'

#7.6
SELECT a.name
FROM actor AS a
WHERE a.id = ANY(SELECT actorid FROM casting WHERE movieid = 11768)

#7.7
SELECT a.name
FROM casting AS c
INNER JOIN movie AS m ON m.id = c.movieid
INNER JOIN actor AS a ON a.id = c.actorid
WHERE m.title = 'Alien'

#7.8
SELECT m.title
FROM movie AS m
INNER JOIN casting AS c ON c.movieid = m.id
INNER JOIN actor AS a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford'

#7.9
SELECT m.title
FROM movie AS m
INNER JOIN casting AS c ON c.movieid = m.id
INNER JOIN actor AS a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford' AND c.ord <> 1

#7.10
SELECT m.title , a.name
FROM movie AS m
INNER JOIN casting AS c ON c.movieid = m.id
INNER JOIN actor AS a ON a.id = c.actorid
WHERE (m.yr = 1962) AND (c.ord = 1)

#7.11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

#7.12
SELECT m.title , a.name
FROM movie AS m
INNER JOIN casting AS c ON c.movieid = m.id
INNER JOIN actor AS a ON a.id = c.actorid
WHERE c.movieid IN (
  SELECT cc.movieid 
  FROM casting AS cc
  WHERE cc.actorid = (
    SELECT aa.id 
    FROM actor AS aa 
    WHERE aa.name = 'Julie Andrews' 
    LIMIT 1
  )
)
AND (c.ord = 1)

#7.13
SELECT DISTINCT(a.name)
FROM actor AS a
INNER JOIN casting AS c ON c.actorid = a.id
WHERE (
  SELECT COUNT(movieid) 
  FROM casting AS cc 
  WHERE cc.actorid = a.id AND cc.ord = 1
) >= 15
ORDER BY a.name

#7.14
SELECT m.title , COUNT(c.actorid) AS number_of_actor
FROM movie AS m
INNER JOIN casting AS c ON c.movieid = m.id
INNER JOIN actor AS a ON a.id = c.actorid
WHERE m.yr = 1978
GROUP BY m.title
ORDER BY number_of_actor DESC , m.title ASC

#7.15
SELECT a.name
FROM movie AS m
INNER JOIN casting AS c ON c.movieid = m.id
INNER JOIN actor AS a ON a.id = c.actorid
WHERE (
  EXISTS (
    SELECT * FROM casting AS cc 
    WHERE cc.movieid = m.id AND cc.actorid = (
      SELECT aa.id FROM actor AS aa 
      WHERE aa.name = 'Art Garfunkel'
      )
    )
  ) 
  AND a.name <> 'Art Garfunkel'