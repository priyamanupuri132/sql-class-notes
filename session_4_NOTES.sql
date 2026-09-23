#Subquery - a query inside another query, runs first and returns a value used as a filter
SELECT customer_id, SUM(amount) AS total
FROM sakila.payment
GROUP BY customer_id
HAVING total > (SELECT AVG(amount) FROM sakila.payment);

#CTE - a temporary named result set, made readable with WITH
WITH totals AS (
    SELECT customer_id, SUM(amount) AS total
    FROM sakila.payment
    GROUP BY customer_id
)
SELECT * FROM totals WHERE total > 100;

#Recursive CTE - a CTE that refers to itself to build a sequence
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n < 5
)
SELECT * FROM numbers;

#Temporary table - exists only for the current session
CREATE TEMPORARY TABLE top_actors AS
SELECT actor_id, COUNT(*) AS films
FROM sakila.film_actor
GROUP BY actor_id
ORDER BY films DESC
LIMIT 5;

SELECT * FROM top_actors;

#View - a saved query you can reuse like a table
CREATE OR REPLACE VIEW recent_rentals AS
SELECT customer_id, MAX(rental_date) AS last_rental
FROM sakila.rental
GROUP BY customer_id;
