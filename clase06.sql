Exercises

1)SELECT first_name,last_name FROM actor a1 WHERE EXISTS (SELECT * FROM actor a2 WHERE a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id);

2)SELECT * FROM actor v1 WHERE NOT EXISTS (SELECT * FROM film_actor v2 WHERE v1.actor_id = v2.actor_id);
	
3)SELECT DISTINCT r1.customer_id FROM rental r1 WHERE NOT EXISTS(SELECT * FROM rental r2 WHERE r1.customer_id = r2.customer_idAND r1.rental_id <> r2.rental_id);

4)SELECT DISTINCT r1.customer_id FROM rental r1 WHERE EXISTS(SELECT * FROM rental r2 WHERE r1.customer_id = r2.customer_id AND r1.rental_id <> r2.rental_id);

5) SELECT actor.first_name, last_name, film.title FROM actor, film, film_actor WHERE actor.actor_id = film_actor.actor_id AND film_actor.film_id = film.film_id AND film.title IN("BETRAYED REAR","CATCH AMISTAD");

6)SELECT DISTINCT actor.first_name, film.title FROM actor, film, film_actor WHERE actor.actor_id = film_actor.actor_id AND film_actor.film_id = film.film_id AND film.title = "BETRAYED REAR";

7)SELECT DISTINCT actor.first_name, film.title FROM actor, film, film_actor WHERE actor.actor_id = film_actor.actor_id AND film_actor.film_id = film.film_id AND film.title = "BETRAYED REAR" AND actor.actor_id = film_actor.actor_id AND film_actor.film_id = film.film_id AND film.title = "CATCH AMISTAD";
SELECT DISTINCT actor.first_name, film.title FROM actor, film, film_actor WHERE actor.actor_id = film_actor.actor_id AND film_actor.film_id = film.film_id AND film.title IN("BETRAYED REAR") AND film.title IN ("CATCH AMISTAD");

8)SELECT actor.first_name, last_name, film.title FROM actor, film, film_actor WHERE actor.actor_id = film_actor.actor_id AND film_actor.film_id = film.film_id AND film.title NOT IN("BETRAYED REAR","CATCH AMISTAD");

