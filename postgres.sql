select COUNT(actor_id) AS nombre_actor from actor


SELECT first_name || ' ' || last_name AS full_name
FROM actor
WHERE actor_id != 0;




SELECT COUNT(*) AS nb_film FROM film

SELECT title, description FROM film LIMIT 10


SELECT COUNT(*) FROM customer

SELECT first_name || '  '|| last_name AS full_name, email 
FROM customer


SELECT COUNT(*) AS nb_rental FROM rental


SELECT
    rental.rental_id,
    customer.first_name AS customer_first_name,
    customer.last_name AS customer_last_name,
    film.title AS film_title,
    EXTRACT (YEAR FROM rental.rental_date) AS date
FROM
    rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE  EXTRACT (YEAR FROM rental.rental_date)='2006'
LIMIT 50;


SELECT COUNT(*) AS categorie_film FROM category


SELECT F.film_id AS film_id, 
       A.category_id AS category_id,
       C.name AS category_name,
	   F.title AS title_film,
       A.film_id AS film_id
FROM film AS F
LEFT JOIN film_category AS A ON F.film_id = A.film_id
LEFT JOIN category AS C ON A.category_id = C.category_id
LIMIT 100






SELECT
    film.title,
    rental_id AS average_rating
FROM
    film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id
ORDER BY
    average_rating DESC
LIMIT 50;



--selctionne 4 premieres lettres ou nombres
SELECT LEFT(name,4) FROM category WHERE LEFT(name,4)='Come';

--extraire la date 
SELECT EXTRACT(YEAR FROM last_update) FROM rental;

--extraire la date 
SELECT DATE_PART('year', last_update) AS year FROM rental;

--convertir la date en chaine de caractères
SELECT TO_CHAR(last_update, 'YYYY-MM-DD') AS formatted_date FROM rental;

--DATE_TRUNC : Tronque une date à une unité spécifiée (année, mois, jour, etc.).
SELECT DATE_TRUNC('month', last_update) AS truncated_date FROM rental;

--TO_CHAR : Convertit une date en une chaîne de caractères selon un format spécifié.
SELECT TO_CHAR(last_update, 'YYYY-MM-DD') AS formatted_date FROM rental;

-- DATE_ADD ou DATE_SUB : Ajoute ou soustrait une durée à une date.
SELECT DATE_ADD(last_update, - INTERVAL 15 year) AS new_date FROM rental;

-- 17 derniers années de mise à jours
SELECT *
FROM rental
WHERE last_update <= CURRENT_DATE - INTERVAL '17 years'
LIMIT 10;

-- DATEDIFF (dans certaines bases de données) : Calcule la différence entre deux dates.
SELECT EXTRACT(DAY FROM (last_update - rental_date)) AS date_difference
FROM rental;
 
SELECT EXTRACT(day FROM age(last_update, rental_date)) AS difference_en_jours
FROM rental;

-- CAST pour convertir les colonnes de type timestamp en type date, par exemple.
SELECT (CAST(last_update AS date) - CAST(rental_date AS date)) AS difference_en_jours
FROM rental;






SELECT * FROM rental
SELECT * FROM film
SELECT * FROM actor
SELECT * FROM customer