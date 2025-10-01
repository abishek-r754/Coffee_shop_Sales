select * from coffee_shop

update coffee_shop
set transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

alter table coffee_shop
modify column transaction_date DATE;

update coffee_shop
set transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

alter table coffee_shop
modify column transaction_time TIME;

describe coffee_shop

select * from coffee_shop

alter table coffee_shop
change column ï»¿transaction_id transaction_id INT;

describe coffee_shop

select round(sum(unit_price * transaction_qty)) as Total_Sales
from coffee_shop
where
month(transaction_date) = 1 -- January Month


select
month(transaction_date) as month,
round(sum(unit_price * transaction_qty)) as Total_Sales,
(sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty), 1)
over(order by month(transaction_date))) / lag(sum(unit_price * transaction_qty), 1)
over(order by month(transaction_date)) * 100 as mom_increase_percentage
from
    coffee_shop
where
    month(transaction_date) in (4, 5) -- for month of april and may
group by
	month(transaction_date)
order by
	month(transaction_date);   
    
select count(transaction_id) as Total_Order
from coffee_shop
where
month(transaction_date) = 1 -- January Month 

select * from coffee_shop

select
month(transaction_date) as month,
round(count(transaction_id)) as Total_Orders,
(count(transaction_id) - lag(count(transaction_id), 1)
over (order by month(transaction_date))) / lag(count(transaction_id), 1)
over (order by month(transaction_date)) * 100 as mom_increase_percentage
from
coffee_shop
where
month(transaction_date) in (4, 5) -- for apr and may
group by
month(transaction_date)
order by
month(transaction_date);

select * from coffee_shop

select sum(transaction_qty) as Total_Quantity_Sold
from coffee_shop
where
month(transaction_date) = 5 -- may month

select
month(transaction_date) as month,
round(sum(transaction_qty)) as Total_Quantity_Sold,
(sum(transaction_qty) - lag(sum(transaction_qty), 1)
over(order by month(transaction_date))) / lag(sum(transaction_qty), 1)
over(order by month(transaction_date)) * 100 as mom_increase_percentage
from
coffee_shop
where
month(transaction_date) in (4, 5) -- apr and may
group by
month(transaction_date)
order by
month(transaction_date);

select
concat(round(sum(unit_price * transaction_qty)/1000,1), 'K') as Total_sales,
concat(round(sum(transaction_qty)/1000,1), 'K') as Total_Qty_Sold,
concat(round(count(transaction_id)/1000,1), 'K') as Total_orders
from coffee_shop
where
transaction_date = '2023-03-27'


-- weekend - sat and sun
-- weekday - mon to fri

sun = 1
mon = 2
.
.
sat = 7

select * from coffee_shop

select
case when dayofweek(transaction_date) in (1, 7) then 'Weekends'
else 'Weekdays'
end as day_type,
concat(round(sum(unit_price * transaction_qty)/1000,1), 'K') as Total_Sales
from coffee_shop
where month(transaction_date) = 5 -- may month
group by
case when dayofweek(transaction_date) in (1, 7) then 'Weekends'
else 'Weekdays'
end

select * from coffee_shop

select
store_location,
concat(round(sum(unit_price * transaction_qty)/1000,2), 'K') as Total_sales
from coffee_shop
where month(transaction_date) = 5 -- may
group by store_location
order by sum(unit_price * transaction_qty)desc

select avg(unit_price * transaction_qty) as Avg_Sales
from coffee_shop
where month(transaction_date) = 5

select * from coffee_shop

select 
concat(round(avg(total_sales)/1000, 1), 'K')  as Avg_Sales
from
(
select sum(transaction_qty * unit_price) as Total_Sales
from coffee_shop
where month (transaction_date) = 4
group by transaction_date
) as internal_query

select
day(transaction_date) as day_of_month,
sum(unit_price * transaction_qty) as total_sales
from coffee_shop
where month (transaction_date) = 5
group by day (transaction_date)
order by day (transaction_date)

select * from coffee_shop

select
day_of_month,
case
when total_sales > avg_sales then 'Above Average'
when total_sales < avg_sales then 'Below Average'
else 'Average'
end as Sales_Status,
total_sales
from (
select
day (transaction_date) as day_of_month,
sum(unit_price * transaction_qty) as total_sales,
avg(sum(unit_price * transaction_qty)) over () as avg_sales
from
coffee_shop
where
month(transaction_date) = 5 -- filter for may
group by 
day (transaction_date)
) as sales_data
order by
day_of_month;

select * from coffee_shop

select
product_category,
concat(round(sum(unit_price * transaction_qty)/1000,1), 'K') as total_sales
from coffee_shop
where month(transaction_date) = 5
group by product_category
order by sum(unit_price * transaction_qty) desc

select
product_type,
concat(round(sum(unit_price * transaction_qty)/1000,1), 'K') as total_sales
from coffee_shop
where month(transaction_date) = 5 and product_category = 'Tea' 
group by product_type
order by sum(unit_price * transaction_qty) desc
limit 10

select * from coffee_shop

select
concat(round(sum(unit_price * transaction_qty)/1000, 1), 'K') as total_sales,
sum(transaction_qty) as Total_Qty_Sold,
count(*) as Total_Orders
from coffee_shop
where month(transaction_date) = 5 -- may month
and dayofweek(transaction_date) = 1 -- sunday
and hour(transaction_time) = 14 -- hour no 14

select * from coffee_shop

select
hour(transaction_time),
concat(round(sum(unit_price * transaction_qty)/1000, 1), 'K') as total_sales
from coffee_shop
where month(transaction_date) = 5
group by hour(transaction_time)
order by hour(transaction_time)

select * from coffee_shop

select
case
when DAYOFWEEK(transaction_date) = 2 then 'Monday'
when DAYOFWEEK(transaction_date) = 3 then 'Tuesday'
when DAYOFWEEK(transaction_date) = 4 then 'Wednesday'
when DAYOFWEEK(transaction_date) = 5 then 'Thursday'
when DAYOFWEEK(transaction_date) = 6 then 'Friday'
when DAYOFWEEK(transaction_date) = 7 then 'Saturday'
else 'Sunday'
end as day_of_week,
round(sum(unit_price * transaction_qty)) as total_sales
from
coffee_shop
where
month(transaction_date) = 5 -- filter for may
group by 
case
when DAYOFWEEK(transaction_date) = 2 then 'Monday'
when DAYOFWEEK(transaction_date) = 3 then 'Tuesday'
when DAYOFWEEK(transaction_date) = 4 then 'Wednesday'
when DAYOFWEEK(transaction_date) = 5 then 'Thursday'
when DAYOFWEEK(transaction_date) = 6 then 'Friday'
when DAYOFWEEK(transaction_date) = 7 then 'Saturday'
else 'Sunday'
end;





































