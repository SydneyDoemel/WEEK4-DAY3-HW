-- 1. List all customers who live in Texas (use JOINs)
-- customer_id's: 305, 400, 561, 118, 6
SELECT customer_id, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT amount, first_name, last_name
FROM payment
INNER JOIN customer
on payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 175
    GROUP BY customer_id  
);

-- 4. List all customers that live in Nepal (use the city table)

SELECT customer_id, first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT staff.staff_id, first_name, last_name, SUM(payment_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY SUM(payment_id) DESC;

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(film_category.film_id)
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
GROUP BY rating
ORDER BY COUNT(film_category.film_id);

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT amount
    FROM payment
    WHERE amount > 6.99);

-- 8. How many free rentals did our stores give away?

SELECT COUNT(rental.rental_id)
FROM rental
INNER JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0;

-- OR JUST THIS? DOES THIS QUESTION EVEN NEED JOIN OR SUBQUERY?

SELECT COUNT(rental_id)
FROM payment
WHERE amount = 0;

