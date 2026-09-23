#Padding - LPAD adds characters until the text reaches a set length
SELECT title, LPAD(title, 20, '*') AS left_padded
FROM sakila.film
LIMIT 5;

#Substring - pulls out part of a string, SUBSTRING(text, start, length)
SELECT title, SUBSTRING(title, 1, 5) AS short_title
FROM sakila.film
LIMIT 5;

#Concat joins strings together
SELECT CONCAT(first_name, '.', last_name) AS full_name
FROM sakila.customer
LIMIT 5;

#Reverse flips the string backwards
SELECT title, REVERSE(title) AS reversed_title
FROM sakila.film
LIMIT 5;

#Length counts the characters in a string
SELECT title, LENGTH(title) AS title_length
FROM sakila.film
WHERE LENGTH(title) >= 8
LIMIT 5;

#Locate finds the position of a character, used here to get the email domain
SELECT email, SUBSTRING(email, LOCATE('@', email) + 1) AS domain
FROM sakila.customer
LIMIT 5;

#Substring_index splits on a character, negative number = count from the right
SELECT email, SUBSTRING_INDEX(email, '@', -1) AS domain
FROM sakila.customer
LIMIT 5;

#Upper and lower change the case of the text
SELECT title, UPPER(title) AS upper_title, LOWER(title) AS lower_title
FROM sakila.film
LIMIT 5;

#Left and right pull characters from either end of the string
SELECT title, LEFT(title, 2) AS first_2, RIGHT(title, 3) AS last_3
FROM sakila.film
LIMIT 5;

#Replace swaps one character or word for another
SELECT title, REPLACE(title, 'A', 'x') AS cleaned_title
FROM sakila.film
LIMIT 5;

#Case works like an if/else inside a query
SELECT last_name,
       CASE
           WHEN LEFT(last_name, 1) BETWEEN 'A' AND 'M' THEN 'Group A-M'
           WHEN LEFT(last_name, 1) BETWEEN 'N' AND 'Z' THEN 'Group N-Z'
           ELSE 'Other'
       END AS group_label
FROM sakila.customer
LIMIT 5;

#Regexp checks if text matches a pattern, $ means end of text
SELECT title
FROM sakila.film
WHERE title REGEXP '[aeiouAEIOU]$'
LIMIT 5;

#Power raises a number to an exponent
SELECT film_id, rental_duration, POWER(rental_duration, 2) AS squared_duration
FROM sakila.film
LIMIT 5;

#Mod gives the remainder after division
SELECT film_id, length, MOD(length, 60) AS minutes_over_hour
FROM sakila.film
LIMIT 5;

#Ceil rounds up, floor rounds down
SELECT rental_rate, CEIL(rental_rate) AS ceil_value, FLOOR(rental_rate) AS floor_value
FROM sakila.film
LIMIT 5;

#Round shortens a decimal to a set number of places
SELECT rental_rate, replacement_cost, ROUND(replacement_cost / rental_rate, 2) AS ratio
FROM sakila.film
LIMIT 5;

#Datediff gives the number of days between two dates
SELECT rental_id, rental_date, return_date, DATEDIFF(return_date, rental_date) AS days_rented
FROM sakila.rental
WHERE return_date IS NOT NULL
LIMIT 5;

#Dayofweek and month pull parts out of a date
SELECT last_update, DAYOFWEEK(last_update), MONTH(last_update)
FROM sakila.film
LIMIT 5;

#Date_format changes how a date is displayed
SELECT payment_date, DATE_FORMAT(payment_date, '%d-%m-%Y') AS formatted_date
FROM sakila.payment
LIMIT 5;