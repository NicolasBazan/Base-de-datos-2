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
