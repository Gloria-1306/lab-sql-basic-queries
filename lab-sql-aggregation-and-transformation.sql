-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration
select
	min(length) as min_duration
	, max(length) as max_duration
    from film;
    
-- 1.2 Express the average movie duration in hours and minutes. Don't use decimals
select concat(floor(avg(length)/60)," h") as average_duration from film;

-- Calculate the number of days that the company has been operating
select 
	datediff(max(rental_date),min(rental_date)) as operating_days
    from rental;
    
-- Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
select *, 
	month(rental_date) as rental_month
    ,day(rental_date) as rental_weekday
from rental
limit 20;

-- Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
SELECT 
    *,
    CASE 
        WHEN WEEKDAY(rental_date) < 5 THEN 'workday'
        ELSE 'weekend'
    END AS DAY_TYPE
FROM 
    rental
LIMIT 20;

-- retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.
select title
	, case
		when rental_duration is null then " not available" 
	else rental_duration
    end as rental_duration
from film
order by title asc; 

-- 1.1 The total number of films that have been released
select year_release,count(*)
	FROM film
	GROUP BY 1;
    
-- The number of films for each rating
SELECT DISTINCT rating ,
	count(*) as number_of_film_per_rating
 FROM film
 group by 1 ;
 
 -- The number of films for each rating, sorting the results in descending order of the number of films.
 SELECT DISTINCT rating ,
	count(*) as number_of_film_per_rating
 FROM film
 group by 1 
order by rating asc;

-- 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places. 
 SELECT rating,
round(avg(length), 2) AS average_length_per_rating
 FROM film
 group by rating
order by round(avg(length), 2) desc; 

-- 2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
 SELECT rating,
round(avg(length), 2)>120 AS movie_length
 FROM film
 group by length;
