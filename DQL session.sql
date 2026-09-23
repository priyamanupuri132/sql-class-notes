SHOW DATABASES;


USE sakila;
SELECT * FROM actor;

SELECT first_name, last_name
FROM actor;
-- Example 3: WHERE condition
-- Find actors whose first name is NICK
SELECT *
FROM actor
WHERE first_name = 'NICK';

SELECT *
FROM actor
WHERE actor_id = 10;
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id = 10;

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id > 10;
-- Using AND with WHERE
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id > 10
AND actor_id < 19;
--  Using OR
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id = 10
OR actor_id = 19;
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id > 10
OR actor_id < 19;
-- BETWEEN
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id BETWEEN 10 AND 19;
--  LIKE
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE 'I%';
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE '%I';
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE '%I%';
-- ORDER BY
SELECT actor_id, first_name, last_name
FROM actor
ORDER BY actor_id DESC;
SELECT actor_id, first_name, last_name
FROM actor
ORDER BY actor_id ASC;
SELECT COUNT(*)
FROM actor;
-- Group actors by first name USING GROUP BY
SELECT first_name, COUNT(*) AS total_actors
FROM actor
GROUP BY first_name
ORDER BY total_actors DESC;
SELECT last_name, COUNT(*) AS total_actors
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 5;

