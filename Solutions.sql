##Calculate the total salary expenditure for each department and display the departments in descending order of the total salary expenditure.

## by using Joins
select d.department_name, sum(e.salary)
from employees as e
join departments as d on e.department_id = d.department_id
group by 1
order by 2 desc;

## By using CTE

with dep_sal as
(select department_id,sum(salary) as total_salary
from employees 
group by 1
order by 2 desc)
select d. department_name, ds.total_salary
from dep_sal as ds
join departments as d on ds.department_id = d.department_id
order by 2 desc;

##Retrieve the employees who have at least two subordinates.

with sub as
(select manager_id,count(employee_id) as total_sub from employees
group by 1
order by 2 desc)
select e.employee_name,total_sub from sub as s
join employees as e on s.manager_id=e.employee_id
where total_sub >1;

 ## Calculate the average salary for each department, considering only employees with a salary greater than the department average.

## By using sub query
select d.department_name, avg(salary) as dep_avg_sal
from employees as e 
join departments as d on e. department_id = d. department_id
group by 1
having dep_avg_sal > (select avg(salary) as total_sal_avg
from employees);

##Find the employees who have the highest salary in their respective departments
with max as
(select department_id, max(salary) as ms from employees
group by 1)
select e.employee_name,m.department_id,d.department_name,m.ms
from employees as e
join max as m on e.department_id = m.department_id
join departments as d on m.department_id = d.department_id;

##Calculate the running total of salaries for each department, ordered by department ID and employee name.

with running_total as 
(select department_id,salary,employee_name,
sum(salary) over (partition by department_id order by employee_name) as total_salary
from employees)
select department_id,employee_name,total_salary from running_total
order by 1,2;