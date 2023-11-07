--Week 5 - Wednesday
--Questions
--
--1. List all customers who live in Texas (use
--JOINs)
--
select first_name, last_name, address.district
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full
--Name
--
select first_name, last_name, payment.amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where payment.amount > 6.99

--3. Show all customers names who have made payments over $175(use
--subqueries)
--
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, payment.amount
	having amount > 175
	order by amount desc
)
group by customer_id, first_name, last_name


--4. List all customers that live in Nepal (use the city
--table)
--
select customer.first_name, customer.last_name, country
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on address.city_id = city.city_id 
inner join country
on city.country_id = country.country_id
where country = 'Nepal'


--5. Which staff member had the most
--transactions?
--
select count(payment.staff_id), first_name, last_name
from staff
inner join payment
on payment.staff_id = staff.staff_id
group by staff.first_name, staff.last_name
order by count(payment.staff_id) desc

--6. How many movies of each rating are
--there?
--
select count(inventory.film_id), film.rating
from inventory
inner join film
on inventory.film_id = film.film_id
group by film.rating


--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
--
select first_name, last_name, payment.amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
group by payment.amount, customer.first_name, customer.last_name
having amount > 6.99
order by amount desc

--8. How many free rentals did our stores give away?
select count(amount)
from payment
where amount <= 0.00













