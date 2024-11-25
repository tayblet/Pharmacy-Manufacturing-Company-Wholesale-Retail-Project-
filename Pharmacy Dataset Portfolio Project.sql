--------view dataset-----------------

SELECT*
FROM Pharmacy_Data;

------create a back up table------
SELECT*
INTO Pharmacy_Data_copy
FROM Pharmacy_Data;

----Row Count------
SELECT COUNT(*) AS row_count
FROM Pharmacy_Data_copy;

----Column Count------
SELECT COUNT(*) AS column_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Pharmacy_Data_copy';


-------create a sequence id in the column-----------
ALTER TABLE Pharmacy_Data_copy
ADD id INT IDENTITY (1,1) NOT NULL;

-------------------------------------------DATA CLEANING------------------------------------------
----Do we have Null Values in our dataset ()
SELECT*
FROM Pharmacy_Data_copy
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
UPDATE Pharmacy_Data_copy
SET Quantity = ABS(Quantity);

SELECT*
FROM Pharmacy_Data_copy
WHERE Quantity > 0 AND Quantity < 1;


----------Update the Null Values in the Sales ---------------
UPDATE Pharmacy_Data
SET Sales = Quantity*Price
WHERE Sales IS NULL;

----------Drop a Null values in the Table----------
DELETE FROM Pharmacy_Data_copy
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

----------- Convert the quantity to int-------
UPDATE Pharmacy_Data
SET Quantity = CAST(Quantity AS INT);