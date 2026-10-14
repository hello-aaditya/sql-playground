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