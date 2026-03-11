-- ============================================
-- SALES ANALYSIS PROJECT (SUPERSTORE DATASET)
-- ============================================

-- View dataset
SELECT *
FROM orders
LIMIT 10;

-- Overall business performance
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;

-- Profit by Category
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Regional performance analysis
SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Top 5 Products
SELECT 
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 5;

-- Sales trend over time
SELECT 
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;

-- Profit Margin by Category
SELECT 
    Category,
    SUM(Profit) / SUM(Sales) * 100 AS Profit_Margin_Percentage
FROM orders
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;

-- Top 10 Customers by Sales
SELECT 
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- Products with negative Profit
SELECT 
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;

-- Sales By Sub-category
SELECT 
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

