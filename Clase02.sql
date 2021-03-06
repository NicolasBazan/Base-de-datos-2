Nicolas Bazan 
Clase 2 base imdb

CREATE DATABASE imdb;
USE imdb;
CREATE TABLE film
( film_id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  description TEXT(70),
  release_year DATE,
  CONSTRAINT film_pk PRIMARY KEY (film_id)
);

CREATE TABLE actor
( actor_id INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30),
  CONSTRAINT actor_pk PRIMARY KEY (actor_id)
);

CREATE TABLE film_actor
( actor_id INT(11) NOT NULL,
  film_id INT(11) NOT NULL
);

ALTER TABLE film
  ADD last_update TIMESTAMP
    AFTER release_year;

ALTER TABLE actor
  ADD last_update TIMESTAMP
    AFTER last_name;

ALTER TABLE film_actor ADD 
  CONSTRAINT fk_actor
    FOREIGN KEY (actor_id)
    REFERENCES actor (actor_id);

ALTER TABLE film_actor ADD 
  CONSTRAINT fk_film
    FOREIGN KEY (film_id)
    REFERENCES film (film_id);

INSERT INTO film(title, description, release_year, last_update) VALUES ("El secreto de sus ojos", "Benjamín decide escribir una novela con recuerdos.Pero a medida que va recordando los detalles, descubre cosas que no se dio cuenta en su momento.", "2009-08-13",'2018-03-19 10:32:25');
INSERT INTO film(title, description, release_year, last_update) VALUES ("Percy Jackson y el ladron del rayo", "Percyaverigua que es hijo de Poseidóny que sus dos amigos son:uno también un semidiós y el otro un sátiro. Los tres recorrerán un país plagado de monstruos mitológicos", "2010-02-18",'2018-03-19 11:50:30');
INSERT INTO film(title, description, release_year, last_update) VALUES ("Masacre en Texas 3D", "Heather viajará en busca de su verdadera identidad acompañada de sus amigos . Al llegar, se sorprenderá con los lujos de la mansión que ha heredado pero su nueva riqueza tendrá un precio", "2013-04-11",'2018-03-20 09:32:25');

INSERT INTO actor(first_name, last_name, last_update) VALUES ("Alexandra", "Daddario", '2018-03-19 11:50:30');
INSERT INTO actor(first_name, last_name, last_update) VALUES ("Ricardo", "Darin", '2018-03-19 10:32:25');
INSERT INTO actor(first_name, last_name, last_update) VALUES ("Mel", "Gibson", '2018-03-19 10:40:20');

INSERT INTO film_actor(actor_id, film_id) VALUES (1, 2);
INSERT INTO film_actor(actor_id, film_id) VALUES (2, 1);
INSERT INTO film_actor(actor_id, film_id) VALUES (1, 3);

