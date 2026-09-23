# Session 2 — SELECT, Filtering, and Grouping

## Topics covered
# `SELECT`, `DISTINCT`, `LIMIT`
#Filtering with `WHERE`, `AND`, `OR`, `NOT`, `IN`
#`LIKE` with wildcards `%` and `_`
# `NULL` handling with `IS NULL`
# `BETWEEN`
#`GROUP BY` and `HAVING`
# Order of execution in SQL
# Difference between `WHERE` and `HAVING`

## Notes

#**DISTINCT**
SELECT DISTINCT first_name FROM sakila.actor;

#**LIKE wildcards**
SELECT city FROM sakila.city WHERE city LIKE 'a%';   -- starts with 'a'
SELECT city FROM sakila.city WHERE city LIKE '%a';   -- ends with 'a'
SELECT city FROM sakila.city WHERE city LIKE '%a%';  -- has 'a' somewhere in it
SELECT city FROM sakila.city WHERE city LIKE 'a%a';  -- starts with 'a', ends with 'a'


#**AND / OR / NOT**

SELECT * FROM sakila.film WHERE rating = 'PG' AND rental_duration = 5;

#**NULL check**
SELECT * FROM sakila.rental WHERE return_date IS NULL;

#**BETWEEN**
SELECT * FROM sakila.rental WHERE return_date BETWEEN '2005-05-26' AND '2005-05-30';

#**GROUP BY and HAVING**

SELECT customer_id, COUNT(*) AS total
FROM sakila.rental
GROUP BY customer_id
HAVING COUNT(*) > 30;

#**Order of execution**
#FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

#**WHERE vs HAVING**
#`WHERE` filters rows, before grouping, no aggregates allowed.
# `HAVING` filters groups, after `GROUP BY`, works with aggregates like `COUNT()`.