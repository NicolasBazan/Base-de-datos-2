CREATE VIEW films_per_actor AS
SELECT a.actor_id, a.first_name, a.last_name, 
COUNT(DISTINCT film_id) as film_count, GROUP_CONCAT(DISTINCT c.name) as category_list, GROUP_CONCAT(f.title ORDER BY title DESC SEPARATOR ':' )
FROM actor a
INNER JOIN film_actor fa USING(actor_id)
INNER JOIN film f USING(film_id)
INNER JOIN film_category fc USING(film_id)
INNER JOIN category c USING(category_id)
GROUP BY actor_id;

INSERT INTO category (name) VALUES ("ANIME");
INSERT INTO film (title, description, release_year, language_id, length, special_features) VALUES ('Akira', 'Story of Akira',2006,(SELECT language_id FROM language WHERE name ="English"), 50, 'Trailers,Commentaries');
INSERT INTO film (title, description, release_year, language_id, length, special_features) VALUES ('Ghost In The Shell', 'A movie of a Ghost In The Shell',2012,(SELECT language_id FROM language WHERE name ="German"), 45, 'Trailers,Deleted Scenes,Behind the Scenes');
INSERT INTO film_category(film_id,category_id) VALUES ((SELECT film_id FROM film WHERE title="Akira"),(SELECT category_id FROM category WHERE name ="ANIME"));
INSERT INTO film_category(film_id,category_id) VALUES ((SELECT film_id FROM film WHERE title="Ghost In The Shell"),(SELECT category_id FROM category WHERE name ="ANIME"));