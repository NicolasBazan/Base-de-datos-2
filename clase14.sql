#1
SELECT CONCAT(first_name, " ", last_name) AS Nombre, address, city
FROM customer 
INNER JOIN address USING (address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country = "ARGENTINA";

#2
SELECT title, name,
CASE rating
WHEN "G" THEN "General Audiences"
WHEN "PG" THEN "Parental Guidance Suggested"
WHEN "PG-13" THEN "Parents Strongly Cautioned"
WHEN "R" THEN "Restricted"
WHEN "NC-17" THEN "Adults Only"
END as "rating"
FROM film 
INNER JOIN language USING(language_id);

#3
SELECT TRIM(LOWER(title)), release_year, first_name FROM film 
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id);

#4
SELECT title, CONCAT(first_name, " ", last_name) as Nombre, 
CASE
WHEN return_date IS NULL THEN "NO" ELSE "YES" END as returned
FROM rental
INNER JOIN inventory USING(inventory_id)
INNER JOIN film USING(film_id)
INNER JOIN customer USING(customer_id)
WHERE MONTH(rental_date)=5 OR MONTH(rental_date)=6;

#5
CAST:
Convert a value from one datatype to another datatype.
eg: SELECT CAST("2017-08-29" AS DATE); 

CONVERT:
Convert a value from one datatype to another datatype.
eg:  SELECT CONVERT("2017-08-29", DATE); 

CAST and CONVERT do the same thing, except that CONVERT allows more options, such as changing character set with USING. CAST uses 'AS' and CONVERT a comma.

EXAMPLES BASED ON SAKILA DB
SELECT CAST(rental_date AS CHAR) from rental WHERE rental_id=80;
SELECT CONVERT(amount ,SIGNED) from payment WHERE payment_id=80;

#6
|NVL FUNCTION|

The NVL() function is available in Oracle, and not in MySQL or SQL Server. 
This function is used to replace NULL value with another value. It is similar to the IFNULL Function in MySQL.

|IFNULL FUNCTION|

So NVL() in MYSQL is IFNULL():
SELECT title, CONCAT(first_name, " ", last_name) as Nombre, 
IFNULL(return_date, "NOT RETURNED YET")
FROM rental
INNER JOIN inventory USING(inventory_id)
INNER JOIN film USING(film_id)
INNER JOIN customer USING(customer_id);

If the first expression isn't null, it returns itself. Otherwise, returns the second one.
In this example if rental_date is null then it'll be selected with the text "NOT RETURNED YET".

|ISNULL FUNCTION|
Test whether an expression is NULL
SELECT ISNULL(return_date) from rental;
In this case it returns 1(true) or 0(false)

|COALESCE FUNCTION|
Return the first non-null expression in a list
SELECT COALESCE(email,last_name) from customer;
In this case if a customer does not have an email it'll return the last_name.
