# [SQL 50](https://leetcode.com/studyplan/top-sql-50/)
### 1.
**Link:**  [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)
```sql
SELECT
    product_id
FROM
    products
WHERE
    low_fats like 'Y' AND recyclable like 'Y';
```
### 2.
**Link:** [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)
```sql
SELECT
    name
FROM
    Customer
WHERE
    referee_id != 2 OR referee_id IS NULL;
```
### 3.
**Link:** [595. Big Countries](https://leetcode.com/problems/big-countries/)
```sql
SELECT
    name,
    population,
    area
FROM
    World
WHERE
    area >= 3000000
    OR population >= 25000000;
```
### 4.
**Link:** [1148. Article Views I](https://leetcode.com/problems/article-views-i/)
```SQL
SELECT
    DISTINCT author_id AS id
FROM
    Views
WHERE
    author_id = viewer_id
ORDER BY
    author_id;
```
### 5.
**Link:** [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)
```sql
SELECT
    tweet_id
FROM
    Tweets
WHERE
    LENGTH(content) > 15;
```
### 6.
**Link:** [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)
```SQL
SELECT
    eu.unique_id,
    e.name
FROM
    Employees as e
LEFT JOIN
    EmployeeUNI as eu
on e.id = eu.id;
```
### 7.
**Link:** [1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/)
```SQL
SELECT
    p.product_name,
    s.year,
    s.price
FROM
    Sales as s
JOIN
    Product as p
ON
    s.product_id = p.product_id;
```
