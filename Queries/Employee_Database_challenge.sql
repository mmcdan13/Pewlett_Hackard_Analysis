-- CREATE RETIREMENT TITLES table 
SELECT employees.emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM employees
left join titles 
on employees.emp_no = titles.emp_no
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
--CREATE UNIQUE TITLES table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Number of Employees per Most Recent Job Title
-- CREATE RETIRING TITLES table

SELECT count(title), title
INTO retiring_titles
FROM unique_titles
group by title
order by count(title) desc;