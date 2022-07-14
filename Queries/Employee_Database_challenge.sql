-- Create Retiring_titles table

SELECT employees.emp_no, first_name, last_name, title, from_date, to_date
INTO retiring_titles
FROM employees
left join titles 
on employees.emp_no = titles.emp_no
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retiring_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;