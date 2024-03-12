use sakila;
select * from actor;
select * from film;
select * from customer;
select title from film;
select name as language from language;
select address_id from staff;

-- Retrieve unique release years
select release_year, count(*)
from film
group by release_year;

-- the number of stores that the company has
select sum(store_id) as number_of_stores
from store;

-- the number of employees that the company has
select sum(staff_id)
from staff;

-- how many films are available for rent and how many have been rented
select film_id as number_of_films_rented
from film
where rental_rate is not null ;


-- number of distinct last names of the actors in the database
select distinct last_name, count(*)
from actor
group by last_name;

-- Retrieve the 10 longest films
select 
	film_id
    , title
	, length 
from film
order by length desc
limit 10;

--  Retrieve all actors with the first name "SCARLETT". 
select * from actor
	where first_name like "SCARLETT";
    
-- Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
select * from film
	where title like "%ARMAGEDDON%"
    and length > 100;