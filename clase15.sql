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
 
#3
CREATE VIEW sales_by_film_category AS
SELECT category.name, SUM(payment.amount) as total_rental FROM category 
INNER JOIN film_category USING(category_id)
INNER JOIN film USING(film_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1;

#4
CREATE VIEW actor_information AS
SELECT a.actor_id, a.first_name, a.last_name, count(DISTINCT film_id) FROM actor a
INNER JOIN film_actor fa USING(actor_id)
INNER JOIN film USING(film_id)
GROUP BY 1,2,3;

#5
VIEW actor_info:

CREATE DEFINER=CURRENT_USER SQL SECURITY INVOKER VIEW actor_info
AS
SELECT
a.actor_id,
a.first_name,
a.last_name,
GROUP_CONCAT(DISTINCT CONCAT(c.name, ': ',
		(SELECT GROUP_CONCAT(f.title ORDER BY f.title SEPARATOR ', ')
                    FROM sakila.film f
                    INNER JOIN sakila.film_category fc
                      ON f.film_id = fc.film_id
                    INNER JOIN sakila.film_actor fa
                      ON f.film_id = fa.film_id
                    WHERE fc.category_id = c.category_id
                    AND fa.actor_id = a.actor_id
                 )
             )
             ORDER BY c.name SEPARATOR '; ')
AS film_info
FROM sakila.actor a
LEFT JOIN sakila.film_actor fa
  ON a.actor_id = fa.actor_id
LEFT JOIN sakila.film_category fc
  ON fa.film_id = fc.film_id
LEFT JOIN sakila.category c
  ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name, a.last_name;	