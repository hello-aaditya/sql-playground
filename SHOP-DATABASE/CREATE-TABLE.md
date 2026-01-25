# `shop_db` Database
```sql
CREATE DATABASE shop_db;
USE shop_db;
```
# `customers` Table
```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(60),
    city VARCHAR(30),
    join_date DATE
);

INSERT INTO customers VALUES
(1, 'Love Hegde', 'hegde@gmail.com', 'Delhi', '2024-01-10'),
(2, 'Ravi Verma', 'ravi@gmail.com', 'Mumbai', '2024-02-15'),
(3, 'Neha Singh', 'neha@gmail.com', 'Pune', '2024-03-05'),
(4, 'Karan Verma', 'karan@gmail.com', 'Delhi', '2024-03-20'),
(5, 'Simran Kaur', 'simran@gmail.com', 'Chandigarh', '2024-04-01'),
(6, 'Aman Gupta', 'aman@gmail.com', 'Bangalore', '2024-04-12'),
(7, 'Priya Mehta', 'priya@gmail.com', 'Ahmedabad', '2024-05-10'),
(8, 'Sahil Jain', 'sahil@gmail.com', 'Jaipur', '2024-06-18'),
(9, 'Anjali Roy', 'anjali@gmail.com', 'Kolkata', '2024-07-03'),
(10, 'Vikas Patel', 'vikas@gmail.com', 'Surat', '2024-07-25');

SELECT * FROM customers;
```

# `categories` Table
```sql
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(30)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Books'),
(4, 'Home & Kitchen'),
(5, 'Sports'),
(6, 'Beauty'),
(7, 'Toys'),
(8, 'Groceries'),
(9, 'Stationery'),
(10, 'Furniture');

SELECT * FROM categories;```


# `products` Table
```sql
```

# `orders` Table
```sql
```

# `order_items` Table
```sql
```
