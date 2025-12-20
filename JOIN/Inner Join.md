#### Question-1:  Fetch the employees name and the department name they belong to. 
# `department` Table
![Department Table](./images/department_tabel.png)
# `employee` Table
![Employee Table](./images/employee_tabel.png)
# `manager` table
![Manager Table](./images/manager_tabel.png)
# `project` table
![Project Table](./images/project_tabel.png)

```sql
-- Inner Join / JOIN
select e.emp_name, d.dept_name
from employee as e 
join department as d on e.dept_id = d.dept_id;
```
![[Pasted image 20251220103918.png]]
![Inner Join](./images/inner_join_result-1.png)