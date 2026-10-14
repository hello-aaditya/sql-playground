# Requirement: Create the Amazon Database and Product Table

## Objective
Create a MySQL database named `amazon` and define a `PRODUCT` table to store product information.

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
| `created_at`     | TIMESTAMP     | Record creation timestamp                            |
| `updated_at`     | TIMESTAMP     | Timestamp of the last record update                  |

### 3. Initial Data Insertion
Insert product records into the `PRODUCT` table.

Requirements:
- Include products from multiple brands.
- Include products with different prices.
- Include records with different statuses: `ACTIVE`, `INACTIVE`, and `DISCONTINUED`.
- Ensure each `product_id` is unique.
- Verify that the timestamps are populated automatically.
### 4. Data Retrieval and Filtering
Implement and execute the following SQL queries:
1. Retrieve all columns and records from `PRODUCT`.
2. Retrieve only `product_name` and `price` for all products.
3. Retrieve products whose price is greater than ₹10,000.
4. Retrieve products with `product_status = 'ACTIVE'`.
5. Retrieve products belonging to the `Logitech` brand.
6. Display all products sorted by price in descending order.
### 5. Verification Requirements
- Verify database selection using `SELECT DATABASE();`.
- Verify table creation using `SHOW TABLES;`.
- Verify the table structure using `DESC PRODUCT;`.
- Verify inserted records using `SELECT * FROM PRODUCT;`.
- Confirm that the ENUM column accepts only the specified status values under strict SQL mode.
- Confirm that `created_at` and `updated_at` behave as specified.
### 6. Deliverables
- A MySQL database named `amazon`.
- A `PRODUCT` table satisfying the specified schema.
- At least five inserted product records.
- Successfully executed SQL queries for all six retrieval requirements.
- Verified table structure and timestamp behavior.
## Solution
```sql
-- 1. Create the database
CREATE DATABASE amazon;

-- 2. Select the database
USE amazon;

-- 3. Create the PRODUCT table
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

-- 4. Verify the table structure
DESC product;
```