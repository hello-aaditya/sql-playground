Platform: [sql-practice.com](https://www.sql-practice.com/)
Table: northwind.db
# 1. Select All Product Names & their Category Names
```sql
with productCategories as (
    select
      p.product_name,
      c.category_name
    from products as p
    join categories as c on p.category_id = c.category_id
)

select *
from productCategories;
```
# 2. Select CustomerID and Each Customers Number of Orders
```sql
with orderDetails as (
	select 
		c.customer_id as Customer_ID,
		count(o.Order_id) as Total_Orders
	from customers as c
	join orders as o on c.customer_id = o.customer_id
	group by c.customer_id
)

select *
from orderDetails
order by Total_Orders desc;
```
# 3. Select the ProductName and the TOTAL Number of Orders for Each product
only return products that have been ordered more than 50 times
```sql
with productDetails as (
  select
    p.product_name,
    sum(o.quantity) as order_count
  from products as p
  join order_details as o
  on p.product_id = o.product_id
  group by product_name
)

select *
from productDetails
where order_count > 50
order by order_count desc;
```