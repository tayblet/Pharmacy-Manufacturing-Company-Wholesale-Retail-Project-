# Pharmacy-Manufacturing-Company-Wholesale-Retail-Project-
# Table of Contents
1. [Introduction](#introduction)
2. [Project Objective](#project-objective)
3. [Tools Used](#tools-used)
4. [Data Cleaning](#data-cleaning)
5. [Advanced Analysis](#advanced-analysis)
6. [Power BI](#power-bi)
7. [Business Questions](#business-questions)
8. [Dashboard](#dashboard)
9. [Conclusions](#conclusions)
10. [Key Recommendations](#key-recommendations)
    
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
7. **Who are the Top-Performing Sales Representatives and Teams**: Identifying top-performing sales representatives and teams allows the company to recognize and reward high achievers, share best practices, and provide targeted training and support.
8. **How Does the Average Price Per Unit Vary Among Different Product Classes**: Understanding pricing variations across product classes helps the company set competitive prices, identify premium products, and adjust pricing strategies to maximize revenue.
9. **What are the Most Purchased Products in Terms of Quantity**: Identifying the most purchased products by quantity helps the company understand customer preferences, manage inventory effectively, and ensure consistent supply of high-demand products.
10. **Which Managers Oversee the Highest-Performing Sales Teams**: Recognizing managers of high-performing teams helps the company understand effective leadership practices, implement successful strategies across teams, and provide recognition and support to key leaders.

These business questions are designed to provide comprehensive insights into the company's sales performance, enabling data-driven decision-making and strategic planning to optimize operations and enhance profitability.

## Dashboard
![Pharmacy Visualization](https://github.com/tayblet/Pharmacy-Manufacturing-Company-Wholesale-Retail-Project-/blob/73031b38a615b9c4b6485e7009e094fddda715cb/Pharmacy%20viz1.PNG)

![Pharmacy Visualization 2](https://github.com/tayblet/Pharmacy-Manufacturing-Company-Wholesale-Retail-Project-/blob/73031b38a615b9c4b6485e7009e094fddda715cb/Pharmacy%20viz2.PNG)





## Conclusions
The SQL analysis and the dashboard provides extensive insights into sales trends, geographic performance, and the correlation between drug classes and sales. It highlights the top-performing products, sales channels, representatives, and managers, offering a comprehensive overview that informs strategic decisions and optimizes business operations. Further detailed analysis could enhance the understanding of sub-channels and specific product quantities, leading to more refined business strategies.

1. **Top 10 Products Generating the Highest Sales Revenue**
   - The top 10 products by sales revenue include:
     - Ionclotide: €0.17bn
     - Tetratanyl: €0.13bn
     - Sumanazide: €0.11bn
     - Betanem: €0.11bn
     - Docstryl: €0.11bn
     - Travoloric: €0.10bn
     - Proprate: €0.10bn
     - Cephozol: €0.10bn
     - Ketastadil: €0.10bn
     - Nevanid: €0.10bn

2. **Monthly Sales Trend for Each Product**
   - The dashboard indicates fluctuating sales trends for products such as abatatritpan, abobozolid, abilovir aprotasol, and abranatal lysoprosate, showing seasonal or market-driven variations.

3. **Top 5 Geographic Regions (Cities and Countries) with Highest and Lowest Sales**
   - **Highest Sales by City**: Butzbach (€96M), Baesweiler (€65M), Cuxhaven (€57M), Friedberg (€52M), Altenburg (€51M)
   - **Lowest Sales by City**: Szczytno (€1.7M), Nowy Targ (€1.8M), Płock (€1.8M), Krotoszyn (€1.9M), Police (€2.0M)
   - **Highest Sales by Country**: Germany (€11.4bn)
   - **Lowest Sales by Country**: Poland (€0.7bn)

4. **Correlation Between Class of Drug and Sales Performance**
   - A potential correlation between drug class and sales performance is suggested. For instance, antipyretics have the highest average price (469), while antimalarials have the lowest (338).

5. **Performance Comparison Between Different Sales Channels (Hospital, Pharmacy)**
   - Sales distribution shows:
     - Hospital: 52.7% of total sales (€6bn)
     - Pharmacy: 47.3% of total sales (€6bn)

6. **Sales Variation Between Different Sub-Channels (Government, Private, etc.)**
   - Sales by sub-channels include:
     - Retail: €3.4bn
     - Government: €3.1bn
     - Institutional: €3.0bn
     - Private: €2.6bn

7. **Top-Performing Sales Representatives and Teams**
   - **Top Sales Representatives**:
     - Jimmy G.: €1.00bn
     - Abigail T.: €1.00bn
     - Sheila S.: €0.98bn
     - Daniel G.: €0.98bn
     - Anne W.: €0.94bn
     - Morris M.: €0.92bn
     - Stella G.: €0.91bn
     - Jessica S.: €0.91bn
     - Thompson J.: €0.90bn
     - Steve P.: €0.90bn
     - Mary G.: €0.90bn
     - Erica J.: €0.90bn

8. **Average Price Per Unit Among Different Product Classes**
   - Antipyretics: 469
   - Analgesics: 433
   - Antibiotics: 420
   - Antiseptics: 412
   - Mood Stabilizers: 400
   - Antimalarials: 338

9. **Most Purchased Products in Terms of Quantity**
   - The highest quantities purchased include:
     - Ionclotide: 0.27bn units
     - Tetratanyl: 0.25bn units
     - Sumanazide: 0.22bn units
     - Betanem: 0.22bn units
     - Docstryl: 0.21bn units
     - Travoloric: 0.20bn units
     - Proprate: 0.19bn units
     - Cephozol: 0.18bn units
     - Ketastadil: 0.17bn units
     - Nevanid: 0.15bn units

10. **Managers Overseeing the Highest-Performing Sales Teams**
    - **Top Manager**: Jimmy G.: €1.00bn
    - **Other Managers**:
      - Abigail T.: €1.00bn
      - Sheila S.: €0.98bn
      - Daniel G.: €0.98bn

## Key Recommendations
1. **Focus on Top Revenue-Generating Products**
   - Prioritize marketing and sales efforts on the top 10 products (e.g., Ionclotide, Tetratanyl) that generate the highest revenue.
   - Ensure these products are always well-stocked to meet demand and prevent stockouts.

2. **Leverage Monthly Sales Trends**
   - Utilize the insights from monthly sales trends to plan marketing campaigns and promotions during peak months.
   - Address any seasonal dips in sales with targeted promotions or discounts.

3. **Target High-Performing Geographic Regions**
   - Invest in targeted marketing and sales efforts in top-performing cities and countries (e.g., Butzbach, Germany).
   - Explore opportunities to improve sales in lower-performing regions like Poland and specific cities such as Szczytno.

4. **Optimize Drug Class Portfolio**
   - Focus on high-performing drug classes (e.g., Antipyretics) to maximize sales and profitability.
   - Reevaluate and potentially phase out lower-performing drug classes if they do not meet profitability targets.

5. **Enhance Sales Channel Strategies**
   - Strengthen relationships with hospitals, which account for the majority of sales (52.7%).
   - Explore opportunities to increase pharmacy sales by enhancing partnerships and promotional strategies.

6. **Tailor Sub-Channel Approaches**
   - Develop specialized strategies for different sub-channels such as Government, Private, and Institutional sectors to address their unique needs and maximize sales.
   - Consider offering tailored products or pricing strategies for each sub-channel.

7. **Recognize and Reward Top Sales Representatives and Teams**
   - Implement recognition and incentive programs for top-performing sales representatives like Jimmy G., Abigail T., and Sheila S.
   - Share best practices from top-performing teams to improve overall sales performance.

8. **Adjust Pricing Strategies Based on Product Class**
   - Use the average price per unit data to set competitive pricing strategies that reflect the value of each product class.
   - Consider adjusting prices for lower-performing classes to boost sales.

9. **Ensure Supply of Most Purchased Products**
   - Maintain adequate inventory levels of the most purchased products (e.g., Ionclotide, Tetratanyl) to meet demand.
   - Monitor trends in product quantities to anticipate and respond to changes in demand.

10. **Support High-Performing Managers**
    - Provide additional resources and support to managers overseeing the highest-performing sales teams, like Jimmy G. and Abigail T.
    - Encourage mentorship programs where top managers can share their strategies
