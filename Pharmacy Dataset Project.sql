--------view dataset-----------------

SELECT*
FROM Pharmacy_Data;


------create a back up table------
SELECT*
INTO Pharmacy_Data_copy
FROM Pharmacy_Data;

----Row Count------
SELECT COUNT(*) AS row_count
FROM Pharmacy_Data;

----Column Count------
SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Pharmacy_Data';


-------create a sequence id in the column-----------
ALTER TABLE Pharmacy_Data
ADD id INT IDENTITY (1,1) NOT NULL;

-------------------------------------------DATA CLEANING------------------------------------------
----Do we have Null Values in our dataset ()
SELECT*
FROM Pharmacy_Data
WHERE Distributor IS NULL
      OR Customer_Name IS NULL 
	  OR City IS NULL 
	  OR Country IS NULL 
	  OR Latitude IS NULL
	  OR Longitude IS NULL 
	  OR Channel IS NULL
       OR Sub_channel IS NULL 
	   OR Product_Name IS NULL 
	   OR Product_Class IS NULL
	   OR Quantity IS NULL 
	   OR Price IS NULL 
	   OR Sales IS NULL 
	   OR Month IS NULL 
	   OR Year IS NULL    
	   OR Name_of_Sales_Rep IS NULL
	   OR Manager IS NULL 
	   OR Sales_Team IS NULL 
	   OR id IS NULL;

---------------Update the quantity from negative values to positive----------
UPDATE Pharmacy_Data
SET Quantity = ABS(Quantity);

----------Update the Null Values in the Sales Column ---------------
UPDATE Pharmacy_Data
SET Sales = Quantity*Price
WHERE Sales IS NULL;

--------check the Quantity Column with decimal and round it up-----
SELECT *
FROM Pharmacy_Data
WHERE Quantity - FLOOR(Quantity) > 0;

UPDATE Pharmacy_Data
SET Quantity = ROUND(Quantity,0);

----------check row where quantity is less than 1--------------
SELECT*
FROM Pharmacy_Data
WHERE Quantity < 1; /*   28rows with zero */

------- Delete  row where Quantity is less than 1-----------
DELETE FROM Pharmacy_Data
WHERE Quantity < 1;

------------------------Identify and remove duplicates-------------
SELECT*,
ROW_NUMBER() OVER (PARTITION BY Distributor,Customer_Name,City,Country,Country,Latitude,Longitude,Channel,Latitude,Longitude,Channel,Sub_Channel,
                   Product_Name,Product_Class,Quantity,Price,Sales,Month,Year,Name_of_Sales_Rep,Manager,Sales_Team,id ORDER BY id) AS row_num
FROM Pharmacy_Data;

WITH duplicate_values AS(
                   SELECT*,
              ROW_NUMBER() OVER (PARTITION BY Distributor,Customer_Name,City,Country,Country,Latitude,Longitude,Channel,Latitude,Longitude,
			  Channel,Sub_Channel,Product_Name,Product_Class,Quantity,Price,Sales,Month,Year,Name_of_Sales_Rep,Manager,Sales_Team,id ORDER BY id) AS row_num
           FROM Pharmacy_Data)
SELECT*
FROM duplicate_values
WHERE row_num > 1;     /* No Dupliactes */

SELECT*
FROM Pharmacy_Data;
-----------Check The Distinct Value---------------
SELECT DISTINCT(Distributor)
FROM Pharmacy_Data
ORDER BY 1

/* Rohan ,Rohan and Sons look similar so query was used to check if they are the same distributor but they are not from the point of view,Rohan based in 
poland while Rohan and Sons based in Germany */
SELECT*
FROM Pharmacy_Data
WHERE Distributor = 'Rohan and Sons' OR Distributor = 'Rohan';

SELECT DISTINCT (Customer_Name),Country,City
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT (City)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT(Country)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT(Channel)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT (Sub_channel)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT (Product_Class)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT(Product_Name) 
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT (Month)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT (Year)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT(Name_of_Sales_Rep)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT(Manager)
FROM Pharmacy_Data
ORDER BY 1;

