		-- Q1 -- 
		-- ANSWER --
SELECT first_name, last_name, district  -- columns IN result
FROM customer -- table DATA will be retrieved from
INNER JOIN address -- joins customer table AND address IF id's match from both tables 
ON customer.address_id = address.address_id
WHERE district = 'Texas'; -- filter



		-- Q2 --

--SELECT COUNT(*) AS payments FROM (
--    SELECT first_name, last_name, amount
--    FROM customer
--    INNER JOIN payment
--    ON customer.customer_id = payment.customer_id
--    WHERE amount > 7.00
--) AS count_amount;

		-- ANSWEER --
SELECT c.first_name, c.last_name, p.amount
FROM customer AS c -- create alias for customer
INNER JOIN payment AS p -- create alias for payment
ON c.customer_id = p.customer_id --match id's from both tables
WHERE amount > 7.00
;



			-- Q3 --

--SELECT first_name, last_name, (SELECT SUM(amount) FROM payment WHERE customer.customer_id = payment.customer_id) AS payments
--FROM customer
--WHERE customer_id IN (
--	SELECT customer_id
--	FROM payment 
--	GROUP BY customer_id
--	HAVING SUM(amount) >175
--);


			-- ANSWER --
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id 
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);



			-- Q4 --

--SELECT first_name, last_name, district
--FROM city
--INNER JOIN address
--ON customer.address_id = address.address_id
--
--WHERE district = 'Argentina';


			-- ANSWER --
SELECT first_name, last_name, district, city, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Argentina';



			-- Q5 --
			-- ANSWER --
SELECT c.category_id, c.name, COUNT(*) AS num_movies_in_cat
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY num_movies_in_cat DESC;



			-- Q6 --
			-- ANSWER --
SELECT f.*
FROM film AS f
JOIN film_actor AS fa ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY COUNT(*) DESC
LIMIT 1;



			-- Q7 --
			-- ANSWER --
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS num_movies
FROM actor a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY num_movies ASC
LIMIT 1;



			-- Q8 --
			-- ANSWER --
SELECT c.country_id, c.country, COUNT(*) AS num_cities
FROM country c
JOIN city AS cty ON c.country_id = cty.country_id
GROUP BY c.country_id, c.country
ORDER BY num_cities DESC
LIMIT 3;



			-- Q9 --
			-- ANSWER --
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS count
FROM actor a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(*) BETWEEN 20 AND 25;
