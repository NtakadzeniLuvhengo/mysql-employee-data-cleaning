USE Messy_employee_dataset;

-- Validating the final table
SELECT 
(SELECT COUNT(*) FROM Messy_employee_dataset_copy) AS raw_rows,
(SELECT COUNT(*) FROM employees)  AS clean_rows;

SELECT MIN(R.salary) AS R_min_sal,
		MIN(C.salary) AS C_min_sal,
	   MAX(R.salary) AS R_max_sal,
       MAX(C.salary) AS C_Max_sal,
       MIN(R.join_date) AS R_min_date,
       MIN(C.join_date)AS C_min_date,
	   MAX(R.join_date)AS R_max_date,
       MAX(C.join_date) AS R_max_date
FROM Messy_employee_dataset_copy AS R 
JOIN employees AS C
ON R.Employee_id = C.employee_ID ;

DESCRIBE employees;
