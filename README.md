# Online Retail Sales Analysis

## Project Overview
This project focuses on analyzing an online retail sales dataset. The objective is to clean the data using Python, store it in MySQL, and perform SQL queries to extract meaningful business insights. The analysis helps in understanding sales trends, customer behavior, and product performance.

## Technologies Used
- **Python** (for data cleaning and preprocessing)
- **MySQL Workbench** (for database management and query execution)
- **Pandas, NumPy** (for data handling in Python)
- **Matplotlib, Seaborn** (for visualization)
- **SQL** (for data analysis and reporting)

## Dataset Description
The dataset consists of transactions from an online retail store and includes the following key columns:
- **InvoiceNo**: Unique transaction ID
- **StockCode**: Product code
- **Description**: Product name
- **Quantity**: Number of products purchased
- **InvoiceDate**: Date and time of purchase
- **UnitPrice**: Price per unit of product
- **CustomerID**: Unique identifier for each customer
- **Country**: Country where the purchase was made

## Project Workflow
### 1. Data Cleaning in Python
- **Handling Missing Values**: Removed rows with missing `CustomerID` values.
- **Removing Duplicates**: Identified and dropped duplicate records.
- **Filtering Invalid Entries**: Removed transactions with negative or zero quantity/price.
- **Data Type Conversion**: Converted `InvoiceDate` to datetime format.
- **Creating Total Revenue Column**: Added a column `TotalRevenue = Quantity * UnitPrice`.

### 2. Storing Cleaned Data in MySQL
- Created a database `retail_sales_db`.
- Created a table `sales_data` with appropriate data types.
- Inserted the cleaned data from Python into MySQL using `SQLAlchemy` and `pymysql`.

### 3. SQL Queries for Analysis
#### a) Monthly Revenue Trend
```sql
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       SUM(TotalRevenue) AS MonthlyRevenue
FROM sales_data
GROUP BY Month
ORDER BY Month;
```
_**Insight:** Identifies sales performance over time._

#### b) Top 10 Products by Revenue
```sql
SELECT Description,
       SUM(Quantity) AS TotalQuantitySold,
       SUM(TotalRevenue) AS TotalRevenue
FROM sales_data
GROUP BY Description
ORDER BY TotalRevenue DESC
LIMIT 10;
```
_**Insight:** Identifies the best-selling products by revenue._

#### c) Top 10 Customers by Spending
```sql
SELECT CustomerID,
       SUM(TotalRevenue) AS TotalSpent
FROM sales_data
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;
```
_**Insight:** Finds the most valuable customers._

#### d) Country-Level Revenue
```sql
SELECT Country,
       SUM(TotalRevenue) AS TotalRevenue,
       COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM sales_data
GROUP BY Country
ORDER BY TotalRevenue DESC;
```
_**Insight:** Highlights sales distribution across different countries._

#### e) Identify Slow-Moving Products
```sql
SELECT Description,
       SUM(Quantity) AS TotalQuantitySold,
       SUM(TotalRevenue) AS TotalRevenue
FROM sales_data
GROUP BY Description
ORDER BY TotalRevenue ASC
LIMIT 10;
```
_**Insight:** Helps identify products with low sales._

## Advanced Features
- **Data Visualization**: Created bar charts, line charts, and heatmaps using Python for deeper insights.
- **Automated Reporting**: Scheduled queries to generate sales reports periodically.
- **Customer Segmentation**: Used clustering techniques to segment customers based on spending patterns.

## How to Run the Project
### 1. Prerequisites
- Install Python and required libraries (`pip install pandas numpy matplotlib seaborn sqlalchemy pymysql`)
- Set up MySQL and create the `retail_sales_db` database

### 2. Run Data Cleaning Script
```bash
python data_cleaning.py
```
_This script cleans the raw dataset and exports it as a CSV._

### 3. Load Data into MySQL
```bash
python load_data_to_mysql.py
```
_This script connects to MySQL and inserts the cleaned data._

### 4. Execute SQL Queries in MySQL Workbench
Run the provided SQL queries to analyze sales data.

## Future Enhancements
- **Machine Learning Models**: Predict customer churn and product demand.
- **Dashboard Integration**: Create an interactive dashboard using Power BI or Tableau.
- **ETL Pipeline**: Automate data extraction, transformation, and loading (ETL) with Apache Airflow.

## Conclusion
This project provides valuable insights into online retail sales, helping businesses make data-driven decisions. By leveraging Python for data cleaning and SQL for querying, we can efficiently analyze large datasets and derive meaningful patterns.

