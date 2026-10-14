# Requirement: Create the Amazon Database and Product Table

## Objective
Create a MySQL database named `amazon` and define a `PRODUCT` table to store product information.

### 1. Database Creation
- Create a database named `amazon`.
- Select the `amazon` database for subsequent SQL operations.

### 2. Table Creation
Create a table named `PRODUCT` with the following attributes and constraints:

|Attribute|Data Type|Constraints / Requirements|
|---|---|---|
|`product_id`|INT|Primary Key|
|`product_name`|VARCHAR(255)|NOT NULL|
|`description`|TEXT|Optional|
|`brand`|VARCHAR(100)|Optional|
|`price`|DECIMAL(10,2)|NOT NULL|
|`product_status`|ENUM|Allowed values: `ACTIVE`, `INACTIVE`, `DISCONTINUED`|
|`created_at`|TIMESTAMP|Record creation timestamp|
|`updated_at`|TIMESTAMP|Timestamp of the last record update|

### 3. Implementation Requirements
- Use appropriate MySQL data types for all attributes.
- Ensure `product_id` uniquely identifies each product.
- Prevent the insertion of records without a product name or price.
- Restrict `product_status` to the specified values.
- Configure `created_at` to capture the record creation time automatically.
- Configure `updated_at` to update automatically whenever the record is modified.

### 4. Deliverables
- A database named `amazon`.
- A `PRODUCT` table created with the specified attributes and constraints.
- Verification of the table structure using the `DESC` command.
