-- Deliverable 1

-- Retirement Titles Query
SELECT e.emp_no,
e.first_name,
e.last_name,
tt.title,
tt.from_date,
tt.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Unique Titles Query
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Retiring Titles Query
-- Retrive the number of employees by their most recent job title who are about to retire.
SELECT COUNT (title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

-- Deliverable 2
-- Mentorship Eligibility Query
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tt.title
INTO mentor_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as tt
ON (e.emp_no = tt.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '01-01-1965' AND '12-31-1965')
ORDER BY e.emp_no;

