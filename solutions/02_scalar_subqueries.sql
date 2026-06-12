-- Q11 Employees Earning Above Company Average Salary

SELECT employeenumber,
       monthlyincome
FROM hr_employee
WHERE monthlyincome >
(
    SELECT AVG(monthlyincome)
    FROM hr_employee
);

-- Q12 Employees Earning Below Company Average Salary

SELECT employeenumber,
       monthlyincome
FROM hr_employee
WHERE monthlyincome <
(
    SELECT AVG(monthlyincome)
    FROM hr_employee
);

-- Q13 Highest Paid Employee(s)

SELECT employeenumber,
       monthlyincome
FROM hr_employee
WHERE monthlyincome =
(
    SELECT MAX(monthlyincome)
    FROM hr_employee
);

-- Q14 Lowest Paid Employee(s)

SELECT employeenumber,
       monthlyincome
FROM hr_employee
WHERE monthlyincome =
(
    SELECT MIN(monthlyincome)
    FROM hr_employee
);

-- Q15 Employees Earning Above Department Average Salary

SELECT employeenumber,
       department,
       monthlyincome
FROM hr_employee outer_q
WHERE outer_q.monthlyincome >
(
    SELECT AVG(monthlyincome)
    FROM hr_employee inner_q
    WHERE outer_q.department = inner_q.department
);

-- Q16 Departments Paying Above Company Average Salary

SELECT department,
       AVG(monthlyincome) AS department_avg_salary
FROM hr_employee
GROUP BY department
HAVING AVG(monthlyincome) >
(
    SELECT AVG(monthlyincome)
    FROM hr_employee
);

-- Q17 Job Roles Paying Above Company Average Salary

SELECT jobrole,
       AVG(monthlyincome) AS avg_salary
FROM hr_employee
GROUP BY jobrole
HAVING AVG(monthlyincome) >
(
    SELECT AVG(monthlyincome)
    FROM hr_employee
);