SELECT * FROM departments; 
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM employee; 
SELECT * FROM salaries; 
SELECT * FROM titles; 

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
INNER JOIN salaries
ON employee.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employee.first_name, employee.last_name, EXTRACT (YEAR FROM hire_date) AS YEAR
FROM employee
WHERE hire_date > '12/31/1985' and hire_date < '1/1/1987'; 

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM dept_manager
JOIN employee
ON dept_manager.emp_no = employee.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no; 

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name 
FROM employee
JOIN dept_emp
ON employee.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no; 

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
JOIN dept_emp
ON employee.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'; 

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employee.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM employee
JOIN dept_emp
ON employee.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS last_name_count
FROM employee
GROUP BY last_name
ORDER BY last_name_count DESC;