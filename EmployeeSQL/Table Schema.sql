create table titles(
    title_id Varchar PRIMARY KEY,
    title Varchar);
    
create table departments(
    dept_no Varchar PRIMARY KEY,
    dept_name Varchar);
    
create table salaries(
    emp_no Integer PRIMARY KEY,
    salary Integer);

create table dept_emp(
    emp_no Integer,
    dept_no Varchar,
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
    
create table employees(
    emp_no Integer,
    emp_title_id Varchar,
    birth_date Varchar,
    first_name Varchar,
    last_name Varchar,
    sex Varchar,
    hire_date Varchar,
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

create table dept_manager(
    dept_no Varchar,
    emp_no Integer,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES salaries(emp_no));

