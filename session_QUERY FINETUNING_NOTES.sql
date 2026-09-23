#Select only the columns you need instead of SELECT *
SELECT first_name FROM sakila.customer LIMIT 5;

#WHERE filters rows before they're grouped
SELECT store_id, COUNT(*) AS total
FROM sakila.customer
WHERE active = 1
GROUP BY store_id;

#A function around an indexed column stops the index from being used
EXPLAIN SELECT * FROM sakila.rental WHERE YEAR(rental_date) = 2005;

#comparing the date directly keeps the index usable
EXPLAIN SELECT * FROM sakila.rental WHERE rental_date BETWEEN '2005-01-01' AND '2005-12-31';

#LIMIT reduces how many rows come back
SELECT * FROM sakila.film LIMIT 5;

#Explain shows the plan MySQL will use to run a query
EXPLAIN SELECT * FROM sakila.customer WHERE store_id = 1;

#a large OFFSET is slow, MySQL still scans past the skipped rows
SELECT * FROM sakila.payment LIMIT 1000, 5;

#filtering by id is faster than OFFSET for paging through results
SELECT * FROM sakila.payment WHERE payment_id > 1000 LIMIT 5;
