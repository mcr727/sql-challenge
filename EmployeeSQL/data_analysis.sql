--List the following details of each employee: employee number, last name, first name, sex, and salary.
select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
from employees as emp
	left join salaries as sal 
	on (emp.emp_no = sal.emp_no);
	
--List first name, last name, and hire date for employees who were hired in 1986.
select * from employees; --to check remember how date is stored in table for where clause

select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-30';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.

select * from dept_manager;

select
	deptman.dept_no,
	dept.dept_name,
	deptman.emp_no,
	emp.last_name,
	emp.first_name
from dept_manager as deptman
	inner join departments as dept
		on deptman.dept_no = dept.dept_no
	inner join employees as emp
		on deptman.emp_no = emp.emp_no;
	
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select * from departments;

select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
from employees as emp
	inner join dept_emp as demp
		on emp.emp_no = demp.emp_no
	inner join departments as dept
		on demp.dept_no = dept.dept_no;

--List first name, last name, and sex for employees whose first 
--name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select * from departments;

select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
from employees as emp
	inner join dept_emp as demp
		on emp.emp_no = demp.emp_no
	inner join departments as dept
		on demp.dept_no = dept.dept_no
where dept.dept_name = 'Sales';
		
--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.

select
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
from employees as emp
	inner join dept_emp as demp
		on emp.emp_no = demp.emp_no
	inner join departments as dept
		on demp.dept_no = dept.dept_no
where dept.dept_name = 'Sales' or dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;