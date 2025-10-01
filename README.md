Coffee Shop Sales Dashboard Project
Project Overview

This project is an end-to-end Coffee Shop Sales analysis using MySQL and Power BI. The goal of the project is to analyze the sales data of a coffee shop and create an interactive dashboard that provides insights on total sales, orders, quantity sold, month-on-month growth, product category performance, and daily/hourly sales trends.

MySQL Steps

A database named coffee_shop_sales was created in MySQL Workbench. The raw Excel file containing the sales transactions was first converted into a CSV file with UTF-8 encoding because MySQL Workbench does not support importing XLSX files directly. The CSV file was imported into the database using the Table Data Import Wizard. The table created for the transactions was named coffee_shop. The import process took approximately 10 to 20 minutes, and the total records imported were 149,116.

SQL queries were executed to calculate key business metrics. Queries included calculating total sales, total orders, and total quantity sold for each month. Window functions such as LAG were used to calculate month-on-month growth percentages. Functions including SUM, ROUND, MONTH, and GROUP BY were used to aggregate and analyze the data.

Power BI Steps

In Power BI, the same CSV file named transaction was loaded to create the dashboard. A new date table was created with nine columns: date, month, month number, month-year, day name, week number, day number, weekday number, and weekday/weekend. Relationships were created between the transaction table and the date table using the transaction_date field.

Multiple measures were created in Power BI including total sales, total quantity sold, total orders, current month orders, sales, quantity sold, previous month orders, sales, quantity sold, month-on-month growth, and differences for total sales, orders, and quantity sold. Additional measures were created for color bars, hours, product category type, product category label, and labels for product type and category.

Dashboard Design

The report was designed with a coffee-related background image. Visualizations and charts include:

Calendar heatmap to dynamically represent daily sales.

Sales analysis segmented by weekdays and weekends.

Store location analysis.

Daily sales with average line.

Sales analysis by product category.

Top 10 products by sales.

Sales patterns by day and hour.

Separate pages were created for tooltips to provide detailed metrics when hovering over specific visuals.

Project Outcome

This project demonstrates hands-on skills in MySQL for data preparation and query analysis, and in Power BI for building interactive dashboards with DAX measures, modeling, and visualization. It provides actionable insights into sales trends, product performance, and business growth opportunities.
