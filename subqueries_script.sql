-- Week 5 - Wednesday Questions

-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name
FROM customer c
JOIN address a 
ON c.address_id = a.address_id 
WHERE a.district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT amount, first_name, last_name
FROM customer c 
JOIN payment p 
ON c.customer_id = p.customer_id 
WHERE p.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT *
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id 
	HAVING sum(amount)> 175 
);  

-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, city
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
JOIN city c2 
ON a.city_id = c2.city_id 
JOIN country c3 
ON c2.country_id = c3.country_id 
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT count(*), first_name, last_name
FROM staff s 
JOIN payment p 
ON s.staff_id = p.staff_id 
GROUP BY s.staff_id
ORDER BY count DESC;

-- 6. How many movies of each rating are there?
SELECT count(*), rating
FROM film f 
GROUP BY rating 
ORDER BY count DESC;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id 
WHERE amount > (
	SELECT amount
	FROM payment p
	WHERE amount = 6.99
	LIMIT 1
);

-- 8. How many free rentals did our stores give away?
SELECT count(*)
FROM payment 
WHERE amount  < 0 OR amount = NULL;