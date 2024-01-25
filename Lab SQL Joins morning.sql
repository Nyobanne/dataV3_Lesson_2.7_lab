-- https://github.com/Nyobanne/dataV3_Lesson_2.7_lab.git
use sakila;
-- How many films are there for each of the categories in the category table.
SELECT count(DISTINCT(fc.film_id)), c.name 
FROM sakila.film_category fc
JOIN sakila.category c 
USING (category_id)
GROUP BY c.name;
SELECT * FROM payment p  ;
-- amount sold by each staff member in August of 2005.
SELECT s.last_name, s.first_name, SUM(p.amount)
FROM staff s
JOIN payment p 
USING(staff_id)
WHERE (LEFT(payment_date,7)='2005-08')
GROUP BY s.last_name;

-- Which actor has appeared in the most films?

SELECT a.last_name, a.first_name, COUNT(DISTINCT fa.film_id) AS 'number of films'
FROM actor a 
JOIN film_actor fa 
USING(actor_id)
GROUP BY a.actor_id
ORDER BY COUNT(fa.film_id) DESC
LIMIT 3;

-- Most active customer (the customer that has rented the most number of films)=> most rentals

SELECT c.last_name, c.first_name, COUNT(r.rental_id) AS 'number of rentals'
FROM customer c 
JOIN rental r 
USING(customer_id)
GROUP BY c.customer_id 
ORDER BY COUNT(r.rental_id) DESC
LIMIT 3;

-- first and last names, as well as the address, of each staff member.=> I guess store adress
SELECT s.last_name, s.first_name, CONCAT(a.address,' ',IFNULL(a.address2,''))  AS 'store address'
FROM staff s 
JOIN address a 
USING(address_id);

-- List each film and the number of actors who are listed for that film.
SELECT f.film_id, f.title, COUNT(distinct fa.actor_id) AS 'number of actors'
FROM film f 
JOIN film_actor fa 
USING(film_id)
GROUP BY f.title
LIMIT 40;

--  list the total paid by each customer. 
SELECT c.last_name, SUM(distinct p.amount) as 'total paid by customer'
FROM customer c 
JOIN payment p 
ON c.customer_id=p.customer_id 
ORDER BY c.last_name ASC
LIMIT 40;
-- List the titles of films per category. #dont know why Im getting only letter A?
SELECT f.title, fc.category_id
FROM film f
LEFT JOIN film_category fc 
ON f.film_id=fc.film_id
GROUP BY fc.category_id;


