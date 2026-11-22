-- PART A -run this first
CREATE DATABASE IF NOT EXISTS Messy_employee_dataset;
USE Messy_employee_dataset;

DROP TABLE IF EXISTS Messy_employee_dataset ;
CREATE TABLE employees_raw (
    Employee_ID        VARCHAR(20),
    First_Name         VARCHAR(50),
    Last_Name          VARCHAR(50),
    Age                VARCHAR(10),
    Department_Region  VARCHAR(100),
    Status             VARCHAR(20),
    Join_Date          VARCHAR(20),
    Salary             VARCHAR(20),
    Email              VARCHAR(100),
    Phone              VARCHAR(30),
    Performance_Score  VARCHAR(20),
    Remote_Work        VARCHAR(10)
);

-- use the Table Data Import Wizard on Messy_employee_dataset

-- PART B -run this only AFTER the import is finished

CREATE TABLE Messy_employee_dataset_copy -- creating a copy of the dataset
LIKE Messy_employee_dataset;

INSERT INTO Messy_employee_dataset_copy -- inserting data to the copy from the original
SELECT * FROM Messy_employee_dataset;

SELECT * FROM Messy_employee_dataset_copy;

SET SQL_SAFE_UPDATES = 0;