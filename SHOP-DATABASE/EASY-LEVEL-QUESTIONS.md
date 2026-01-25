# 10 Easy SQL Practice Questions

### 1) Show all customers from **Delhi**

_(customers table)_

---

### 2) Display all products with **price greater than 1000**

_(products table)_

---

### 3) Show all categories available in the database

_(categories table)_

---

### 4) List all orders with status = **'Pending'**

 _(orders table)_

---

### 5) Show the **names and emails** of all customers who joined **after 2024-04-01**

✅ _(customers table)_

---

### 6) Display all products sorted by **price (highest to lowest)**

✅ _(products table — ORDER BY)_

---

### 7) Find total number of customers in the database

✅ _(COUNT)_

---

### 8) Show each order with its customer name

(Join `orders` + `customers`)  
✅ _(basic JOIN)_

---

### 9) Show order items with product name and quantity

(Join `order_items` + `products`)  
✅ _(basic JOIN)_

---

### 10) Show full order details:

**order_id, customer_name, product_name, quantity, order_date, status**  
(Join all needed tables)  
✅ _(multi-table JOIN)_
```sql
-- ######## QUESTIONS ########
/* 
1) Show all customers from Delhi
	(customers table)
*/
SELECT
	customer_id,
	name
FROM
	customers
WHERE 
	city = "Delhi";
    
    
/*
2) Display all products with price greater than 1000
	(products table)
*/
SELECT
	*
FROM
	products
WHERE 
	price > 1000;
    
/*
3) Show all categories available in the database
	(categories table)
*/
SELECT
	*
FROM
	categories;
/*
4) List all orders with status = 'Pending'
	(orders table)
*/
SELECT
	*
FROM
	orders
WHERE
	status = "Pending";

/*
5) Show the names and emails of all customers who joined after 2024-04-01
	(customers table)
*/
SELECT
	name,
    email
FROM
	customers
WHERE join_date > '2024-04-01';
    
/*
6) Display all products sorted by price (highest to lowest)
	(products table — ORDER BY)
*/
SELECT
	*
FROM products
GROUP BY price DESC;

/*
7) Find total number of customers in the database
	(COUNT)
*/
SELECT
	COUNT(*) AS Total_Customers
FROM
	customers;
    
/*
8) Show each order with its customer name
	(Join orders + customers)
	(basic JOIN)
*/
SELECT
	o.order_id,
    c.name AS customer_name,
    o.order_date,
    o.status
FROM
	orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id;
    

/*
9) Show order items with product name and quantity
	(Join order_items + products)
	(basic JOIN)
*/
SELECT
	oi.order_item_id,
    oi.order_id,
	p.product_name,
    oi.quantity
FROM
	order_items AS oi
JOIN products AS p
ON oi.product_id = p.product_id;


/*
10) Show full order details:
	order_id, customer_name, product_name, quantity, order_date, status
	(Join all needed tables)
	(multi-table JOIN)
*/
SELECT
	o.order_id,
    c.name AS customer_name,
    p.product_name,
    oi.quantity,
    o.order_date,
    o.status
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
JOIN order_items AS oi
ON o.order_id = oi.order_id
JOIN products AS p
ON oi.product_id = p.product_id;
```