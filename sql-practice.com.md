# [sql-practice.com](https://www.sql-practice.com/)
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
select pt.first_name, pt.last_name, pn.province_name
from patients as pt
join province_names as pn on pt.province_id = pn.province_id;
```
#### 8. Show how many patients have a birth_date with 2010 as the birth year.
```sql
select count(*)
from patients
where year(birth_date) = 2010;
```
#### 9. Show the first_name, last_name, and height of the patient with the greatest height.
```sql
select first_name, last_name, height
from patients
where height = (select max(height) from patients);
```
#### 10. Show all columns for patients who have one of the following patient_ids:  
1,45,534,879,1000
```sql
select *
from patients
where patient_id in (1,45,534,879,1000);
```
#### 11. Show the total number of admissions
```sql
select count(*)
from admissions;
```
#### 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
```sql
select * 
from admissions
where admission_date = discharge_date;
```
#### 13. Show the patient id and the total number of admissions for patient_id 579.
```sql
select patient_id, count(*)
from admissions
where patient_id = 579;
```
#### 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.
```sql
select distinct(city) as unique_cities
from patients
where province_id = "NS";
```
#### 15. Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70
```sql
select first_name, last_name, birth_date
from patients
where height > 160 and weight > 70;
```
#### 16. Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'
```sql
select first_name, last_name, allergies
from patients
where allergies is not null and city = "Hamilton";
```
## Section-1: MEDIUM
#### 1. Show unique birth years from patients and order them by ascending.
```sql
select distinct(year(birth_date)) as birth_year
from patients
order by birth_date;
```
#### 2. Show unique first names from the patients table which only occurs once in the list.  
#### For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
```sql
select first_name
from patients
group by first_name
having count(first_name)=1;
```
#### 3. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
```sql
select patient_id, first_name
from patients
where first_name like "s%s" and length(first_name) >= 6;
```
#### 4. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.  Primary diagnosis is stored in the admissions table.
```sql
select
	pt.patient_id,
    pt.first_name,
    pt.last_name
from patients as pt
join admissions as a on pt.patient_id = a.patient_id
where a.diagnosis = "Dementia";
```
#### 5. Display every patient's first_name.  
Order the list by the length of each name and then by alphabetically.
```sql
select first_name
from patients
order by length(first_name), first_name;
```
#### 6. Show the total amount of male patients and the total amount of female patients in the patients table.  
Display the two results in the same row.
```sql
select 
	sum(case when gender="M" then 1 else 0 end) as male_count,
    sum(case when gender="F" then 1 else 0 end) as female_count
from patients;
```
#### 7. Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
```sql
select
	first_name,
    last_name,
    allergies
from patients
where
	allergies = 'Penicillin' or
	allergies = 'Morphine'
order by
	allergies,
    first_name,
    last_name;
```
#### 8. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
```sql
select
	patient_id,
    diagnosis
from admissions
group by
	patient_id,
    diagnosis
having count(patient_id) > 1;
```
#### 9. Show the city and the total number of patients in the city.  
Order from most to least patients and then by city name ascending.
```sql
select
	city,
    count(*) as num_patients
from patients
group by city
order by 
	num_patients desc,
    city;
```
#### 10. Show first name, last name and role of every person that is either patient or doctor.  
The roles are either "Patient" or "Doctor"
```sql
select
  first_name,
  last_name,
  "Patient" as role
from patients

union all

select
	first_name,
    last_name,
    "Doctor" as role
  from doctors;
```
#### 11. Show all allergies ordered by popularity. Remove NULL values from query.
```sql
select
	allergies,
    count(*) as total_diagnosis
from patients
where allergies is not null
group by allergies
order by total_diagnosis desc;
```
#### 12. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
```sql
select
	first_name,
    last_name,
    birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date;
```
#### 13. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
```sql
select
	first_name,
    last_name,
    birth_date
from patients
where year(birth_date) between 1970 and 1979
order by birth_date;
```
#### 14. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order  
EX: SMITH,jane
```sql
select 
  concat(upper(last_name), ",", lower(first_name)) as new_name_format
from patients
order by first_name desc;
```
#### 15. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
```sql
select 
  province_id,
  sum(height) as sum_height
from patients
group by province_id
having sum_height >= 7000;
```
#### 16. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
```sql
select
	max(weight) - min(weight)
from patients
where last_name like "Maroni";
```
#### 17. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
```sql
select
	day(admission_date) as day_number,
    count(*) as number_of_admissions
from admissions
group by day_number
order by number_of_admissions desc;
```
#### 18. Show all columns for patient_id 542's most recent admission_date.
**Solution-1**
```sql
select *
from admissions
where patient_id = 542
order by admission_date desc
limit 1;
```
**Solution-2**
```sql
select *
from admissions
where patient_id = 542
group by patient_id
having admission_date = max(admission_date);
```
#### 19. Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:  
1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.  
2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.
```sql
select
	patient_id,
    attending_doctor_id,
    diagnosis
from admissions
where
	(
      mod(patient_id, 2) = 1 
      and
      attending_doctor_id in (1, 5, 19)
    )
    or
    (
      cast(attending_doctor_id as char) like "%2%"
      and
      length(cast(patient_id as char)) = 3
    );
```
#### 20. Show first_name, last_name, and the total number of admissions attended for each doctor.  
Every admission has been attended by a doctor.
```sql
select
	d.first_name,
    d.last_name,
    count(a.attending_doctor_id)
from admissions as a
join doctors as d on a.attending_doctor_id = d.doctor_id
group by a.attending_doctor_id;
```
#### 21. For each doctor, display their id, full name, and the first and last admission date they attended.
```sql
select
	d.first_name,
    d.last_name,
    count(a.attending_doctor_id)
from admissions as a
join doctors as d on a.attending_doctor_id = d.doctor_id
group by a.attending_doctor_id;
```
#### 22. Display the total amount of patients for each province. Order by descending.
```sql
select
	pn.province_name,
	count(p.patient_id) as patient_count
from patients as p
join province_names as pn on p.province_id = pn.province_id
group by pn.province_id 
order by patient_count desc;
```
#### 23. For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
```sql
select
	concat(p.first_name, " ", p.last_name) as patient_name,
    a.diagnosis,
    concat(d.first_name, " ", d.last_name) as doctor_name
from patients as p
join admissions as a on p.patient_id = a.patient_id
join doctors as d on a.attending_doctor_id = d.doctor_id;
```
#### 24. display the first name, last name and number of duplicate patients based on their first name and last name.  
Ex: A patient with an identical name can be considered a duplicate.
```sql
select
    first_name,
    last_name,
    count(*) as num_of_duplicates
from patients
group by first_name, last_name
having num_of_duplicates > 1;
```
#### 25. Display patient's full name,  
height in the units feet rounded to 1 decimal,  
weight in the unit pounds rounded to 0 decimals,  
birth_date,  
gender non abbreviated.  
  
Convert CM to feet by dividing by 30.48.  
Convert KG to pounds by multiplying by 2.205.
```sql
select
    first_name,
    last_name,
    count(*) as num_of_duplicates
from patients
group by first_name, last_name
having num_of_duplicates > 1;
```
