--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
from employees
join salaries 
on employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select employees.first_name,
	employees.last_name,
	employees.hire_date
from employees
where date_part ('year', hire_date) = 1986;

--3. List the manager of each department with the following information: 
-----department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
from dept_manager
join departments
on dept_manager.dept_no = departments.dept_no
join employees 
on dept_manager.emp_no = employees.emp_no
order by emp_no;

--4. List the department of each employee with the following information: 
-----employee number, last name, first name, and department name.
select dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from dept_emp
join departments
on dept_emp.dept_no = departments.dept_no
join employees 
on dept_emp.emp_no = employees.emp_no;

--5. List first name, last name, and sex for employees whose first name is 
-----"Hercules" and last names begin with "B."
select employees.first_name, 
	   employees.last_name, 
	   employees.sex 
from employees
where first_name='Hercules' 
and last_name like 'B%'
order by last_name;

--6. List all employees in the Sales department, 
-----including their employee number, last name, first name, and department name.
select dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
from dept_emp
join employees 
on dept_emp.emp_no = employees.emp_no
join departments 
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
-----including their employee number, last name, first name, and department name.
select dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
from dept_emp
join employees 
on dept_emp.emp_no = employees.emp_no
join departments 
on dept_emp.dept_no = departments.dept_no
where dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, 
-----i.e., how many employees share each last name.
select (last_name),
count(last_name) as frequency_count
from employees
group by last_name
order by count(last_name) desc;

--Epilogue - Evidence in hand, you march into your boss's office and present the visualization. 
--With a sly grin, your boss thanks you for your work. On your way out of the office, 
--you hear the words, "Search your ID number." You look down at your badge to see 
--that your employee ID number is 499942.
select * from employees where
employees.emp_no=499942;








