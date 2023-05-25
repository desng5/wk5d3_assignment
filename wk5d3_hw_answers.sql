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
ON c.customer_id = p.customer_id 
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



			