SELECT DISTINCT(Sales_Team)
FROM Pharmacy_Data
ORDER BY 1;

----------Data Cleaning----------
/* Trimming each of the column to remove the white spaces and changing it to lower case to ensure consistency and update */

-- Distributor
UPDATE Pharmacy_Data
SET Distributor = LOWER(TRIM(Distributor));

-- Customer_Name
UPDATE Pharmacy_Data
SET Customer_Name = LOWER(TRIM(Customer_Name));

-- City
UPDATE Pharmacy_Data
SET City = LOWER(TRIM(City));

-- Country
UPDATE Pharmacy_Data
SET Country = LOWER(TRIM(Country));

-- Channel
UPDATE Pharmacy_Data
SET Channel = LOWER(TRIM(Channel));

-- Sub_channel
UPDATE Pharmacy_Data
SET Sub_channel = LOWER(TRIM(Sub_channel));

-- Product_Name
UPDATE Pharmacy_Data
SET Product_Name = LOWER(TRIM(Product_Name));

-- Product_Class
UPDATE Pharmacy_Data
SET Product_Class = LOWER(TRIM(Product_Class));

-- Month
UPDATE Pharmacy_Data
SET Month = LOWER(TRIM(Month));

-- Name_of_Sales_Rep
UPDATE Pharmacy_Data
SET Name_of_Sales_Rep = LOWER(TRIM(Name_of_Sales_Rep));

-- Manager
UPDATE Pharmacy_Data
SET Manager = LOWER(TRIM(Manager));

-- Sales_Team
UPDATE Pharmacy_Data
SET Sales_Team = LOWER(TRIM(Sales_Team));

-----Rename the Sub Channel column name to ensure consistency-----
EXEC sp_rename 'Pharmacy_Data.Sub_channel', 'Sub_Channel', 'COLUMN'

SELECT*
FROM Pharmacy_Data;


-------------------------------------------DATA ANALYSIS----------------------------------------------------
--(1). Top 10 Products that Genarates Highest Sales Revenue-------

SELECT TOP 10 Product_Name,SUM(Sales) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Product_Name
ORDER BY Total_Sales DESC;


--(2).What is the monthly sales trend  for each product -------
SELECT Month,Product_Name,SUM(Sales) AS Total_Sales,
    CASE 
	   WHEN Month = 'january' THEN 1
	   WHEN Month = 'february' THEN 2
	   WHEN Month = 'march'   THEN 3
	   WHEN Month = 'april'   THEN 4
	   WHEN Month = 'may'     THEN 5
	   WHEN Month = 'june'    THEN 6
	   WHEN Month = 'july'    THEN 7
	   WHEN Month = 'august'  THEN 8
	   WHEN Month ='september' THEN 9
	   WHEN Month = 'october'  THEN 10
	   WHEN Month = 'november' THEN 11
	   WHEN Month = 'december' THEN 12 
  END AS Month_Number
FROM Pharmacy_Data
GROUP BY Month,Product_Name
ORDER BY Month_Number,Product_Name;


--(3)---- WHich Geographic regions(cities % countries) shows the highest and lowest sales?--

--Highest Sales city-
SELECT TOP 1 City,SUM(Sales) AS Total_Sales
FROM Pharmacy_Data
GROUP BY City
ORDER BY Total_Sales DESC;

--Lowest Sales city-
SELECT TOP 1 City,SUM(Sales) AS Total_Sales
FROM Pharmacy_Data
GROUP BY City
ORDER BY Total_Sales ASC;

--Highest Sales country-
SELECT TOP 1 Country,SUM(CAST(Sales AS BIGINT)) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Country
ORDER BY Total_Sales DESC;

--Lowest Sales Country-
SELECT TOP 1 Country,SUM(CAST(Sales AS BIGINT)) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Country
ORDER BY Total_Sales ASC;
-------------------------------------------------------------------------------------------------
/*Highest & Lowest Sales By City */
-- Highest Sales by City
SELECT 'highest sales City' AS Category, City, Total_Sales
FROM (
    SELECT TOP 1 City, SUM(Sales) AS Total_Sales
    FROM Pharmacy_Data
    GROUP BY City
    ORDER BY Total_Sales DESC
) AS HighestCity

