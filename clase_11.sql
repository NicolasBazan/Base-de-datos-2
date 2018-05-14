SELECT country , count(*)
  FROM city
      INNER JOIN `country`
           USING (country_id)
  GROUP BY country , country_id;
----------------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT country, count(*)
  FROM city
      INNER JOIN `country`
           USING (country_id)
    GROUP BY country
 	HAVING count(*)>10
 	ORDER BY country desc;
----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT p.customer_id, c.first_name, c.last_name, a.address, count(1), sum(p.amount)
	FROM customer c
		INNER JOIN address a 
			ON c.address_id = a.address_id
		INNER JOIN payment p
			ON c.customer_id = p.customer_id
	GROUP BY c.customer_id
	ORDER BY sum(p.amount) DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------------------
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
SELECT film.title, inventory_id
FROM film 
	INNER JOIN inventory USING (film_id)
	LEFT JOIN rental USING (inventory_id)
WHERE rental_id IS NULL;
----------------------------------------------------------------------------------------------------------------------------------------------------------
	