-- part1:
create table trns_tbles
(
	emp_id		int,
	emp_name	varchar(50),
	trns_type	varchar(20),
	amount		numeric
);
insert into trns_tbles
SELECT 
      s.emp_id, 
      s.emp_name, 
      i.income as trns_type, 
      ROUND(((s.base_salary)*(i.percentage)/100),0) as amount
FROM SALARY as s
cross join income as i
union
SELECT 
      s.emp_id, 
      s.emp_name, 
      d.deduction as trns_type, 
      ROUND(((s.base_salary)*(d.percentage)/100),0) as amount
FROM SALARY as s
cross join deduction as d;

select * from trns_tbles;

with base_table as 
(select 
      emp_id,
      emp_name,
      SUM(Case when trns_type = "Basic" then amount else 0 end) Over(partition by emp_id) as Basic,
      SUM(Case when trns_type = "Allowance" then amount else 0 end) Over(partition by emp_id) as Allowance,
      SUM(Case when trns_type = "Others" then amount else 0 end) Over(partition by emp_id) as Others,
      SUM(Case when trns_type = "Insurance" then amount else 0 end) Over(partition by emp_id) as Insurance,
      SUM(Case when trns_type = "Health" then amount else 0 end) Over(partition by emp_id) as Health,
      SUM(Case when trns_type = "House" then amount else 0 end) Over(partition by emp_id) as House
from trns_tbles),
cte_2 as
(Select 
      *
from base_table
group by emp_id, emp_name, Basic, Allowance, Others, Insurance, Health, House)
select 
       emp_name, 
       Basic, 
       Allowance, 
       Others, 
       (Basic+ Allowance + Others) as Gross, 
       Insurance, 
       Health, 
       House,
       (Insurance+ Health + House) as Total_Deductions, 
       (Basic+ Allowance + Others - Insurance- Health - House) as Net_Pay
from cte_2
order by emp_name;