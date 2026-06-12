-- Q1 Total Employees
SELECT COUNT(employeenumber) AS total_employees
FROM hr_employee;

-- Q2 Company Attrition Percentage
SELECT COUNT(*) AS total_employees,
       COUNT(CASE WHEN attrition='Yes' THEN 1 END) AS attrition_count,
       ROUND(
           COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
           COUNT(*),
           2
       ) AS attrition_percentage
FROM hr_employee;

-- Q3 Department Distribution
SELECT department,
       COUNT(*) AS employee_count
FROM hr_employee
GROUP BY department
ORDER BY employee_count DESC;

-- Q4 Average Salary by Department
SELECT department,
       ROUND(AVG(monthlyincome),2) AS average_salary
FROM hr_employee
GROUP BY department
ORDER BY average_salary DESC;

-- Q5 Department-wise Attrition Percentage
SELECT department,
       COUNT(*) AS total_employee_count,
       COUNT(CASE WHEN attrition='Yes' THEN 1 END) AS attrition_count,
       ROUND(
           COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
           COUNT(*),
           2
       ) AS attrition_percentage
FROM hr_employee
GROUP BY department
ORDER BY attrition_percentage DESC;

-- Q6 Gender-wise Attrition Percentage
SELECT gender,
       COUNT(*) AS total_employees,
       COUNT(CASE WHEN attrition='Yes' THEN 1 END) AS attrition_count,
       ROUND(
           COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
           COUNT(*),
           2
       ) AS attrition_percentage
FROM hr_employee
GROUP BY gender
ORDER BY attrition_percentage DESC;

-- Q7 Age Group Attrition Analysis
SELECT
CASE
    WHEN age BETWEEN 18 AND 25 THEN 'Young Employees'
    WHEN age BETWEEN 26 AND 35 THEN 'Early Career'
    WHEN age BETWEEN 36 AND 45 THEN 'Mid Career'
    ELSE 'Senior Employees'
END AS age_group,
COUNT(*) AS total_employees,
COUNT(CASE WHEN attrition='Yes' THEN 1 END) AS attrition_count,
ROUND(
COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
COUNT(*),
2
) AS attrition_percentage
FROM hr_employee
GROUP BY age_group
ORDER BY attrition_percentage DESC;

-- Q8 Top 5 Job Roles by Attrition Percentage
SELECT jobrole,
       COUNT(*) AS total_employees,
       COUNT(CASE WHEN attrition='Yes' THEN 1 END) AS attrition_count,
       ROUND(
           COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
           COUNT(*),
           2
       ) AS attrition_percentage
FROM hr_employee
GROUP BY jobrole
ORDER BY attrition_percentage DESC
LIMIT 5;

-- Q9 Job Role Risk Classification
SELECT jobrole,
       COUNT(*) AS total_employees,
       COUNT(CASE WHEN attrition='Yes' THEN 1 END) AS attrition_count,
       ROUND(
           COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
           COUNT(*),
           2
       ) AS attrition_percentage,
       CASE
           WHEN ROUND(
               COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
               COUNT(*),
               2
           ) >= 20 THEN 'High Risk'
           WHEN ROUND(
               COUNT(CASE WHEN attrition='Yes' THEN 1 END) * 100.0 /
               COUNT(*),
               2
           ) BETWEEN 10 AND 19.99 THEN 'Medium Risk'
           ELSE 'Low Risk'
       END AS risk_level
FROM hr_employee
GROUP BY jobrole
ORDER BY attrition_percentage DESC;

-- Q10 Top 10 Highest Paying Job Roles
SELECT jobrole,
       ROUND(AVG(monthlyincome),2) AS average_salary
FROM hr_employee
GROUP BY jobrole
ORDER BY average_salary DESC
LIMIT 10;