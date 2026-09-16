-- joined all the tables

CREATE OR REPLACE VIEW `new-project-456705.portfolio.joined_all` AS
SELECT s.Policy_ID AS Policy_ID,
       Product_Name,
       p.Product_ID AS Product_ID,
       Product_Type,
       Category,
       Purchase_Date,
       c.Customer_ID AS Customer_ID,
       Age,
       CASE 
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN Age > 60 THEN '60+'
       END AS Age_Group,
       Gender,
       City,
       Marital_Status,
       Education,
       Occupation,
       Income,
       Tenure_Years,
       CASE 
        WHEN Tenure_Years BETWEEN 0 AND 5 THEN '0-5'
        WHEN Tenure_Years BETWEEN 5 AND 10 THEN '5-10'
        WHEN Tenure_Years BETWEEN 10 AND 15 THEN '10-15'
        WHEN Tenure_Years BETWEEN 15 AND 20 THEN '15-20'
        WHEN Tenure_Years > 20 THEN '20+'
       END AS Tenure_Gp,
       Preferred_Channel,
       Preferred_Language,
       Preferred_Time,
       Premium,
       Coverage,
       Premium_to_Coverage,
       (Premium * Tenure_Years) AS CLV,
       Cluster_ID      
FROM `new-project-456705.portfolio.sales` s
JOIN `new-project-456705.portfolio.customers` c ON s.Customer_ID = c.Customer_ID
JOIN `new-project-456705.portfolio.products` p ON p.Product_ID = s.Product_ID
