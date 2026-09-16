-- Number of policy holders per policy category in each customer segment

CREATE OR REPLACE VIEW `new-project-456705.portfolio.product_popularity_cluster` AS
SELECT c.Cluster_ID, p.Category AS Category, COUNT(*) AS TotalCount, 'Category' AS Type
FROM `new-project-456705.portfolio.customers` c
JOIN `new-project-456705.portfolio.sales` s ON c.Customer_ID = s.Customer_ID
JOIN `new-project-456705.portfolio.products` p ON s.Product_ID = p.Product_ID
GROUP BY Cluster_ID, Category

UNION ALL

-- Number of policy holders per product type in each customer segment

SELECT c.Cluster_ID, p.Product_Type AS Product_Type, COUNT(*) AS TotalCount, 'Product Type' AS Type
FROM `new-project-456705.portfolio.customers` c
JOIN `new-project-456705.portfolio.sales` s ON c.Customer_ID = s.Customer_ID
JOIN `new-project-456705.portfolio.products` p ON s.Product_ID = p.Product_ID
GROUP BY Cluster_ID, Product_Type


CREATE OR REPLACE VIEW `new-project-456705.portfolio.top5_products` AS

-- Top 5 by number
SELECT Product_Name, Feature, Type
FROM (
  SELECT Product_Name, COUNT(*) AS Feature, "# of Policyholders" AS Type
  FROM `new-project-456705.portfolio.sales` s
  JOIN `new-project-456705.portfolio.products` p ON s.Product_ID = p.Product_ID
  GROUP BY Product_Name
  ORDER BY Feature DESC
  LIMIT 5
)

UNION ALL

-- Top 5 by premium
SELECT Product_Name, Feature, Type
FROM (
  SELECT Product_Name, SUM(Premium) AS Feature, "Total Premium" AS Type
  FROM `new-project-456705.portfolio.sales` s
  JOIN `new-project-456705.portfolio.products` p ON s.Product_ID = p.Product_ID
  GROUP BY Product_Name
  ORDER BY Feature DESC
  LIMIT 5
);
