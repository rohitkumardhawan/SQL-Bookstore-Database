DROP table IF EXISTS loan_portfolio;
CREATE TABLE  loan_portfolio (
LoanID	varchar (100) primary key,
CustomerID	varchar (100),
LoanTypeID	varchar (100),	
LoanAmount_INR	INT,
InterestRate_Pct	NUMERIC(10, 2),
Term_Months	varchar (100),
StartDate DATE,
LoanStatus	varchar (100)
);


DROP table IF EXISTS customer_demographic;
CREATE TABLE  customer_demographic (
CustomerID	varchar(100)	primary key,
CustomerName	varchar(100),
Age	int,	
Gender	varchar(100)	,
MaritalStatus	varchar(100)	,
AnnualIncome_INR	int	,
EmploymentType	varchar(100)	,
CreditScore	varchar(100)	,
GeographicRegion	varchar(100)	
);

DROP table IF EXISTS loan_product;
CREATE TABLE  loan_product (
LoanTypeID	varchar(100),
LoanTypeName	varchar(100)	,
BaseInterestRate_Pct	numeric(10, 2),	
MinCreditScoreRequired	int,	
MaxTerm_Months	int
);

INSERT INTO loan_product (
    LoanTypeID,
    LoanTypeName,
    BaseInterestRate_Pct,
    MinCreditScoreRequired,
    MaxTerm_Months
)
VALUES
('LT-101', 'Housing Asset Loan', 8.25, 650, 360),
('LT-102', 'Unsecured Personal Credit', 13.50, 680, 60),
('LT-103', 'Automobile Term Loan', 9.50, 660, 84),
('LT-104', 'Higher Education Loan', 10.25, 600, 120),
('LT-105', 'Commercial Enterprise Loan', 15.00, 700, 180),
('LT-106', 'Micro-Business Credit', 16.50, 580, 48);

select * from loan_product

select * from customer_demographic

select * from loan_portfolio

TRUNCATE TABLE loan_product_catalog CASCADE;


-- ==========================
-- BASIC SQL QUERIES (1-10)
-- ==========================


1. -- Retrieve All Customer Records

select * from customer_demographic

2. -- Display All Loan Records

select * from loan_product

3. -- Find all customers residing in ''Mumbai, Pune, Bangluru''

select  customerName, GeographicRegion from customer_demographic
where geographicRegion IN ('Mumbai', 'Pune', 'Bangluru');

4. -- Find Customers Above a 7lakh Annual Income

select customername, AnnualIncome_INR from customer_demographic
where AnnualIncome_INR>'700000';

5. -- Display all loans that are currently active

select * from loan_portfolio  
where loanstatus = 'Active';

6. -- Display 10 High-Value Loans
 select * from loan_portfolio
 order by loanamount_inr desc limit 10;

7. -- Display customers in descending order based on annual income

 SELECT CUSTOMERNAME, ANNUALINCOME_INR FROM customer_demographic
 ORDER BY annualincome_inr desc;

8. -- Identify the top ten customers with the highest sanctioned loan amounts

select l.customerid, c.customername, sum(l.loanamount_inr) AS TOTAL_LOANAMOUNT
from loan_portfolio l
JOIN customer_demographic c on c.customerid=l.customerid
GROUP BY c.customername, l.customerid
ORDER BY TOTAL_LOANAMOUNT DESC LIMIT 10;

9. -- Calculate the total number of customers in the banking database
 SELECT COUNT(DISTINCT CustomerID)  FROM CUSTOMER_DEMOGRAPHIC

 -- SOME NAMES ARE SAME BUT DIFFERENT CUSTOMER ID 

10. -- Determine the number of loans issued for each loan product category

SELECT  L.LOANTYPENAME, COUNT(LO.LOANTYPEID)
FROM loan_portfolio lo
JOIN loan_product l on l.loantypeid=LO.LOANTYPEID
GROUP BY lo.loantypeid, l.loantypename;

-- ==========================
-- ADVANCE SQL QUERIES (10-29)
-- ==========================


11. -- Determine the total sanctioned loan amount for customers in each state

SELECT C.GEOGRAPHICREGION, SUM(L.LOANamount_inr) AS TOTAL_LOANAMOUNT
FROM loan_portfolio l
join customer_demographic c on c.customerid=l.customerid
GROUP BY C.GEOGRAPHICREGION;

12. -- Find the average loan amount issued for each loan product category

SELECT L.LOANTYPEID, LO.LOANTYPENAME, AVG(L.LOANAMOUNT_INR) 
FROM loan_product LO
JOIN loan_portfolio L ON L.LOANTYPEID=LO.LOANTYPEID
GROUP BY L.LOANTYPEID, LO.LOANTYPENAME;

13. -- Count the distribution of customers based on their employment type

SELECT EmploymentType, count(EmploymentType)
FROM CUSTOMER_DEMOGRAPHIC
GROUP BY EmploymentType;

14. -- Determine the number of male and female customers in the banking portfolio

SELECT GENDER, COUNT(GENDER) FROM CUSTOMER_DEMOGRAPHIC
GROUP BY GENDER;

15. -- Evaluate the average annual income for each occupation category

SELECT EmploymentType, AVG (AnnualIncome_INR) AS TOTAL_INCOME
FROM customer_demographic
GROUP BY EMPLOYMENTTYPE;

