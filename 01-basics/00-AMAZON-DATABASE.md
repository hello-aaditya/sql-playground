# Requirement: Create the Amazon Database and Product Table

## Objective
Create a MySQL database named `amazon`, define a `product` table, populate it with sample product records, and execute SQL queries covering data retrieval, filtering, sorting, aggregation, grouping, and timestamp verification.

### 1. Database Creation
- Create a database named `amazon`.
- Select the `amazon` database for subsequent SQL operations.

### 2. Table Creation
Create a table named `PRODUCT` with the following attributes and constraints:

| Attribute        | Data Type     | Constraints / Requirements                           |
| ---------------- | ------------- | ---------------------------------------------------- |
| `product_id`     | INT           | Primary Key                                          |
| `product_name`   | VARCHAR(255)  | NOT NULL                                             |
| `description`    | TEXT          | Optional                                             |
| `brand`          | VARCHAR(100)  | Optional                                             |
| `price`          | DECIMAL(10,2) | NOT NULL                                             |
| `product_status` | ENUM          | Allowed values: `ACTIVE`, `INACTIVE`, `DISCONTINUED` |
| `created_at`     | TIMESTAMP     | Automatically records the creation timestamp         |
| `updated_at`     | TIMESTAMP     | Automatically updates when the record is modified    |

### 3. Initial Data Insertion
Insert product records into the `PRODUCT` table.

