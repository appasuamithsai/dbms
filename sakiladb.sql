
use sakiladb;
select * from film_list;

select * from film_category;

select * from category;

select * from rental;
select film_id from film_category where category_id=(select category_id from category where name="Comedy");
select title from film where rating="PG-13" and film_id in (select film_id from film_category where category_id=(select category_id from category where name="Comedy"));

select * from payment;


select title,count(title) from film_list  join (select film_id from inventory join rental on inventory.inventory_id = rental.inventory_id) as newList  where film_list.FID =newList.film_id and category="Horror" group by title  order by count(title) desc;

select * from customer_list;
select * from film_list where category="comedy" and rating="PG-13";
-- select * from film_list where category="sports" and FID Not in 
-- (select film_id from film_category where category_id=(select category_id from category where name="sports"));

SELECT * FROM customer_list WHERE country = 'India' AND ID IN (SELECT rental.customer_id FROM film_list,inventory,rental WHERE film_list.category = 'Sports' AND film_list.FID = inventory.film_id AND rental.inventory_id = inventory.inventory_id);


select * from customer_list where country="Canada" AND ID IN (SELECT rental.customer_id FROM actor,film_actor,inventory,rental WHERE actor.first_name = 'NICK' and actor.last_name='WAHLBERG' AND actor.actor_id=film_actor.actor_id AND film_actor.film_id = inventory.film_id AND rental.inventory_id = inventory.inventory_id);


select count(film_actor.film_id) from film_actor,actor where actor.first_name="SEAN" and actor.last_name="WILLIAMS" and film_actor.actor_id=actor.actor_id;


select * from category;



select count(title) from film where special_features LIKE "%Deleted Scenes%" and film_id in (select film_id from film_category where category_id=(select category_id from category where name="Documentary"));


select * from film_list;
select * from category;
select count(*) from film_list where category='Sci-Fi' and FID in (select inventory.film_id from inventory,staff,rental where staff.first_name='Jon' and staff.last_name='Stephens' and staff.store_id = inventory.store_id and inventory.inventory_id = rental.inventory_id);

select total_sales from sales_by_film_category where category="Animation";

select * from film;

select category,count(category) from film_list where FID in (select inventory.film_id from inventory,rental,customer where inventory.inventory_id=rental.inventory_id and rental.customer_id=customer.customer_id and customer.first_name="PATRICIA" and customer.last_name="JOHNSON") group by category order by count(category) desc limit 3;


select * from film;


select count(*) from film_list where rating ="R" and FID in (select inventory.film_id from customer,rental,inventory where customer.first_name="SUSAN" and customer.last_name="WILSON" and customer.customer_id=rental.customer_id and rental.inventory_id=inventory.inventory_id );








