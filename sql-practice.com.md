# sql-practice.com
## `patients` database
## Section-1: EASY
#### 1. Show first name, last name, and gender of patients whose gender is 'M'
```sql
select first_name, last_name, gender
from patients
where gender='M';
```
#### 2. Show first name and last name of patients who does not have allergies. (null)
```sql
select first_name, last_name
from patients
where allergies is null;
```
#### 3. Show first name of patients that start with the letter 'C'
```sql
select first_name
from patients
where first_name like 'C%'
```

#### 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
```sql
select first_name, last_name
from patients
where weight between 100 and 120;
```
#### 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
```sql
select first_name, last_name
from patients
where weight between 100 and 120;
```
