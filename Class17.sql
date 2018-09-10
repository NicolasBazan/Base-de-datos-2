#1
SELECT postal_code, city, country FROM address
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE postal_code > 3895 AND country IN('Mexico','Poland')
ORDER BY 1 DESC;

575 rows in set (0.01 sec)

CREATE INDEX postalCode ON address(postal_code);

575 rows in set (0.00 sec)

#2

#3

SELECT description 
FROM film
WHERE description LIKE '%Feminist%';

83 rows in set (0.01 sec)

CREATE FULLTEXT INDEX description
ON film(description DESC)

SELECT description
FROM film
WHERE MATCH(description) AGAINST('Feminist');

83 rows in set (0.00 sec)

