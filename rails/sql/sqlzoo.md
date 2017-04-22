# sqlzoo.net

[HERE](http://sqlzoo.net/) are all the task descriptions.

## I. SELECT basics

1.Introducing the world table of countries
```
SELECT population FROM world
  WHERE name = 'Germany'
```
2.Scandinavia
```
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
```
3.Just the right size
```
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
```
## II. SELECT from WORLD Tutorial

1.Introduction
```
SELECT name, continent, population FROM world
```
2.Large Countries
```
SELECT name FROM world
WHERE population >= 200000000
```
3.Per capita GDP
```
SELECT name, gdp/population FROM world WHERE population >= 200000000
```
4.South America In millions
```
SELECT name, population/1000000 FROM world WHERE continent = 'South America'
```
5.France, Germany, Italy
```
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');
```
6.United
```
SELECT name FROM world WHERE name LIKE "%United%";
```
7.Two ways to be big
```
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;
```
8.One or the other (but not both)
```
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000
```
9.Rounding
```
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent = 'South Americ
```
10.Trillion dollar economies
```
SELECT name, ROUND(gdp/population, -3) FROM world WHERE gdp > 1000000000000
```
11.Name and capital have the same length
```
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);
```
12.Matching name and capital
```
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital;
```
13.All the vowels
```
SELECT name
   FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';
```
## III. SELECT from Nobel Tutorial

1.Winners from 1950
```
SELECT yr, subject, winner
  FROM nobel
  WHERE yr = 1950
```
2.1962 Literature
```
SELECT winner
  FROM nobel
  WHERE yr = 1962
  AND subject = 'Literature
```
3.Albert Einstein
```
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein';
```
4.Recent Peace Prizes
```
SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000
```
5.Literature in the 1980's
```
SELECT * FROM nobel WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989
```
6.Only Presidents
```
SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                   'Barack Obama');
```
7.John
```
SELECT winner FROM nobel
WHERE winner LIKE 'John%';
```
8.Chemistry and Physics from different years
```
SELECT yr, subject, winner FROM nobel
WHERE (yr = 1980 AND subject = 'Physics') OR
 (yr = 1984 AND subject = 'Chemistry');
```
9.Exclude Chemists and Medics
```
SELECT yr, subject, winner FROM nobel
WHERE subject <> 'Chemistry' AND
subject <> 'Medicine' AND yr = 1980;
```
10.Early Medicine, Late Literature
```
SELECT yr, subject, winner FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR
(subject = 'Literature' AND yr >= 2004);
```
11.Umlaut
```
SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG'
```
12.Apostrophe
```
SELECT * FROM nobel WHERE winner = "EUGENE O'NEILL";
```
13.Knights of the realm
```
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC;
```

## IV. SELECT within SELECT Tutorial

1.List each country name where the population is larger than that of 'Russia'.
```
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
```
2.Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
```
SELECT name FROM world WHERE gdp/population >
(SELECT gdp/population FROM world WHERE name = 'United Kingdom')  AND continent = 'Europe'
```
3.List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
```
SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') OR
continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name ASC
```
4.Which country has a population that is more than Canada but less than Poland? Show the name and the population.
```
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND population < (SELECT population FROM world WHERE name = 'Poland')
```
5.Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
```
SELECT name, CONCAT(ROUND((population/(SELECT population FROM world WHERE name = 'Germany')*100), 0), '%')
FROM world WHERE continent = 'Europe'
```

## V. SUM and COUNT

1.Show the total population of the world.
```
SELECT SUM(population)
FROM world
```
2.List all the continents - just once each.
```
SELECT DISTINCT continent FROM world
```
3.Give the total GDP of Africa
```
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'
```
4.How many countries have an area of at least 1000000
```
SELECT COUNT(name) FROM world WHERE area >= 1000000
```
5.What is the total population of ('Estonia', 'Latvia', 'Lithuania')
```
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
```
6.For each continent show the continent and number of countries.
```
SELECT continent, COUNT(name) FROM world GROUP BY continent
```
7.For each continent show the continent and number of countries with populations of at least 10 million.
```
SELECT continent, COUNT(name) FROM world
WHERE population > 10000000
GROUP BY continent
```
8.List the continents that have a total population of at least 100 million.
```
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000
```

## VI. JOIN

1.Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
```
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'
```
2.Show id, stadium, team1, team2 for just game 1012
```
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012
```
3.Modify it to show the player, teamid, stadium and mdate and for every German goal.
```
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM goal
JOIN game ON (game.id=goal.matchid)
WHERE teamid = 'GER'
```
4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
```
SELECT game.team1, game.team2, goal.player FROM game
JOIN goal ON game.id = goal.matchid
WHERE player LIKE 'Mario%'
```
5.Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
```
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
  FROM goal
JOIN eteam ON goal.teamid = eteam.id
 WHERE gtime<=10
```
6.List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
```
SELECT game.mdate, eteam.teamname FROM game
JOIN eteam ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos'
```
7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
```
SELECT player FROM goal
JOIN game ON game.id = goal.matchid
WHERE stadium = 'National Stadium, Warsaw'
```
8.Instead show the name of all players who scored a goal against Germany.
```
SELECT player
  FROM game JOIN goal ON goal.matchid = game.id
    WHERE (game.team1 = 'GER' OR game.team2 = 'GER') AND teamid <> 'GER'
GROUP BY player
```
9.Show teamname and the total number of goals scored.
```
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
 ORDER BY teamname
```
10.Show the stadium and the number of goals scored in each stadium.
```
SELECT stadium, COUNT(player) FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium
```
11.For every match involving 'POL', show the matchid, date and the number of goals scored.
```
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON goal.matchid = game.id
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate
```
12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
```
SELECT goal.matchid, game.mdate, COUNT(player) FROM goal
JOIN game ON goal.matchid = game.id
WHERE teamid = 'GER'
GROUP BY matchid, mdate
```

#### To be continued
