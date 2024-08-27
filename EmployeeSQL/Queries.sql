--Data Analysis Queries
========================

-- 1. Employee Number, last, first, Sex, Salary

select employees.emp_no
    , employees.last_name
    , employees.first_name
    , employees.sex
    , salaries.salary
from employees
inner join salaries on
    employees.emp_no = salaries.emp_no;

-- 2.List of employees with first name, last name, and hire date for the employees
-- who were hired in 1986.

select first_name
    , last_name
    , hire_date
from employees
where date_part('year', hire_date) = 1986;

-- 3. Department manager, dep. number, dep. name, employee number, last name, and first name.

select dept_managers.dept_no,
	   departments.dept_name,
	   dept_managers.emp_no,
       employees.first_name,
       employees.last_name
from dept_managers
inner join departments on
    dept_managers.dept_no = departments.dept_no
inner join employees on
    dept_managers.emp_no = employees.emp_no;

-- 4. Department Number for each employee, employee number, last, first, department name

select dept_emp.dept_no
    , dept_emp.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
from dept_emp
inner join employees on
    dept_emp.emp_no = employees.emp_no
inner join departments on
    dept_emp.dept_no = departments.dept_no;

-- 5. First, last, sex for each employee where first='Hercules' & last starts with 'B'

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- 6. Employees in 'Sales' employee number, last, first

select employees.emp_no
    , employees.last_name
    , employees.first_name
from employees
inner join dept_emp on
    employees.emp_no = dept_emp.emp_no
inner join departments on
    departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales';

-- 7. Employees in 'Sales' & 'Development' Dep., employee number, last, first, department name

select employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
from employees
inner join dept_emp on
    employees.emp_no = dept_emp.emp_no
inner join departments on
    departments.dept_no = dept_emp.dept_no
where departments.dept_name in ('Sales', 'Development');

-- 8. Frequency counts in descending order of all employee last names

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) DESC;
