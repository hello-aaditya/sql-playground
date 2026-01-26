## Moderate Level Questions

#### Question-1

##### Show total number of orders for each customer (customer_name, total_orders)

#### Question-2

##### Find the total revenue per order (order_id, total_amount = SUM(price * quantity))

#### Question-3

##### Show the top 3 most expensive products (ORDER BY + LIMIT)

#### Question-4

##### Display customers who have never placed any order (LEFT JOIN / NOT EXISTS)

#### Question-5

##### Find the total quantity sold for each product (product_name, total_quantity_sold)

#### Question-6

##### Show the category-wise total number of products (category_name, total_products)

#### Question-7

##### Find the customer who spent the most money (customer_name, total_spent)

#### Question-8

##### Show all orders with more than 1 item in them (order_id, items_count)

#### Question-9

##### Find the most ordered product (highest total quantity) (product_name, total_quantity_sold)

#### Question-10

##### Show month-wise number of orders (month, total_orders) using order_date grouping

```sql

/*
Question-11
Show total number of orders for each customer (customer_name, total_orders)
*/
SELECT
	c.name,
    COUNT(o.order_id) AS total_order
FROM
	customers AS c
JOIN orders AS o
ON o.customer_id = c.customer_id
GROUP BY c.customer_id;

/*
Question-12
Find the total revenue per order (order_id, total_amount = SUM(price * quantity))
*/
SELECT
	oi.order_id,
    SUM(p.price * oi.quantity) AS total_amount
FROM
	order_items AS oi
JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY oi.order_id;
	
/*
Question-13
Show the top 3 most expensive products (ORDER BY + LIMIT)
*/
SELECT
	product_id,
    product_name,
    price
FROM
	products
ORDER BY price DESC
LIMIT 3;

/*
Question-14
Display customers who have never placed any order (LEFT JOIN / NOT EXISTS)
*/
SELECT
	c.*
    -- o.order_id
FROM
	customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
Question-15
Find the total quantity sold for each product (product_name, total_quantity_sold)
*/

SELECT
	p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM
	order_items AS oi
JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY p.product_id;

/*
Question-16
Show the category-wise total number of products (category_name, total_products)
*/
SELECT
	c.category_name,
    COUNT(p.product_id) AS total_products
FROM
	categories AS c
JOIN products AS p
ON c.category_id = p.category_id
GROUP BY c.category_name;

/*
Question-17
Find the customer who spent the most money (customer_name, total_spent)
*/
SELECT
	c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM
	customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
JOIN order_items AS oi
ON oi.order_id = o.order_id
JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;
/*
Question-18
Show all orders with more than 1 item in them (order_id, items_count)
*/
SELECT
	o.order_id,
    COUNT(oi.quantity) AS items_count
FROM
	orders AS o
JOIN order_items AS oi
ON o.order_id = oi.order_id
WHERE oi.quantity > 1;

/*
Question-19
Find the most ordered product (highest total quantity) (product_name, total_quantity_sold)
*/
SELECT
	p.*,
    oi.*
FROM
products AS p
JOIN order_items AS oi
ON p.product_id = oi.product_id;

/*
Question-20
Show month-wise number of orders (month, total_orders) using order_date grouping
*/
SELECT
	MONTH(o.order_date) AS month,
    COUNT(o.order_id) AS total_orders
FROM
	orders AS o
GROUP BY MONTH(o.order_date)
ORDER BY month;

```