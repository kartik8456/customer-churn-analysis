--Q1. Calculate average , min, max of numerical columns
SELECT 
	AVG(age) AS average_age,
	MIN(age) AS minimun_age,
	MAX(age) AS maximum_age,
	AVG(tenuremonths) AS average_tenuremonths,
	MIN(tenuremonths) AS minimun_tenuremonths,
	MAX(tenuremonths) AS maximum_tenuremonths,
	AVG(monthlycharges) AS average_monthlycharges,
	MIN(monthlycharges) AS minimun_monthlycharges,
	MAX(monthlycharges) AS maximum_monthlycharges,
	AVG(totalcharges) AS average_totalcharges,
	MIN(totalcharges) AS minimun_totalcharges,
	MAX(totalcharges) AS maximum_totalcharges,
	AVG(numsupportcalls) AS average_numsupportcalls,
	MIN(numsupportcalls) AS minimun_numsupportcalls,
	MAX(numsupportcalls) AS maximum_numsupportcalls,
	AVG(satisfactionscore) AS average_satisfactionscore,
	MIN(satisfactionscore) AS minimun_satisfactionscore,
	MAX(satisfactionscore) AS maximum_satisfactionscore
FROM churn;

--Q2. How percentage churn and how many not churned
SELECT 
	churn, (100 * COUNT(churn) / (SELECT COUNT(*) FROM churn)) AS Total_Percentage
FROM churn
GROUP BY churn;


--Q3. what are the average total_spending of churned and non-churned customers

SELECT
	churn,agegroup, ROUND(AVG(totalcharges), 2) AS Average_Total_Spending
FROM churn
GROUP BY churn, agegroup
ORDER BY Average_Total_Spending;


--Create a column named Qbuarter
ALTER TABLE churn
ADD COLUMN Quarter TEXT;

UPDATE churn
SET Quarter = CASE
	WHEN month IN ('January', 'February', 'March') THEN 'Quarter 1'
	WHEN month IN ('April', 'May', 'June') THEN 'Quarter 2'
	WHEN month IN ('July', 'August', 'September') THEN 'Quarter 3'
	WHEN month IN ('October', 'November', 'December') THEN 'Quarter 4'
END;

--Q4. Calculate Quarterly churned 

SELECT 
	churn, Quarter, COUNT(*) AS Total_Churned,ROUND(AVG(totalcharges), 2) AS Average_total_spending
FROM churn
GROUP BY churn, Quarter;

--Q5. Total spent of churned and non-churned customers

SELECT
	churn, SUM(totalcharges) AS Total_Spent
FROM churn
GROUP BY churn;

--Q6. Total number of customers has churned and non-churned

SELECT 
	churn, COUNT(*) AS Total_Customers
FROM churn
GROUP BY churn;

--Q7. Average Tenuremonths of churned non-churned customers 

SELECT
	churn, ROUND(AVG(tenuremonths), 2) AS Average_Tenuremonths
FROM churn
GROUP BY churn;

--Q8. Calculate churn group by year

SELECT
	churn, year,agegroup,  COUNT(*) AS Total_Customer
FROM churn
GROUP BY churn, year, agegroup
ORDER BY year, churn, agegroup;

--Q9. total customer gain by year

SELECT 
	year, COUNT(customerid) AS Total_Customer_Join
FROM churn
GROUP BY year
ORDER BY year;


--Q10. Customers grouped by Internetservice

SELECT 
	internetservice,churn,  COUNT(customerid) AS Total_Customers
FROM churn
GROUP BY internetservice, churn
ORDER BY churn;

--Q11. Total customer who has churned and their numsupportcalls = 0


SELECT
	quarter, COUNT(*) AS Total_Customer
FROM churn
WHERE churn = 'Yes' AND numsupportcalls = 0
GROUP BY quarter;



SELECT * FROM churn;