16. -- Measure the outstanding loan portfolio across different states

select c.GeographicRegion,  sum(l.LoanAmount_INR) AS totalloanamount
from loan_portfolio l
JOIN customer_demographic c on c.customerid=l.customerid
group by c.GeographicRegion order by totalloanamount desc limit 2;

17. -- Identify the maximum sanctioned loan amount for every loan product
select lo.LoanTypeName, max(l.LoanAmount_INR) AS MAX_loanamount
from loan_portfolio l
join loan_product lo on lo.loantypeid=l.loantypeid
GROUP BY lo.LoanTypeName;

18. --  Determine the minimum interest rate provided across all loan products

select lo.LoanTypeName, min(l.InterestRate_Pct) AS MAX_loanamount
from loan_portfolio l
join loan_product lo on lo.loantypeid=l.loantypeid
GROUP BY lo.LoanTypeName;


19. -- Find customers who have been issued more than one loan

SELECT
    l.CustomerID, c.customername,
    COUNT(l.LoanTypeID) AS Total_Loans
FROM loan_portfolio l
join customer_demographic c on c.customerid=l.customerid
GROUP BY l.CustomerID,c.customername
HAVING COUNT(l.LoanTypeID) > 1;

20. -- Analyze the average credit score of borrowers for each loan product

SELECT
    LP.LoanTypeName,
    AVG(CAST(C.CreditScore AS INT)) AS Average_Credit_Score
FROM loan_portfolio L
JOIN customer_demographic C
    ON L.CustomerID = C.CustomerID
JOIN loan_product LP
    ON L.LoanTypeID = LP.LoanTypeID
GROUP BY
    LP.LoanTypeName;

21. -- count the number of loans based on their status

select LoanStatus, count(LoanStatus)
from loan_portfolio
group by LoanStatus;

22. -- Rank customers based on the total amount they have borrowed from the bank

WITH Customer_DEMOGRAPHIC AS (
    SELECT
        c.CustomerName,
        SUM(l.LoanAmount_INR) AS Total_LoanAmount
    FROM loan_portfolio l
    JOIN customer_demographic c
        ON c.CustomerID = l.CustomerID
    GROUP BY
        c.CustomerName
)

SELECT
    CustomerName,
    Total_LoanAmount,
    RANK() OVER (ORDER BY Total_LoanAmount DESC) AS Loan_Rank
FROM Customer_DEMOGRAPHIC
ORDER BY Total_LoanAmount DESC;

23. -- Combine customer and loan tables to display complete loan information for each customer

SELECT DISTINCT(C.CUSTOMERID),L.LOANID,C.CUSTOMERNAME, L.LOANTYPEID,SUM(LOANAMOUNT_INR), L.INTERESTRATE_PCT, L.TERM_MONTHS, L.STARTDATE, L.LOANSTATUS  FROM loan_portfolio L
INNER JOIN CUSTOMER_DEMOGRAPHIC C ON C.CUSTOMERID=L.CUSTOMERID
GROUP BY C.CUSTOMERNAME, L.LOANID, C.CUSTOMERID;

24. -- Retrieve each customer's name along with the corresponding loan product they have been issued

SELECT C.CUSTOMERID,C.CUSTOMERNAME, L.LOANTYPENAME 
FROM loan_product L
JOIN LOAN_PORTFOLIO LO ON LO.LOANTYPEID=L.LOANTYPEID
JOIN CUSTOMER_DEMOGRAPHIC C ON C.CUSTOMERID=LO.CUSTOMERID
GROUP BY C.CUSTOMERID,C.CUSTOMERNAME,L.LOANTYPENAME ;

25. -- Determine the popularity of each loan product based on the number of loans issued

SELECT LO.LOANTYPENAME, COUNT(L.LOANTYPEID) AS POPULARITY
FROM LOAN_PRODUCT LO
JOIN LOAN_PORTFOLIO L ON L.LOANTYPEID=LO.LOANTYPEID
GROUP BY LO.LOANTYPENAME
ORDER BY POPULARITY DESC;

26. -- Retrieve customer age along with the sanctioned loan amount to analyze borrowing patterns across different age groups

SELECT C.AGE, L.LOAnTYPENAME, sum(lo.LoanAmount_INR)
FROM LOAN_PRODUCT L
JOIN loan_portfolio LO ON lo.loantypeid=l.loantypeid
join customer_demographic c on c.customerid=lo.customerid
group by C.AGE, L.LOAnTYPENAME
order by age asc;

27. -- Analyze the relationship between customers' annual income and the amount of loan sanctioned

SELECT
    C.CustomerID,
    C.CustomerName,
    C.AnnualIncome_INR,
    L.LoanAmount_INR
FROM customer_demographic C
JOIN loan_portfolio L
    ON C.CustomerID = L.CustomerID
ORDER BY C.AnnualIncome_INR DESC;

28. -- Calculate the number of customers associated with each loan product to understand product demand
-- Calculate the number of customers associated with each loan product

SELECT
    LP.LoanTypeID,
    LP.LoanTypeName,
    COUNT(DISTINCT L.CustomerID) AS Total_Customers
FROM loan_product LP
JOIN loan_portfolio L
    ON LP.LoanTypeID = L.LoanTypeID
GROUP BY
    LP.LoanTypeID,
    LP.LoanTypeName
ORDER BY
    Total_Customers DESC;


	


