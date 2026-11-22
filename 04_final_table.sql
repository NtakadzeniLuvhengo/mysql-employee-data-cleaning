USE Messy_employee_dataset;

CREATE TABLE Employees (
Employee_ID VARCHAR(10) PRIMARY KEY ,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Age TINYINT UNSIGNED NULL,
Department VARCHAR(50) NOT NULL ,
Region VARCHAR(50) NOT NULL,
Status VARCHAR(10) NOT NULL,
Join_Date DATE NOT NULL ,
Salary DECIMAL(10,2) NULL,
Email VARCHAR(100) NOT NULL,
Perfomance_Score VARCHAR(10) NOT NULL,
Remote_work VARCHAR(10) NOT NULL);

INSERT INTO Employees
SELECT Employee_ID,
	   First_Name,
       Last_Name,
       CAST(Age AS UNSIGNED),
       Department,
       Region,
       Status,
       join_date,
       CAST(Salary AS DECIMAL(10,2)),
       Email,
       Performance_Score,
       Remote_Work
FROM Messy_employee_dataset_copy;

SELECT * FROM Employees;