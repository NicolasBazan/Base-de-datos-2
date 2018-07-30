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

Find all the rentals done in the months of May and June. 
Show the film title, customer name and if it was returned or not. There should be returned column with two possible values 'Yes' and 'No'.





