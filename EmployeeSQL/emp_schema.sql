--Deleting Tables if exist
drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;
drop table titles;


-- Create table departments

create table departments(
   dept_no varchar(4) primary key,
    dept_name text not null
);

select * from departments;

-- Create table employees

create table employees (
    emp_no int primary key,
	emp_title_id varchar(5) not null,
    birth_date date not null,
    first_name text not null,
    last_name text not null,
    sex varchar(1) not null,
    hire_date date not null,
    foreign key (emp_title_id) references titles(title_id)
);

select * from employees;

-- Create table dept_emp

create table dept_emp(
	emp_no int not null,
	dept_no varchar(4) not null,
    primary key (emp_no, dept_no),
    foreign key (emp_no) references employees(emp_no),
    foreign key (dept_no) references departments(dept_no)
);

select * from dept_emp;

-- Create table dept_managers

create table dept_managers (
	dept_no varchar(4) not null,
	emp_no int not null,
    primary key (dept_no, emp_no),
    foreign key (dept_no) references departments(dept_no),
    foreign key (emp_no) references employees(emp_no)
);

select * from dept_managers;

-- Create table salaries

create table salaries (
	emp_no int not null,
    salary int not null,
    primary key (emp_no, salary),
    foreign key (emp_no) references employees(emp_no)
);
select * from salaries;

-- Create table titles

create table titles (
    title_id varchar(5) primary key,
    title text not null
);

select * from titles;