Requirements:
- Include products from multiple brands.
- Include products with different prices.
- Include records with different statuses: `ACTIVE`, `INACTIVE`, and `DISCONTINUED`.
- Ensure each `product_id` is unique.
- Verify that the timestamps are populated automatically.
### 4. Data Selection and Projection
Execute the following queries:
1. Retrieve all columns and records from `product`.
2. Retrieve only `product_name` and `price`.
### 5. Data Filtering and Sorting
Execute queries to:
1. Retrieve products priced above ₹10,000.
2. Retrieve products whose status is `ACTIVE`.
3. Retrieve products manufactured by `Logitech`.
4. Sort all products by price in descending order.
### 6. Aggregate and Grouping Operations
Execute queries to:
1. Count the total number of product records using `COUNT(*)`.
2. Count products grouped by `product_status` using `GROUP BY`.
### 7. Timestamp Verification
- Retrieve `product_id`, `created_at`, and `updated_at` for five records using `LIMIT 5`.
- Verify that timestamps are populated automatically when products are inserted.
- Verify that `updated_at` changes when an existing product record is modified.
### 8. Deliverables
- Database: `amazon`.
- Table: `product`.
- 55 sample product records.
- Successfully executed retrieval, projection, filtering, sorting, aggregation, and grouping queries.
- Verified table structure and timestamp behavior.
### Scope
This phase covers database creation, table definition, initial data insertion, basic SQL retrieval, filtering, sorting, aggregate functions, grouping, and timestamp verification. `UPDATE`, `DELETE`, joins, and multi-table database design will be addressed in subsequent phases, except for the single update operation required to verify timestamp behavior.
## Solution
### 1. Database Creation
```sql
-- Create the database
CREATE DATABASE amazon;

-- Select the database for all subsequent operations
USE amazon;
```
### 2. Table Creation
```sql
CREATE TABLE product (
    product_id INT PRIMARY KEY,                         
    product_name VARCHAR(255) NOT NULL,                 
    description TEXT,                                   
    brand VARCHAR(100),                                 
    price DECIMAL(10, 2) NOT NULL,                      
    product_status ENUM (
        'ACTIVE',
        'INACTIVE',
        'DISCONTINUED'
    ),                                                  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP                     
);

-- Verify the table structure
DESC product;
```
### 3. Initial Data Insertion
```sql
-- Insert 55 sample records (product_id 101 to 155)
-- created_at and updated_at are not listed, so MySQL fills them automatically
INSERT INTO product
    (product_id, product_name, description, brand, price, product_status)
VALUES

    -- MIX PRODUCTS
    (101, 'Galaxy S25', 'Android smartphone', 'Samsung', 79999.00, 'ACTIVE'),
    (102, 'iPhone 17', 'Apple smartphone', 'Apple', 82900.00, 'ACTIVE'),
    (103, 'ThinkPad E14', 'Business laptop', 'Lenovo', 65000.00, 'ACTIVE'),
    (104, 'Wireless Mouse', 'Wireless computer mouse', 'Logitech', 1200.00, 'INACTIVE'),
    (105, 'USB Keyboard', 'Wired computer keyboard', 'Logitech', 850.00, 'DISCONTINUED'),

    -- Home & Kitchen
    (106, 'Prestige Deluxe Plus Pressure Cooker 3L', 'Stainless steel pressure cooker', 'Prestige', 2450.00, 'ACTIVE'),
    (107, 'Pigeon Favourite Electric Kettle 1.5L', 'Stainless steel electric kettle', 'Pigeon', 749.00, 'ACTIVE'),
    (108, 'Milton Thermosteel Flask 1000ml', 'Vacuum-insulated steel flask', 'Milton', 1099.00, 'ACTIVE'),
    (109, 'Cello Hawkm Anti-Slip Bowl Set', 'Melamine mixing bowl set of 3', 'Cello', 699.00, 'INACTIVE'),
    (110, 'Philips HD9252 Air Fryer 4.1L', 'Rapid air technology fryer', 'Philips', 9499.00, 'ACTIVE'),
    (111, 'Godrej Interio Aer Chair', 'Ergonomic office chair', 'Godrej Interio', 12999.00, 'ACTIVE'),
    (112, 'Solimo 3-Seat Fabric Sofa', 'Three seater fabric sofa', 'Solimo', 21999.00, 'ACTIVE'),
    (113, 'Sleepwell Durafirm Mattress Queen', 'Queen size coir mattress', 'Sleepwell', 18990.00, 'ACTIVE'),
    (114, 'Borosil OTG 28L', '28 litre oven toaster griller', 'Borosil', 6990.00, 'ACTIVE'),
    (115, 'Usha Elstra Table Fan 400mm', 'High speed table fan', 'Usha', 2299.00, 'DISCONTINUED'),

    -- Fashion & Footwear
    (116, 'Fastrack Reflex Play Smartwatch Band', 'Analog-digital watch', 'Fastrack', 3995.00, 'ACTIVE'),
    (117, 'Titan Neo Analog Watch', 'Men stainless steel watch', 'Titan', 7995.00, 'ACTIVE'),
    (118, 'Nike Revolution 6 Running Shoes', 'Road running shoes', 'Nike', 3695.00, 'ACTIVE'),
    (119, 'Adidas Adicane Slippers', 'Unisex sport slides', 'Adidas', 1299.00, 'ACTIVE'),
    (120, 'Levis 505 Regular Fit Jeans', 'Straight fit mens jeans', 'Levis', 2999.00, 'ACTIVE'),
    (121, 'Allen Solly Slim Fit Formal Shirt', 'Cotton formal shirt', 'Allen Solly', 1899.00, 'ACTIVE'),
    (122, 'Puma Smash V2 Sneakers', 'Leather court sneakers', 'Puma', 2699.00, 'INACTIVE'),
    (123, 'HRX Running T-Shirt', 'Quick dry polyester tee', 'HRX by Hrithik Roshan', 799.00, 'ACTIVE'),
    (124, 'Bata Formal Leather Shoes', 'Mens derby shoes', 'Bata', 2299.00, 'ACTIVE'),
    (125, 'Louis Philippe Premium Belt', 'Genuine leather belt', 'Louis Philippe', 1599.00, 'DISCONTINUED'),

    -- Beauty & Personal Care
    (126, 'Nivea Soft Light Moisturiser 300ml', 'Vitamin E body moisturiser', 'Nivea', 350.00, 'ACTIVE'),
    (127, 'Lakme Absolute Skin Dew Gel', 'Satin gel moisturiser', 'Lakme', 899.00, 'ACTIVE'),
    (128, 'Philips BT1232 Trimmer', 'USB rechargeable beard trimmer', 'Philips', 1049.00, 'ACTIVE'),
    (129, 'Veet Hair Removal Cream 80g', 'Sensitive skin hair removal cream', 'Veet', 299.00, 'ACTIVE'),
    (130, 'Mamaearth Vitamin C Face Serum', 'Illuminating face serum', 'Mamaearth', 499.00, 'ACTIVE'),
    (131, 'Gillette Mach3 Razor Cartridges 6Pk', 'Triple-blade razor refills', 'Gillette', 875.00, 'INACTIVE'),
    (132, 'Loreal Paris Casting Creme Hair Colour', 'Ammonia-free hair colour', 'LOreal Paris', 399.00, 'ACTIVE'),

    -- Books & Stationery
    (133, 'The Psychology of Money', 'Personal finance book by Morgan Housel', 'Jaico Publishing House', 399.00, 'ACTIVE'),
    (134, 'Atomic Habits', 'Self-improvement book by James Clear', 'Penguin Random House', 478.00, 'ACTIVE'),
    (135, 'The Great Indian Novel', 'Satirical novel by Shashi Tharoor', 'Penguin India', 599.00, 'DISCONTINUED'),
    (136, 'Classmate Long Register 120 Pages', 'Single line soft bound register', 'Classmate', 85.00, 'ACTIVE'),
    (137, 'Parker Vector Standard GT Ball Pen', 'Stainless steel ballpoint pen', 'Parker', 575.00, 'ACTIVE'),

    -- Sports & Fitness
    (138, 'Yonex Muscle Power 29 Badminton Racquet', 'Graphite badminton racquet', 'Yonex', 2490.00, 'ACTIVE'),
    (139, 'SG Test Cricket Ball', 'Four piece leather cricket ball', 'SG', 799.00, 'ACTIVE'),
    (140, 'Cosco Fb Rugby Football Size 5', 'Rubber moulded football', 'Cosco', 699.00, 'ACTIVE'),
    (141, 'Boldfit Yoga Mat 6mm', 'Non-slip exercise mat', 'Boldfit', 549.00, 'ACTIVE'),
    (142, 'Nivia Carbide Stud Football Shoes', 'Studded football boots', 'Nivia', 1499.00, 'INACTIVE'),
    (143, 'Aurion Adjustable Dumbbell Set 10Kg', 'PVC weight plates set', 'Aurion', 1299.00, 'ACTIVE'),

    -- Electronics & Gadgets
    (144, 'Sony WH-1000XM4 Headphones', 'Wireless noise cancelling headphones', 'Sony', 19990.00, 'ACTIVE'),
    (145, 'boAt Airdopes 141 TWS Earbuds', 'True wireless earbuds with mic', 'boAt', 1099.00, 'ACTIVE'),
    (146, 'JBL Go 3 Portable Speaker', 'Compact Bluetooth speaker', 'JBL', 2199.00, 'ACTIVE'),
    (147, 'Mi Smart Band 7 Pro', 'Fitness band with GPS', 'Xiaomi', 3499.00, 'DISCONTINUED'),
    (148, 'Canon EOS 3000D DSLR Camera', '18MP DSLR with 18-55mm lens', 'Canon', 36990.00, 'ACTIVE'),
    (149, 'Amazon Echo Dot 4th Gen', 'Smart speaker with Alexa', 'Amazon', 4499.00, 'ACTIVE'),
    (150, 'Logitech MX Master 3S Mouse', 'Wireless ergonomic mouse', 'Logitech', 9495.00, 'ACTIVE'),
    (151, 'Dell UltraSharp U2422H 24 Monitor', 'Full HD IPS monitor', 'Dell', 15999.00, 'ACTIVE'),
    (152, 'LG 1.5 Ton 5 Star Split AC', 'Inverter split air conditioner', 'LG', 39990.00, 'ACTIVE'),
    (153, 'Samsung 253L Refrigerator', 'Double door frost-free fridge', 'Samsung', 28490.00, 'ACTIVE'),
    (154, 'Whirlpool 7Kg Front Load Washing Machine', 'Fully automatic front loader', 'Whirlpool', 32990.00, 'ACTIVE'),
    (155, 'Havells Puro Plus Water Purifier', 'RO+UV water purifier', 'Havells', 15999.00, 'INACTIVE');

-- Verify that timestamps were populated automatically
SELECT product_id, product_name, created_at, updated_at
    FROM product
    LIMIT 5;
```
### 4. Data Selection and Projection
```sql
-- SELECTION: all columns, all records
SELECT * FROM product;

-- PROJECTION: only product_name and price
SELECT product_name, price FROM product;
```
### 5. Data Filtering and Sorting
```sql
-- 1. Products priced above 10,000
SELECT * FROM product
    WHERE price > 10000;

-- 2. Products with status ACTIVE
SELECT * FROM product
    WHERE product_status = 'ACTIVE';

-- 3. Products by brand Logitech
SELECT * FROM product
    WHERE brand = 'Logitech';

-- 4. All products sorted by price, highest first
SELECT * FROM product
    ORDER BY price DESC;
```
### 6. Aggregate and Grouping Operations
```sql
-- 1. Total number of products
SELECT COUNT(*) AS total_products
    FROM product;

-- 2. Number of products in each status
SELECT product_status, COUNT(*) AS total
    FROM product
    GROUP BY product_status;
```
### 7. Timestamp Verification
```sql
-- Retrieve timestamps for five records
-- created_at and updated_at were filled automatically at insert time
SELECT product_id, created_at, updated_at
    FROM product
    LIMIT 5;

-- Verify updated_at changes on modification
-- Step 1: note the current timestamps of product 101
SELECT product_id, price, created_at, updated_at
    FROM product
    WHERE product_id = 101;

-- Step 2: modify the record (the single UPDATE allowed in this phase)
UPDATE product
    SET price = 78999.00
    WHERE product_id = 101;

-- Step 3: check again - updated_at should now be newer, created_at unchanged
SELECT product_id, price, created_at, updated_at
    FROM product
    WHERE product_id = 101;
```
