USE Messy_employee_dataset;

-- Triming Texts
UPDATE Messy_employee_dataset_copy
SET 
Employee_ID = TRIM(Employee_ID),
First_Name = TRIM(First_name),
Last_Name = TRIM(Last_Name),
Status = TRIM(Status),
Email = TRIM(Email),
Performance_score = TRIM(Performance_score),
Remote_work = TRIM(Remote_work);


-- handling blanks 
UPDATE Messy_employee_dataset_copy 
SET Age = NULL WHERE TRIM(age)= '' ;
UPDATE Messy_employee_dataset_copy 
SET Salary = NULL WHERE Salary = 'N/A';
	
-- Split department_region
ALTER TABLE Messy_employee_dataset_copy 
ADD Department VARCHAR(50) ,
ADD	Region VARCHAR(50) ;

WITH departmentvsregion AS 
(SELECT Department_Region , SUBSTRING_INDEX(Department_Region,'-',1) AS Department,
SUBSTRING_INDEX(Department_Region,'-',-1) AS Region -- separating department and region to bring the column to 1NF
FROM Messy_employee_dataset_copy)
UPDATE Messy_employee_dataset_copy M -- updating the table with a separate data 
JOIN departmentvsregion D
ON M.department_region = D.department_region
SET M.department= D.department,
	M.region=D.region ;

-- formating the join date column
UPDATE Messy_employee_dataset_copy
SET join_date = STR_TO_DATE(join_date,'%m/%d/%Y'); 

-- Converting date format from text to date 
ALTER TABLE Messy_employee_dataset_copy 
MODIFY COLUMN join_date DATE; 
