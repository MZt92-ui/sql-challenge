
-- q1: List the following details of each employee: employee number, last name, first name, sex, and salary.
select sa.emp_no,em.first_name,em.last_name,sa.salary
from salaries as sa
inner join employees as em
on sa.emp_no = em.emp_no;

-- q2: List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%/1986';

-- q3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select manager_no, employees.first_name, employees.last_name, dept_no, dept_name
from employees right join (
    
    select emp_no as manager_no, departments.dept_no, dept_name
    from dept_manager left join departments 
    on dept_manager.dept_no = departments.dept_no) as manager

on employees.emp_no = manager.manager_no;


--q4:List the department of each employee with the following information: employee number, last name, first name, and department name.
select employee_de.emp_no, employees.first_name, employees.last_name, dept_name
from employees right join (
    
    select emp_no, dept_name
    from dept_emp left join departments 
    on dept_emp.dept_no = departments.dept_no) as employee_de

on employees.emp_no = employee_de.emp_no;

-- q5:List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where (first_name = 'Hercules' and last_name like 'B%');

--q6:List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp_no,employees.first_name, employees.last_name
from employees
where emp_no in (
    
    select emp_no from dept_emp
    where dept_no in (
        
        select dept_no from departments
        where dept_name = 'Sales')); 

-- q7:List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employee_dep.emp_no, employees.first_name, employees.last_name, dept_name
from employees right join (
    
    select emp_no, dept_emp.dept_no, dept_name
    from dept_emp left join departments
    on dept_emp.dept_no = departments.dept_no) as employee_dep

on employees.emp_no = employee_dep.emp_no
where dept_name in ('Sales','Development');

-- q8:In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;
     
