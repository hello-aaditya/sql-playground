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
