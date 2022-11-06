SELECT DISTINCT item_name FROM orders
WHERE item_name like '%chicken%';

-- IF(condition, value if true, value if false)
-- if statements are generally best for T/F

select item_name, if(item_name = 'Chicken Bowl', 'yes', 'no')
 AS is_chicken_bowl from orders;
 
 select item_name, if(item_name LIKE '%Chicken%', True, False)
 AS has_chicken_bowl from orders
 order by item_name;
 
 -- same as --
 -- We don't have to explicitly write out if when T/F --
select item_name, item_name LIKE '%Chicken%' as has_chicken
from orders
order by item_name;

-- turn the above into a subquery that we can operate on--

select sum(has_chicken) as total_chicken_items
from (
	select item_name, item_name LIKE '%Chicken%' as has_chicken
	from orders
	order by item_name) as a
;


/* 

case column
	when condtion_a then value_a
	when condition_b then value_b
	else value_c
end as new_column_name

Whatever doesn't fit condition a or condition b will default to value_c

*/

-- the conditions are checking one column
-- the conditions are checking for equality
-- can check more than T/F

select distinct
 item_name from orders;

-- let's find the bowls
select distinct item_name, 
	case item_name
		when 'Chicken Bowl' then 'yes_chicken'
		when 'Steak Bowl' then 'yes_steak'
		else 'other_bowl' #don't have to put an else, it will just fill in with NULLs
	-- else(concat('this_is_not_a_bowl', replace(lower(item_name), '', '_')
	-- above line is example of other things we can do in the else statement	
	end #whenever you use a case statement you have to end it
from orders;




/* other case statement option

syntax:

SELECT
    CASE
       WHEN column_a > condition_1 THEN value_1
       WHEN column_b <= condition_2 THEN value_2
       ELSE value_3
   END AS new_column_name
FROM table_a;


-- more flexibility
-- multiple colums check
-- can utilize different operators
-- generally preferred

 */



select distinct order_id, item_name,
	case
		when item_name like '%bowl%' then 'is_bowl'
		when order_id = 1 then 'first_order'
		when item_name = 'Izze' then 'found_izze'
		else 'not_a_bowl'
	end as 'where_are_the_bowls'
from orders;

-- let's group our quantitites

select quantity, count(*)
from orders
group by quantity
order by quantity;


select *
FROM
	(select quantity,
		case
			when quantity >= 5 then 'big_orders'
			when quantity >= 2 then 'middle_size_orders'
			else 'single_orders'
		end as 'order_size_by_item'
	from orders) as o
group by quantity
;


### pivot table


select quantity, item_name 
from orders 
where item_name like '%chicken%';

-- building all the columns

select quantity, item_name,
	case 
		when item_name = 'Chicken Bowl' then item_name
		else null
	end as 'Chicken Bowl'
from orders 
where item_name like '%chicken%';


-- adding groupby and count






 
 
  