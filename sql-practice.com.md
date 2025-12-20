# [sql-practice.com]()
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
#### 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
```sql
update patients
set allergies = "NKA"
where allergies is null;
```
#### 6. Show first name and last name concatinated into one column to show their full name.
```sql
select concat(first_name, " ", last_name)
as full_name
from patients;
```
#### 7. Show first name, last name, and the **full** province name of each patient.  

Example: 'Ontario' instead of 'ON'
```sql
select concat(first_name, " ", last_name)
as full_name
from patients;
```