-- Q18 Employees Earning Below Department Average Salary

SELECT employeenumber,
       department,
       monthlyincome
FROM hr_employee outer_q
WHERE outer_q.monthlyincome <
(
    SELECT AVG(monthlyincome)
    FROM hr_employee inner_q
    WHERE outer_q.department = inner_q.department
);

-- Q19 Employees Earning Highest Salary In Their Department

SELECT employeenumber,
       department,
       monthlyincome
FROM hr_employee outer_q
WHERE outer_q.monthlyincome =
(
    SELECT MAX(monthlyincome)
    FROM hr_employee inner_q
    WHERE outer_q.department = inner_q.department
);

-- Q20 Employees With YearsAtCompany Greater Than Department Average

SELECT employeenumber,
       department,
       yearsatcompany
FROM hr_employee outer_q
WHERE outer_q.yearsatcompany >
(
    SELECT AVG(yearsatcompany)
    FROM hr_employee inner_q
    WHERE outer_q.department = inner_q.department
);

-- Q21 Employees Earning Above Job Role Average Salary

SELECT employeenumber,
       jobrole,
       monthlyincome
FROM hr_employee outer_q
WHERE outer_q.monthlyincome >
(
    SELECT AVG(monthlyincome)
    FROM hr_employee inner_q
    WHERE outer_q.jobrole = inner_q.jobrole
);

-- Q22 Employees Earning Above Department + Job Role Average Salary

SELECT employeenumber,
       department,
       jobrole,
       monthlyincome
FROM hr_employee outer_q
WHERE outer_q.monthlyincome >
(
    SELECT AVG(monthlyincome)
    FROM hr_employee inner_q
    WHERE outer_q.department = inner_q.department
      AND outer_q.jobrole = inner_q.jobrole
);

-- Q23 Employees With Longest Tenure In Department + Job Role

SELECT employeenumber,
       department,
       jobrole,
       yearsatcompany
FROM hr_employee outer_q
WHERE outer_q.yearsatcompany =
(
    SELECT MAX(yearsatcompany)
    FROM hr_employee inner_q
    WHERE outer_q.department = inner_q.department
      AND outer_q.jobrole = inner_q.jobrole
);