#1

INSERT INTO customer (store_id, first_name, last_name,address_id)
VALUES (1,"Nicolas","Bazan",(SELECT address_id FROM address a 
INNER JOIN city ci USING (city_id)
INNER JOIN country co USING (country_id)
WHERE country="UNITED STATES" ORDER BY address_id DESC LIMIT 1));

#2

INSERT INTO rental(rental_date, inventory_id, customer_id,staff_id) 
VALUES(CURRENT_DATE(),
(SELECT inventory_id FROM inventory INNER JOIN film USING (film_id) WHERE title ="TRAP GUYS" ORDER BY inventory_id LIMIT 1),
600,
(SELECT staff_id from staff sta INNER JOIN store sto ON sta.staff_id=sto.manager_staff_id WHERE sto.store_id=2));

#3

UPDATE film SET release_year = CASE 
WHEN rating = "G" THEN 1985
WHEN rating = "PG" THEN 1990
WHEN rating = "PG-13" THEN 1995
WHEN rating = "R" THEN 2000
WHEN rating = "NC-17" THEN 2005
END;

#4

UPDATE rental SET return_date = CURRENT_DATE() WHERE rental_id = 11611;

#5
DELETE FROM inventory WHERE film_id=1;
DELETE payment FROM rental 
INNER JOIN payment USING (rental_id)
INNER JOIN inventory USING (inventory_id)
WHERE film_id = 1;
DELETE rental FROM inventory
INNER JOIN rental USING (inventory_id)
WHERE film_id = 1;
DELETE film_actor FROM film_actor WHERE film_id = 1;
DELETE film_category FROM film_category WHERE film_id = 1;
DELETE film FROM film WHERE film_id = 1;

#6