UNION ALL

-- Lowest Sales by City
SELECT 'lowest sales city' AS Category, City, Total_Sales
FROM (
    SELECT TOP 1 City, SUM(Sales) AS Total_Sales
    FROM Pharmacy_Data
    GROUP BY City
    ORDER BY Total_Sales ASC
) AS LowestCity;

/*Highest & Lowest Sales By Country */

-- Highest Sales by Country
SELECT 'highest sales country' AS Category, Country, Total_Sales
FROM (
    SELECT TOP 1 Country, SUM(CAST(Sales AS BIGINT)) AS Total_Sales
    FROM Pharmacy_Data
    GROUP BY Country
    ORDER BY Total_Sales DESC
) AS HighestCountry

UNION ALL

-- Lowest Sales by Country
SELECT 'lowest sales country' AS Category, Country, Total_Sales
FROM (
    SELECT TOP 1 Country, SUM(CAST(Sales AS BIGINT)) AS Total_Sales
    FROM Pharmacy_Data
    GROUP BY Country
    ORDER BY Total_Sales ASC
) AS LowestCountry;


--(4)---Is There a correllation between the class of drugs and sales perfomance----
SELECT 
    Product_Class, 
    COUNT(*) AS Count, 
    AVG(CAST(Sales AS BIGINT)) AS Average_Sales, 
    SUM(CAST(Sales AS BIGINT)) AS Total_Sales, 
    MIN(CAST(Sales AS BIGINT)) AS Minimum_Sales, 
    MAX(CAST(Sales AS BIGINT)) AS Maximum_Sales, 
    STDEV(CAST(Sales AS BIGINT)) AS Standard_Deviation
FROM Pharmacy_Data
GROUP BY Product_Class
ORDER BY Count DESC;


--(5)---What is the perfomance comparison between different sales channels(Hospital,pharmacy)----------
SELECT Channel,SUM(CAST(Sales AS BIGINT)) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Channel
ORDER BY Total_Sales DESC;

--(6)-----How do sales vary between different sub-channels-------------
SELECT Sub_Channel,SUM(CAST(Sales AS BIGINT)) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Sub_Channel
ORDER BY Total_Sales DESC;

--(7)----Who are the top-performing sales representative and teams------------

--Top performing Sale Rep
SELECT Name_of_Sales_Rep,SUM(Sales) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Name_of_Sales_Rep
ORDER BY Total_Sales DESC;

--Top performing teams
SELECT Sales_Team,SUM(CAST(Sales AS BIGINT)) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Sales_Team
ORDER BY Total_Sales DESC;


---(8)----How does the average price per unit among different product classes?--------
SELECT Product_Class ,AVG(Price) AS avg_price_unit
FROM Pharmacy_Data
GROUP BY Product_Class
ORDER BY avg_price_unit DESC;

--(9)--What are the most purchased products in terms of quantity?------------
SELECT Product_Name,SUM(Quantity) AS Total_Quantity
FROM Pharmacy_Data
GROUP BY Product_Name
ORDER BY Total_Quantity DESC;

---(10)---Which Manager is oversee the highest perfoming sales------
SELECT Manager,SUM(CAST(Sales AS BIGINT)) AS Total_Sales
FROM Pharmacy_Data
GROUP BY Manager
ORDER BY Total_Sales DESC;

---(11)---Total Sum of the Sales------
SELECT SUM(CAST(Sales AS BIGINT)) AS Total_Sum_Of_Sales
FROM Pharmacy_Data;

----(12)----Total sum Quantity Sold----------
SELECT SUM(CAST(Quantity AS BIGINT)) AS Sum_Of_Quantity_Sold
FROM Pharmacy_Data;

--ALL BUSINESS QUESTION HAS BEEN SOLVED USING SQL QUERY WE CAN NOW IMPORT DATA AND ALSO VISUALIZE WITH POWER BI --

SELECT*
FROM Pharmacy_Data;








 