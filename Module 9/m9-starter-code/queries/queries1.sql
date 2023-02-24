-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
inner join salaries
ON employees.emp_no=salaries.emp_no


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
Where hire_date>='1986-01-01'
	AND hire_date<'1987-01-01'
ORDER BY hire_date ASC

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, last_name, first_name
From employees
inner join dept_manager
on employees.emp_no = dept_manager.emp_no 
left join departments
on dept_manager.dept_no = departments.dept_no


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT  dept_employee.dept_no, employees.emp_no, last_name, first_name, departments.dept_name
From employees
inner join dept_employee
on employees.emp_no = dept_employee.emp_no
left join departments
on dept_employee.dept_no = departments.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT  dept_employee.dept_no, employees.emp_no, last_name, first_name, departments.dept_name
From employees
inner join dept_employee
on employees.emp_no = dept_employee.emp_no
left join departments
on dept_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  dept_employee.dept_no, employees.emp_no, last_name, first_name, departments.dept_name
From employees
inner join dept_employee
on employees.emp_no = dept_employee.emp_no
left join departments
on dept_employee.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) AS num_of_emp
FROM employees
GROUP BY last_name
ORDER BY num_of_emp DESC
