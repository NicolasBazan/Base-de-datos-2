#1
CREATE VIEW listOfCustomers AS
SELECT customer_id, CONCAT(first_name, " ", last_name), address, postal_code, phone, city, country, CASE active WHEN 1 THEN "active" ELSE "inactive" END AS status, store_id
FROM customer 
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id);

#2
CREATE VIEW  film_details AS
SELECT film_id, title, description, name, rental_rate, length, rating, GROUP_CONCAT(CONCAT(first_name," " ,last_name)) AS actors
FROM film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
GROUP BY 1,4;
 
#3 NOT WORKING
SELECT category.name, payment.ammount FROM category 
INNER JOIN film_category USING(category_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(film_id)
INNER JOIN payment USING(rental_id);

