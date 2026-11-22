USE Messy_employee_dataset;

-- Duplicate IDs 
SELECT Employee_ID ,COUNT(*)
FROM Messy_employee_dataset_copy 
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

-- Blanks
SELECT SUM(TRIM(age) = '') AS Blank_age,
		SUM(salary = 'N/A') AS na_salary,
        SUM(TRIM(join_date) = '') AS Blank_date,
        SUM(TRIM(Email) = '') AS Blank_email
FROM Messy_employee_dataset_copy;

-- Duplicate emails (This is a finding)
SELECT COUNT(Email) AS Total_rows, COUNT(DISTINCT Email) AS Unique_emails
FROM Messy_employee_dataset_copy;

-- validating phone column
SELECT COUNT(*) AS Total,
	SUM(phone LIKE '-%') AS Negative_number,
    MIN(LENGTH(Phone)) AS Min_len,
    MAX(LENGTH(phone)) AS Max_Len
FROM Messy_employee_dataset_copy;
