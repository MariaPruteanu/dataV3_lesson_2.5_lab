use sakila;

-- 1.Select all the actors with the first name ‘Scarlett’.

select * from actor
where first_name = 'Scarlett';

-- 2.How many physical copies of movies are available for rent in the store_s inventory? How many unique movie titles are available?

select count(inventory_id) from inventory;
select count(DISTINCT film_id) from inventory;

-- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.alter

select length from film;
select MAX(length) as max_duration from film;
select MIN(length) as min_duration from film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?

select concat(floor(AVG(length)/60),'h', round(AVG(length)%60,0),'m') as average_duration 
from film;

-- 5. How many distinct (different) actors' last names are there?

select distinct count(last_name) from actor;

-- 6.How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)alter

select DATEDIFF(MAX(rental_date), MIN(rental_date)) from rental;

-- 7.Show rental info with additional columns month and weekday. Get 20 results.alter

select rental_id, rental_date, Monthname(rental_date) as month,
 dayname(rental_date) as weekday
from rental 
limit 20 ;

-- 8. Show rental info with additional columns month and weekday. Get 20 results.

select rental_id, rental_date, monthname(rental_date) as month,
 dayname(rental_date) as weekday,
 case when dayofweek(rental_date) in (1,7) then 'weekend' else 'workday' 
 end as day_type
 from rental ;
 
 
-- 9. Get release years

select distinct(release_year) as release_year from film;


-- 10. Get all films with ARMAGEDDON in the title.

select * from film
where title like '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.

select * from film
where title regexp 'APOLLO$' ;

-- 12. Get 10 the longest films.

select *
from film
order by length desc
limit 10 ;

-- 13. How many films include Behind the Scenes content?

select count(title) from film
where special_features like '%Behind the Scenes%';
