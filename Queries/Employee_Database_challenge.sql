-- Create Retiring_titles table

SELECT employees.emp_no, first_name, last_name, title, from_date, to_date
INTO retiring_titles
FROM employees
left join titles 
on employees.emp_no = titles.emp_no
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no;