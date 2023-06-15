-- CAPSTONE PROJECT - CREDIT CRAD PROPOSAL APPROVAL
SELECT * 
FROM  data_cleaned;
USE capstone;

-- Question 1: Group the customers based on their income type and find the average of their annual income.

SELECT Type_income, ROUND(AVG(Annual_income),2) Average_Annual_Income
FROM data_cleaned 
GROUP BY Type_income;

-- Question 2: Find the female owners of cars and property.

SELECT *
FROM data_cleaned 
WHERE Car_Owner="Y" AND Propert_Owner="Y" AND GENDER = "F" ;

-- Question 3: Find the male customers who are staying with their families.

SELECT * 
FROM data_cleaned
WHERE Housing_type = "With parents" AND GENDER = "M";

-- Question 4: Please list the top five people having the highest income.

SELECT * 
FROM data_cleaned
ORDER BY Annual_income DESC
LIMIT 5;         

-- Question 5: How many married people are having bad credit?

SELECT Marital_status,COUNT(*) No_of_Bad_Credit
FROM data_cleaned 
WHERE  label = 1
GROUP BY Marital_status
HAVING Marital_status = "Married";

-- Question 6: What is the highest education level and what is the total count?

SELECT EDUCATION, count(*) No_of_people
FROM data_cleaned 
GROUP BY EDUCATION
HAVING EDUCATION = "Higher education";

-- Question 7: Between married males and females, who is having more bad credit? 

WITH BAD_CREDIT AS
   (SELECT GENDER,COUNT(*) No_of_Bad_Credit
    FROM data_cleaned 
	WHERE  label = 1 AND Marital_status = "Married"
    GROUP BY GENDER) 
    
SELECT * FROM BAD_CREDIT
ORDER BY No_of_Bad_Credit DESC LIMIT 1 ;
