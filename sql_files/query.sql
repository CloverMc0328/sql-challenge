-- List the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries Using (emp_no);


-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT 
		dm.emp_no AS "employee_number",  
		e.first_name, 
		e.last_name,
		dm.dept_no AS "department_number", 
		d.dept_name AS "department_name" 
FROM dept_manager dm
INNER JOIN departments d USING (dept_no)
INNER JOIN employees e USING(emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT
		de.dept_no AS "department_number",
		d.dept_name AS "department_name",
		e.emp_no AS "employee_number",  
		e.first_name, 
		e.last_name
FROM dept_emp de
INNER JOIN departments d USING(dept_no)
INNER JOIN employees e USING(emp_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name 
SELECT de.emp_no, employees.first_name, employees.last_name
FROM dept_emp de
LEFT JOIN employees USING(emp_no)
WHERE de.dept_no IN
	(
	SELECT d.dept_no
	FROM departments d
	WHERE dept_name = 'Sales'
	)
	
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
Select 
	de.emp_no, 
	employees.first_name, 
	employees.last_name,
	de.dept_no,
	d.dept_name
FROM dept_emp de
LEFT JOIN departments d USING (dept_no)
LEFT JOIN employees USING (emp_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names
SELECT employees.last_name, COUNT(employees.last_name) AS "last_name_frequency"
FROM employees
GROUP BY employees.last_name
ORDER BY last_name_frequency DESC;

