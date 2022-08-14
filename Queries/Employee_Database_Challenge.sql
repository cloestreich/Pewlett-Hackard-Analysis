-- Use Distinct On with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

-- Retirement Titles
SELECT employees.emp_no,
		employees.first_name,
		employees.last_name,
		titles.title,
		titles.from_date,
		titles.to_date,
		employees.birth_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
-- Unique Titles
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title

INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;
-- Retiring Titles
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY Count DESC;

--Deliverable 2
SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name,
	employees.birth_date,
	dept_emp.from_date, 
	dept_emp.to_date
INTO employees_complete
FROM employees
INNER JOIN dept_emp
   on (employees.emp_no = dept_emp.emp_no)

SELECT DISTINCT ON (emp_no) employees_complete.emp_no, 
	first_name, 
	last_name,
	birth_date,
	employees_complete.from_date, 
	employees_complete.to_date,
	title
	
INTO mentorship_eligibility
FROM employees_complete
INNER JOIN titles
ON (employees_complete.emp_no = titles.emp_no)
WHERE (employees_complete.birth_date) BETWEEN ('1965-01-01') AND ('1965-12-31')
ORDER BY emp_no