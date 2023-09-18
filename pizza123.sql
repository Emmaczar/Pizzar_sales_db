SELECT * FROM pizza.pizza_sales_csv;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales_csv;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales_csv;

SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales_csv;

SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales_csv;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order FROM pizza_sales_csv;

SELECT DAYNAME(order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales_csv
GROUP BY DAYNAME(order_date);

SELECT MONTHNAME(order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_csv
GROUP BY MONTHNAME(order_date)
ORDER BY Total_Orders DESC;

SELECT pizza_category,SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales_csv WHERE MONTH(order_date) = 1) AS PCT
FROM pizza_sales_csv
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales_csv) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_csv
WHERE QUARTER(order_date) = 1
GROUP BY pizza_size
ORDER BY PCT;

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_csv 
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;