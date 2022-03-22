/* CRUD - CREATE */
INSERT INTO reviewers (first_name, last_name)
VALUES ('Alexander', 'the Great');

/* CRUD - READ */
SELECT * FROM reviewers;
SELECT first_name FROM reviewers;
SELECT first_name, last_name FROM reviewers;
SELECT id, first_name, last_name FROM reviewers;
SELECT id, first_name, last_name FROM reviewers WHERE first_name='Juan';


/* CRUD - UPDATE */
SELECT * FROM statistics  -- run a SELECT to make sure we target correct DB
UPDATE statistics         -- select tablename
SET release_year=2000     -- set new value
WHERE release_year=1988;  -- select where to make the change


/* CRUD - DELETE */
SELECT * FROM movies;  -- run a SELECT to make sure we target correct DB
DELETE FROM movies WHERE title='Inception'; -- deletes this specific entry
DELETE from movies; -- deletes all entries, all movies in this table


/* INNER JOIN 1
Select the ten titles with highest revenue and sort descending, use alias*/
SELECT movies.title AS Title, statistics.revenue_millions_usd AS Revenue
FROM statistics
JOIN movies ON statistics.id = movies.statistics_id
ORDER BY Revenue DESC
LIMIT 10;

/* INNER JOIN 2
Select all movies between 2000 & 2008 sort by year ascending*/
SELECT casts.director, movies.title, statistics.release_year AS films
FROM movies
JOIN statistics ON movies.statistics_id = statistics.id
JOIN casts ON movies.casts_id = casts.id
WHERE release_year >= 2000 AND release_year <=2008
ORDER BY films ASC;

/* FUNCTION 1
use STRING FUNTION to make director appear in  upper case and concat a string to the title*/
SELECT UPPER(casts.director) AS Director,
       CONCAT(title, ' was released in ', statistics.release_year) AS Films
FROM movies
JOIN statistics ON movies.statistics_id = statistics.id
JOIN casts ON movies.casts_id = casts.id
WHERE release_year >= 2000 AND release_year <=2008
ORDER BY films ASC;

/* FUNCTION 2
count number of films released per year and their average length in minutes. Then use round to not show any decimal number in minutes*/
SELECT release_year AS year,
    COUNT(*) AS '# of films',
    ROUND(AVG(runtime_minutes),2) AS 'avg minutes'
FROM statistics
    GROUP BY release_year;

/* VIEW
display all films that is below 100minutes in lenth*/
CREATE VIEW YOLO AS
SELECT release_year, runtime_minutes, revenue_millions_usd
FROM statistics
WHERE runtime_minutes < 100;
SELECT * FROM YOLO;


/* TRANSACTION (INSERT UPDATE DELETE) */
-- update remove 500 from all posts
SET autocommit = 0;
START TRANSACTION;
UPDATE statistics
   SET revenue_millions_usd = revenue_millions_usd - 500;
SELECT revenue_millions_usd FROM statistics;
COMMIT;
ROLLBACK;


/* Du ska visa genom minst två relevanta SQL-frågor att databasen har referensintegritet
mellan tabellerna */
-- I am enforceing referential integrity in MySQL by using a foreign key
-- I would have to start deleting reviews
DROP TABLE reviewers;
DROP TABLE statistics;
DROP TABLE casts;
DROP TABLE movies;


/* MANY TO MANY WITH JOIN
Concatenate and display usernames along with titles, rating, release year and director of movie but ONLY where revenue is missing */
SELECT CONCAT(first_name, ' ', last_name) AS FullName,
       title, rating, release_year, director
FROM reviews
  JOIN movies ON reviews.movies_id = movies.id
  JOIN reviewers ON reviews.reviewers_id = reviewers.id
  JOIN statistics ON movies.statistics_id = statistics.id
  JOIN casts ON movies.casts_id = casts.id
WHERE statistics.revenue_millions_usd IS NULL;


/* STORED PROCEDURE/TRIGGER 1
Trigger:
It is not possible to add videos thats made before 1980
45000 A generic state representing "unhandled user-defined exception"*/
DELIMITER $$

CREATE TRIGGER no_release_before_1980
     BEFORE INSERT ON statistics FOR EACH ROW
     BEGIN
          IF NEW.release_year < 1980
          THEN
              SIGNAL SQLSTATE '45000' -- 4500 indicates
                    SET MESSAGE_TEXT = 'Thats to old, we dont want that';
          END IF;
     END;
$$
DELIMITER ;

/* STORED PROCEDURE/TRIGGER 2 */
-- Stored procedure to show all directors
DELIMITER //
CREATE PROCEDURE AllDirectors()
   BEGIN
   SELECT director FROM casts
   GROUP BY director;
   END //

-- Run Stored Procedure
CALL AllDirectors();

-- Delete Stored Procedure
DROP PROCEDURE IF EXISTS GetAllBooks;
