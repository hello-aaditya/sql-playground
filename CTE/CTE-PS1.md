Platform: [sql-practice.com](https://www.sql-practice.com/)
Table: northwind.db
# 1. Select All Product Names & their Category Names
```sql
with productCategories as (
    select
      p.product_name,
      c.category_name
    from products as p
    join categories as c on p.category_id = c.category_id
)

select *
from productCategories;
```
