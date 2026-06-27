CREATE DATABASE retail;

USE retail;

CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(30),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(30),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    Profit_Margin VARCHAR(20)
);

LOAD DATA LOCAL INFILE 'C:\Users\Brayd\OneDrive\Desktop\Retail Sales Dashboard\SQL\Superstore_Cleaned_UTF8.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
Row_ID,
Order_ID,
Order_Date,
Ship_Date,
Ship_Mode,
Customer_ID,
Customer_Name,
Segment,
Country,
City,
State,
Postal_Code,
Region,
Product_ID,
Category,
Sub_Category,
Product_Name,
Sales,
Quantity,
Discount,
Profit,
Profit_Margin
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'C:/Users/Brayd/OneDrive/Desktop/Retail Sales Dashboard/SQL/Superstore_Cleaned_UTF8.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/Brayd/OneDrive/Desktop/Retail Sales Dashboard/SQL/Superstore_Cleaned_UTF8.csv' INTO TABLE superstore FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS

# View all data

SELECT *
FROM superstore;

# count total records

SELECT COUNT(*) AS total_orders
FROM superstore;

# Total sales and Profit

SELECT
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore;

# Sales by Region

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

# Top 10 highest selling states

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

# Top 10 most profitable products

SELECT
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

# Average discount by category

SELECT
    Category,
    ROUND(AVG(Discount),2) AS Average_Discount
FROM superstore
GROUP BY Category;

# Total sales by customer segment

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

# Highest profit by city

SELECT
    City,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM superstore
GROUP BY City
ORDER BY Total_Profit DESC
LIMIT 10;

# Top 10 customers by sales

SELECT
    Customer_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;