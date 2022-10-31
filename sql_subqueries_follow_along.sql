USE noether_2036;

DROP TABLE IF EXISTS my_numbers;

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL, 
	name VARCHAR(10) NOT NULL
);

SELECT * 
FROM my_numbers;

#Insert data in my_numbers

INSERT INTO	 my_numbers(n, name)
VALUES (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e');

SELECT * 
FROM my_numbers;

#Delete from my_numbers

DELETE FROM my_numbers WHERE n > 4;

UPDATE my_numbers SET n = n+10
WHERE name = 'a'

SELECT *
FROM my_numbers;

USE employees;

SELECT emp_no, dept_no, first_name, last_name, salary, title
FROM employees AS e 
JOIN dept_emp AS de USING (emp_no)
JOIN salaries AS s USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN titles AS t USING(emp_no)
WHERE de.to_date > NOW()
	AND s.to_date > NOW()
	AND t.to_date > NOW()
	AND dept_name = 'Customer Service'

#Copy and paste the above query into the () below to use that output as a temporary table

CREATE TEMPORARY TABLE noether_2036.salary_info(
SELECT emp_no, dept_no, first_name, last_name, salary, title
FROM employees AS e 
JOIN dept_emp AS de USING (emp_no)
JOIN salaries AS s USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN titles AS t USING(emp_no)
WHERE de.to_date > NOW()
	AND s.to_date > NOW()
	AND t.to_date > NOW()
	AND dept_name = 'Customer Service');
	
#If you need to reference the output of a previous query you can create a temporary table so that you don't have a nested subquery monstrosity

SELECT *
FROM noether_2036.salary_info;

#What is the average salary for current employees in Customer service

SELECT AVG(salary)
FROM noether_2036.salary_info;


# Add new columns to my temprorary table

ALTER TABLE noether_2036.salary_info ADD avg_salary float;
ALTER TABLE noether_2036.salary_info ADD std_salary float;
ALTER TABLE noether_2036.salary_info ADD greater_than_avg INT;

#Update the new columns with new info

UPDATE noether_2036.salary_info SET avg_salary = 67000;

SELECT *
FROM noether_2036.salary_info;

UPDATE noether_2036.salary_info SET std_salary = 16000;

UPDATE noether_2036.salary_info SET greater_than_avg = salary > avg_salary;
#this last line created a column with boolean value answering if that emp's salary is greater than average or not











