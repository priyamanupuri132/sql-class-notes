#Inner join - only rows that match in both tables
SELECT c.first_name, r.rental_id
FROM sakila.customer c
JOIN sakila.rental r ON c.customer_id = r.customer_id
LIMIT 5;

#Left join - all rows from the left table, matched or not
SELECT c.first_name, r.rental_id
FROM sakila.customer c
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
LIMIT 5;

#adding IS NULL after a left join finds only the unmatched rows
SELECT c.first_name
FROM sakila.customer c
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
WHERE r.customer_id IS NULL
LIMIT 5;

#Right join - all rows from the right table, matched or not
SELECT c.first_name, r.rental_id
FROM sakila.customer c
RIGHT JOIN sakila.rental r ON c.customer_id = r.customer_id
LIMIT 5;

#Cross join - every row from one table paired with every row of the other
SELECT l.name
FROM sakila.language l
CROSS JOIN sakila.category ca
LIMIT 5;

#Self join - a table joined to itself, here actors sharing the same last name
SELECT a1.first_name, a2.first_name, a1.last_name
FROM sakila.actor a1
JOIN sakila.actor a2 ON a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id
LIMIT 5;