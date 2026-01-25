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

SELECT * FROM categories;
```


# `products` Table
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(60),
    category_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products VALUES
(1, 'Bluetooth Headphones', 1, 1999.00, 40),
(2, 'Smartphone', 1, 14999.00, 25),
(3, 'Running Shoes', 2, 2999.00, 60),
(4, 'T-Shirt', 2, 499.00, 100),
(5, 'SQL Basics Book', 3, 699.00, 80),
(6, 'Non-stick Pan', 4, 1299.00, 35),
(7, 'Cricket Bat', 5, 1599.00, 20),
(8, 'Face Wash', 6, 299.00, 120),
(9, 'Toy Car', 7, 399.00, 90),
(10, 'Office Chair', 10, 4999.00, 15);

SELECT * FROM products;
```

# `orders` Table
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(101, 1, '2024-08-01', 'Delivered'),
(102, 2, '2024-08-02', 'Delivered'),
(103, 3, '2024-08-03', 'Pending'),
(104, 4, '2024-08-04', 'Cancelled'),
(105, 5, '2024-08-05', 'Delivered'),
(106, 6, '2024-08-06', 'Pending'),
(107, 7, '2024-08-07', 'Delivered'),
(108, 8, '2024-08-08', 'Delivered'),
(109, 9, '2024-08-09', 'Pending'),
(110, 10, '2024-08-10', 'Delivered');

SELECT * FROM orders;
```

# `order_items` Table
```sql
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 101, 2, 1),
(2, 101, 1, 1),
(3, 102, 3, 2),
(4, 103, 5, 1),
(5, 104, 4, 3),
(6, 105, 6, 1),
(7, 106, 7, 1),
(8, 107, 8, 2),
(9, 108, 9, 1),
(10, 110, 10, 1);

SELECT * FROM order_items;
```
