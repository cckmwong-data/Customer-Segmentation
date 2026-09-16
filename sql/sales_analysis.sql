-- top 10 customers with the highest premium to coverage ratio

CREATE OR REPLACE VIEW `new-project-456705.portfolio.top10_premium` AS
SELECT s.Customer_ID AS Customer_ID, 
       MAX(Cluster_ID) as Cluster_ID,
       MAX(Age) as Age, 
       MAX(Gender) as Gender, 
       Avg(Income) as Income,
       MAX(Occupation) as Occupation,
       MAX(Product_Type) as Product_Type,
       MAX(Category) as Category,
       Sum(Premium) as Total_Premium, 
       Avg(Premium_to_Coverage) as Avg_Premium_to_Coverage, 
       Avg(Tenure_Years) as Tenure_Years,
       Sum(Premium*Tenure_Years) AS CLV
FROM `new-project-456705.portfolio.sales` s
JOIN `new-project-456705.portfolio.customers` c ON s.Customer_ID = c.Customer_ID
JOIN `new-project-456705.portfolio.products` p ON s.Product_ID = p.Product_ID
GROUP by Customer_ID
ORDER BY CLV DESC
LIMIT 10
