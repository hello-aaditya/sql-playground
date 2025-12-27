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