#!
SELECT country , count(*)
  FROM city
      INNER JOIN `country`
           USING (country_id)
  GROUP BY country , country_id;
----------------------------------------------------------------------------------------------------------------------------------------------------------
 #2
 SELECT country, count(*)
  FROM city
      INNER JOIN `country`
           USING (country_id)
    GROUP BY country
 	HAVING count(*)>10
 	ORDER BY country desc;
----------------------------------------------------------------------------------------------------------------------------------------------------------
#3
SELECT p.customer_id, c.first_name, c.last_name, a.address, count(1), sum(p.amount)
	FROM customer c
		INNER JOIN address a 
			ON c.address_id = a.address_id
		INNER JOIN payment p
			ON c.customer_id = p.customer_id
	GROUP BY c.customer_id
	ORDER BY sum(p.amount) DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
#4
SELECT title 
	FROM film 
	WHERE film_id NOT 
	IN(SELECT film_id 
		FROM inventory 
		WHERE inventory.film_id=film.film_id);
------- OR -------
SELECT title 
	FROM film 
	WHERE film_id NOT 
	IN(SELECT film_id 
		FROM inventory 
		INNER JOIN film USING(film_id));

----------------------------------------------------------------------------------------------------------------------------------------------------------
#5
SELECT film.title, inventory_id
FROM film 
	INNER JOIN inventory USING (film_id)
	LEFT JOIN rental USING (inventory_id)
WHERE rental_id IS NULL;
----------------------------------------------------------------------------------------------------------------------------------------------------------
#6
SELECT c.first_name, c.last_name, c.store_id, f.title, r.rental_date
FROM customer c 
	INNER JOIN rental r 
		ON c.customer_id = r.customer_id
	INNER JOIN inventory i
		ON 	r.inventory_id = i.inventory_id
	INNER JOIN film f
		ON i.film_id = f.film_id
WHERE r.return_date IS NOT NULL
ORDER BY c.store_id, c.last_name;
---------------------------------------------------------------------------------------------------------------------------------------------------------
#7
SELECT st.store_id, ci.city, co.country, CONCAT(s.first_name,' ',s.last_name) AS Manager, SUM(p.amount)
FROM store st
	INNER JOIN address a USING(address_id)
	INNER JOIN city ci USING(city_id)
	INNER JOIN country co USING(country_id)
	INNER JOIN staff s 
		ON st.manager_staff_id = s.staff_id
	INNER JOIN payment p USING(staff_id)
GROUP BY st.store_id;
----------------------------------------------------------------------------------------------------------------------------------------------------------
#8
SELECT f.rating, SUM(p.amount)
FROM film f
	INNER JOIN inventory i USING(film_id)
	INNER JOIN rental r USING(inventory_id)
	INNER JOIN payment p USING(rental_id)
GROUP BY f.rating;
----------------------------------------------------------------------------------------------------------------------------------------------------------
#9
SELECT a.first_name, COUNT(*) AS count
FROM actor a
	INNER JOIN film_actor USING(actor_id)
	INNER JOIN film USING(film_id)
GROUP BY a.first_name
ORDER BY count DESC
LIMIT 1;
----------------------------------------------------------------------------------------------------------------------------------------------------------
#10
# DESC list w/ category highest films average
SELECT c.name, AVG(f.length) as average
FROM category c
	INNER JOIN film_category fc USING(category_id)
	INNER JOIN film f USING(film_id)
GROUP BY c.name
ORDER BY average DESC;

# DESC list w/ category highest films legth
SELECT c.name, MAX(f.length) as max_filmLength
FROM category c
	INNER JOIN film_category fc USING(category_id)
	INNER JOIN film f USING(film_id)
GROUP BY c.name
ORDER BY max_filmLength DESC;
----------------------------------------------------------------------------------------------------------------------------------------------------------
