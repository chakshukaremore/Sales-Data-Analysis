USE sales_analysis;

CREATE TABLE sales (
    `Row ID` INT,
    `Order ID` VARCHAR(50),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `Customer Name` VARCHAR(150),
    `Segment` VARCHAR(50),
    `Country/Region` VARCHAR(100),
    `City` VARCHAR(100),
    `State/Province` VARCHAR(100),
    `Postal Code` VARCHAR(20),
    `Region` VARCHAR(50),
    `Product ID` VARCHAR(50),
    `Category` VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(255),
    `Sales` DECIMAL(12,2),
    `Quantity` INT,
    `Discount` DECIMAL(5,2),
    `Profit` DECIMAL(12,2)
);


LOAD DATA LOCAL INFILE 'C:/Users/chaks/Sales-Data-Analysis/data/cleaned_sales_data.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS total_rows
FROM sales;
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales;
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    YEAR(`Order Date`) AS Order_Year,
    MONTH(`Order Date`) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY
    Order_Year,
    Order_Month;
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;