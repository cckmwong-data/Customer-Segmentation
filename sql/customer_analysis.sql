-- Total number of policy holders, average and max premium, average and max premium to coverage ratio,
-- average and max no. of tenure years

CREATE OR REPLACE VIEW `new-project-456705.portfolio.overall_stat` AS
Select Count(DISTINCT s.Customer_ID) AS No_of_Customers,
       AVG(Premium) AS Avg_Premium,
       AVG (Coverage) As Avg_Coverage,
       MAX(Premium) AS Max_Premium,
       AVG(Premium_to_Coverage) AS Avg_Premium_Coverage,
       MAX(Premium_to_Coverage) AS Max_Premium_Coverage,
       AVG(Tenure_Years) AS Avg_Tenure,
       MAX(Tenure_Years) AS Max_Tenure
FROM `new-project-456705.portfolio.sales` s
JOIN `new-project-456705.portfolio.customers` c ON s.Customer_ID = c.Customer_ID
