# [SQL 50](https://leetcode.com/studyplan/top-sql-50/)

| #   | QUESTION                                                                                                                                              | SOLUTION        | TAG          | LEVEL        |
| --- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | ------------ | ------------ |
| 1   | [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)                                               | [Solution](#1)  |              | EASY         |
| 2   | [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/)                                                                    | [Solution](#2)  |              | EASY         |
| 3   | [595. Big Countries](https://leetcode.com/problems/big-countries/)                                                                                    | [Solution](#3)  |              | EASY         |
| 4   | [1148. Article Views I](https://leetcode.com/problems/article-views-i/)                                                                               | [Solution](#4)  |              | EASY         |
| 5   | [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)                                                                                 | [Solution](#5)  |              | EASY         |
| 6   | [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)                 | [Solution](#6)  |              | EASY         |
| 7   | [1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/)                                                             | [Solution](#7)  |              | EASY         |
| 8   | [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/) | [Solution](#8)  |              | EASY         |
| 9   | [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/)                                                                          | [Solution](#9)  | `SELF JOIN`  | INTERMEDIATE |
| 10  | [1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/)                                       | [Solution](#10) |              | INTERMEDIATE |
| 11  | [577. Employee Bonus](https://leetcode.com/problems/employee-bonus/)                                                                                  | [Solution](#11) |              | EASY         |
| 12  | [1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/)                                                           | [Solution](#12) | `CROSS JOIN` | INTERMEDIATE |
| 13  |                                                                                                                                                       | [Solution](#10) |              |              |
| 14  |                                                                                                                                                       | [Solution](#10) |              |              |
| 15  |                                                                                                                                                       | [Solution](#10) |              |              |

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
### 8.
**Link:** [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/)
```SQL
WITH visitDetails AS (
    SELECT
        v.visit_id,
        v.customer_id,
        t.transaction_id
    FROM
        Visits as v
    LEFT JOIN
        Transactions as t
    ON v.visit_id = t.visit_id
)

SELECT
    customer_id,
    COUNT(customer_id) as count_no_trans 
FROM
    visitDetails as v
WHERE
    transaction_id IS NULL
GROUP BY
    customer_id;
```
### 9.
**Link:** [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/)
```sql
WITH temp_compare AS (
    SELECT
        w1.id,
        w1.temperature AS today_temp,
        w2.temperature AS yesterday_temp
    FROM
        Weather AS w1
    JOIN Weather AS w2
    ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
)

SELECT
    id
FROM
    temp_compare
WHERE
    today_temp > yesterday_temp;
```
### 10.
**Link:** [1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/)
```sql
WITH startAndEnd AS(
    SELECT
        s.machine_id as machine_id,
        s.timestamp as start_time,
        e.timestamp as end_time
    FROM Activity AS s
    JOIN Activity AS e
    ON
        s.machine_id = e.machine_id
    AND
        s.process_id = e.process_id
    AND
        s.activity_type = 'start'
    AND
        e.activity_type = 'end'
)

SELECT
    machine_id,
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM
    startAndEnd
GROUP BY
    machine_id;
```
### 11.
**Link:** [577. Employee Bonus](https://leetcode.com/problems/employee-bonus/)
```sql
WITH bonusDetails AS (
    SELECT
        e.empId,
        e.name,
        b.bonus
    FROM 
        Employee AS e
    LEFT JOIN 
        Bonus AS b
    ON e.empId = b.empId
)

SELECT
    name,
    bonus
FROM
    bonusDetails
WHERE
    bonus < 1000
OR bonus IS NULL;
```
### 12.
**Link:** [1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/)
```sql
WITH studDetailsWithExam AS (
    SELECT
        s.student_id,
        s.student_name,
        sub.subject_name
    FROM
        Students AS s
    CROSS JOIN
        Subjects AS sub
)

SELECT
    studD.student_id,
    studD.student_name,
    studD.subject_name,
    count(ex.subject_name) AS attended_exams
FROM
    studDetailsWithExam AS studD
LEFT JOIN
    Examinations AS ex
ON studD.student_id = ex.student_id
AND 
	studD.subject_name = ex.subject_name
GROUP BY
    student_id,
    subject_name
ORDER BY
    student_id,
    subject_name;
```
### 13.
**Link:** [570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)
```sql
SELECT
    manager.name
FROM
    Employee AS employee
JOIN
    Employee AS manager
ON employee.managerId = manager.id
GROUP BY
    manager.id
HAVING 
    COUNT(employee.id) >= 5;
```