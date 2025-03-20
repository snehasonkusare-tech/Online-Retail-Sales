Show Databases;
create database sales_data;
SELECT User();

use sales_data;
show tables;
select * from sales_data;

alter Table sales_data Change Column `Total Revenue` TotalRevenue Decimal(15,2);

#Identifying top-selling products;
Select Description,Sum(Quantity) as TotalSold ,Sum('Total Revenue') as Revenue
from sales_data
group by Description
Order by Revenue Desc
Limit 10;

# analyse customer Purchase behaviour
Select CustomerID, Count(InvoiceNo) As PurchaseFrequency, Sum(UnitPrice) 
from sales_data
group by CustomerID
order by Sum(UnitPrice) desc
limit 10;

#monthly revenue trends
select date_format(InvoiceDate,'%Y-%m') as Month,Sum(TotalRevenue) as MonthlyRevenue
from sales_data
group by Month
Order by Month;

#top 10 Products by revenue
Select Description,
Sum(Quantity) as TotalQuantitySold,
Sum(TotalRevenue) as TotalRevenue
From sales_data
Group By Description
Order By totalRevenue Desc
limit 10;

#top 10 products by quantity
Select Description,Sum(Quantity) as TotalQuantitySold
From sales_data
group by Description
Order by totalQuantitySold Desc
limit 10

#top 10 Customer by spending
select CustomerID, Sum(TotalRevenue) as TotalSpent
from sales_data
Group by CustomerID
Order By TotalSpent Desc
Limit 10;

#country level Revenue
Select Country,
Sum(totalRevenue) as TotalRevenue,
count(Distinct CustomerID) as UniqueCustomer
From Sales_data
group by Country
Order By TotalRevenue Desc;

#Average profit margin by product
SELECT Description,
       AVG(ProfitMargin) AS AvgProfitMargin
FROM sales_data
GROUP BY Description
ORDER BY AvgProfitMargin DESC
LIMIT 10;

#identifying slow moving products
SELECT Description,
       SUM(Quantity) AS TotalQuantitySold,
       SUM(TotalRevenue) AS TotalRevenue
FROM sales_data
GROUP BY Description
ORDER BY TotalRevenue ASC
LIMIT 10;
