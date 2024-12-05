# Pharmacy-Manufacturing-Company-Wholesale-Retail-Project-

# Introduction
This portfolio project involves an in-depth examination of a comprehensive dataset from a pharmacy manufacturing company's wholesale and retail operations. The dataset encompasses multiple facets of the sales process, providing a rich source of information for insightful analysis. Below is a brief overview of the key fields included in the dataset:
1. **Distributor**: Identifies the wholesalers distributing the products.
2. **Customer Name**: The name of the customers purchasing the products.
3. **City**: The city where the customer is located.
4. **Country**: The country of the customer.
5. **Latitude and Longitude**: Geographical coordinates of the customer’s location.
6. **Channel**: Classifies the buyer type (e.g., Hospital, Pharmacy).
7. **Sub-channel**: Further details the sector of the buyer (e.g., Government, Private).
8. **Product Name**: Specifies the name of the drug being sold.
9. **Product Class**: Categorizes the drugs (e.g., Antibiotics, Antipyretics).
10. **Quantity**: Indicates the quantity of the product purchased.
11. **Price**: The price at which the product was sold.
12. **Sales**: Total sales amount generated from the transaction.
13. **Month and Year**: Indicates when the sale occurred.
14. **Name of Sales Rep**: The sales representative who facilitated the sale.
15. **Manager**: The manager overseeing the sales representative.
16. **Sales Team**: The team to which the sales representative belongs.

## Project Objective
The primary goals of this project are to answer the following key business questions:
1. **Top 10 Products by Sales Revenue**: Identify the top 10 products generating the highest sales revenue.
2. **Monthly Sales Trends**: Analyze the monthly sales trend for each product.
3. **Top 5 Geographic Regions**: Determine the top 5 geographic regions (cities and countries) with the highest and lowest sales.
4. **Correlation Between Drug Class and Sales Performance**: Investigate if there is a correlation between the class of drugs and sales performance.
5. **Performance Comparison Between Sales Channels**: Compare the performance of different sales channels (Hospital, Pharmacy).
6. **Sales Variation Between Sub-Channels**: Analyze how sales vary between different sub-channels (Government, Private, etc.).
7. **Top-Performing Sales Representatives and Teams**: Identify the top-performing sales representatives and teams.
8. **Average Price Per Unit**: Determine how the average price per unit varies among different product classes.
9. **Most Purchased Products by Quantity**: Identify the most purchased products in terms of quantity.
10. **Highest-Performing Sales Teams by Manager**: Identify which managers oversee the highest-performing sales teams.

## Tools Used
- **Microsoft Excel**: Utilized as a primary tool for a quick and initial exploration of the dataset to get a preliminary understanding of the data, inspect it, and understand its structure.
- **Microsoft SQL Server**: The dataset was imported into Microsoft SQL Server from Excel for analysis.
- **Power BI**: Used to create visualizations of the analysis to gain more insights into the business questions.
- **GitHub**: Hosting the project documentation and version control.

## Data Cleaning
These processes were carried out using SQL Server Management Studio:
1. **Null Value Identification**:
   - The query identifies columns with null values: Distributor, Customer Name, City, Country, etc.
2. **Data Correction**:
   - Negative Quantity Correction: Negative quantities in the Quantity column are corrected by converting them to absolute values.
   - Missing Sales Calculation: Missing Sales values are calculated by multiplying Quantity and Price.
   - Quantity Rounding: Quantities are rounded to the nearest integer.
3. **Data Consistency**:
   - Duplicate Removal: The query identifies and removes duplicate rows based on multiple columns.
   - Data Standardization: The TRIM and LOWER functions are used to remove leading/trailing spaces and convert text to lowercase, ensuring consistency across the dataset.
4. **Column Renaming**:
   - The sp_rename procedure is used to rename the Sub_channel column to Sub_Channel for consistency.

## Advanced Analysis
- **Grouping and Aggregation**: Summarizes data by categories for insights into trends.
- **Window Functions**: Identifies and removes duplicates for data integrity.
- **Conditional Logic**: Converts month names to numbers for sorting.
- **Joins and Subqueries**: Combines data from multiple tables for complex analysis.
- **Temporary Tables and CTEs**: Breaks down complex queries for readability.

## Power BI
Used to create the visualization of the analysis to gain more insight into the business questions.
# Business Questions
1. **Which Top 10 Products Generate the Highest Sales Revenue**: Identifying the top revenue-generating products helps the company focus on high-performing products for strategic marketing, inventory management, and sales optimization.
2. **What is the Monthly Sales Trend for Each Product**: Understanding monthly sales trends allows the company to identify seasonal patterns, forecast demand, and plan production and inventory accordingly.
3. **What are the Top 5 Geographic Regions (Cities and Countries) Showing the Highest and Lowest Sales**: Analyzing sales by geographic region helps the company target its marketing efforts, allocate resources efficiently, and identify potential new markets or regions needing improvement.
4. **Is There a Correlation Between the Class of Drug and Sales Performance**: Investigating this correlation helps the company understand which drug classes are more popular or profitable, guiding product development, marketing strategies, and portfolio management.
5. **What is the Performance Comparison Between Different Sales Channels (Hospital, Pharmacy)**: Comparing sales channels enables the company to optimize its distribution strategy, understand channel-specific challenges, and allocate resources to the most effective channels.
6. **How Do Sales Vary Between Different Sub-Channels (Government, Private, etc)**: Analyzing sub-channel performance helps the company tailor its approach to different buyer sectors, adjust pricing strategies, and improve customer targeting.
7. **Who are the Top-Performing Sales Representatives and Teams**: Identifying top-performing sales representatives and teams allows the company to recognize and reward high achievers, share
