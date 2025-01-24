# Coffee-Shop-Sales-Analysis

# **Problem Statement**
Organizations often struggle to analyze and monitor key business metrics such as sales, orders, and quantities sold over time. Without effective tools, it becomes challenging to track month-over-month trends, identify performance variations, and derive actionable insights. Additionally, understanding sales patterns across weekdays, weekends, and store locations requires dynamic and interactive visualizations to support data-driven decision-making. The lack of these capabilities hinders efforts to optimize performance and respond proactively to changing business needs.

 # **Project Objective:**
The objective of this project is to design and develop a comprehensive data analytics solution that enables businesses to:
 - Analyze and track monthly key performance indicators (KPIs) such as total sales, total orders, and total quantity sold.
 - Identify trends and month-over-month changes to support data-driven decision-making.
 - Provide dynamic and interactive visualizations, including calendar heatmaps, weekday/weekend performance comparisons, and sales analysis by store locations.
 -  Deliver actionable insights to optimize business strategies and improve overall performance.

# **Overview:**
This project focuses on creating an end-to-end data analytics dashboard that empowers organizations to gain a deeper understanding of their performance metrics. The dashboard will provide:

**KPI Analysis:**
- Calculation of total sales, orders, and quantity sold for each month.
- Month-over-month comparisons to highlight increases or decreases in metrics.
- Detailed insights into changes between the selected month and the previous month.

**Interactive Visualizations:**
- A calendar heatmap that dynamically adjusts based on the selected month, highlighting sales trends by day with tooltips displaying detailed metrics (sales, orders, and quantity).
- Segmentation of sales performance by weekdays and weekends to analyze behavioral patterns.
- Visualization of sales trends by store locations, including month-over-month differences to identify high- and low-performing locations.
By combining KPI analysis with dynamic and actionable visualizations, the project aims to enable businesses to uncover hidden trends, monitor their performance effectively, and make data-driven decisions to enhance operations and profitability.
# **Dataset Overview**
Time Frame
•	Duration: The data spans six months, from January 2023 to June 2023.
Dataset Size
•	Total Records: 149,116 rows, indicating a robust dataset with extensive transaction details.
•	Number of Attributes: 11 columns, each contributing valuable insights into different aspects of the transactions.
•	Transaction ID: A unique code assigned to each transaction.
•	Transaction Date: The specific day when the transaction took place.
•	Transaction Time: The exact time the transaction occurred, allowing for time-based analysis.
•	Transaction Quantity: The number of items purchased in a transaction.
•	Unit Price: The price of a single item in the transaction.
•	Product ID: A unique identifier for each product.
•	Product Category: A broader grouping of products (e.g., apparel, electronics).
•	Product Type: A more specific sub-group within a category.
•	Product Detail: Additional information about the product, such as the brand or size.
•	Store ID: A unique code assigned to each store.
•	Store Location: The geographical location of the store (e.g., city or region).
# **Data modeling**
In this project, I designed and implemented a data model in Power BI that enhances sales analysis through the integration of a Date Table. This involved creating a custom Date Table and building relationships between it and the transactional data for advanced time-based insights.
Steps Taken:
1.	Creation of Date Table:
o	I manually created a new Date Table to ensure comprehensive time-based analysis. The Date Table includes the following columns:
-Year
- Month
- Day
- Day of the Week
- Weekday/weekend
- Month year 
# **DAX( (Data Analysis Expressions)**

DAX (Data Analysis Expressions) was used in this project to calculate key metrics like total sales, average transactions, and category-wise performance, enabling dynamic and actionable insights through Power BI visualizations.
DAX (Data Analysis Expressions) was used in this project to calculate key metrics like total sales, average transactions, and category-wise performance, enabling dynamic and actionable insights through Power BI visualizations.
Sales = 'Transactions'[unit_price] * 'Transactions'[transaction_qty]
Total Sales = sum('Transactions'[Sales])
Total Orders = DISTINCTCOUNT('Transactions'[transaction_id])
Total Quantity sold = sum(Transactions[transaction_qty])
CM Orders = VAR selected_month = SELECTEDVALUE('Date table'[Month])Return TOTALMTD (CALCULATE ([Total Orders],'Date table'[Month] = selected_month),'Date table'[Date])
CM Quantity = VAR selected_month = SELECTEDVALUE('Date table'[Month]) Return TOTALMTD(CALCULATE([Total Quantity sold],'Date table'[Month] = selected_month),'Date table'[Date])
CM Sale = VAR selected_month = SELECTEDVALUE('Date table'[Month]) Return 
  TOTALMTD(CALCULATE([Total Sales],'Date table'[Month] = selected_month),'Date table'[Date])

MoM Growth & Diff Quantity = 
Var month_diff = [CM Quantity]- [PM Quantity]
var mom = ([CM Quantity] -[PM Quantity])/[PM Quantity]
var _sign = IF(month_diff >0, "+", "")
VAR _sign_trend = IF(month_diff>0, "▲","▼" )
Return  _sign_trend & " " & _sign & FORMAT(mom, "#0.0%" & " | " & _sign &   format(month_diff/1000,"0.0K"))& " " & "vs LM" 

MoM Growth & Diff Sales = 
Var month_diff = [CM Sale]- [PM Sale]
var mom = ([CM Sale] -[PM Sale])/[PM Sale]
var _sign = IF(month_diff >0, "+", "")
VAR _sign_trend = IF(month_diff>0, "▲","▼" )
Return 
_sign_trend & " " & _sign & FORMAT(mom, "#0.0%" & " | " & _sign &   format(month_diff/1000,"0.0K"))& " " & "vs LM" 

New MoM of sales = 
Var month_diff = [CM Sale]- [PM Sale]
var mom = ([CM Sale] -[PM Sale])/[PM Sale]
var _sign = IF(month_diff >0, "+", "")
VAR _sign_trend = IF(month_diff>0, "▲","▼" )
Return 
_sign_trend & " " & _sign & FORMAT(mom, "#0.0%")

Interactive Features (Tooltip Section)
Tooltips are a powerful interactive feature in the dashboard that significantly enhance the user experience. By hovering over visual elements, users can access detailed insights without navigating away from the main dashboard view.
•	Enhancing User Experience: Tooltips provide users with instant, context-specific details like daily or hourly breakdowns, saving time and reducing the need for multiple clicks.
Tooltip for Hour and Day:
•	Purpose: Display insights at an hourly or daily level to show how performance varies throughout the day or specific days.
•	Example Insights:
Tooltip for Date-Wise Insights:
•	Purpose: Display detailed insights for a specific date, summarizing all activity on that day.
•	Example Insights:
o	Date Tooltip:
	Total Sales: $5,101 (for the date)
	Total Orders: 1,094 (for the date)
	Total Quantity Sold: 1,475 items (for the date)
Insights
1.	Overall Sales Performance:
o	Total sales for May 2023: $157K, which represents a 31.8% increase compared to last month.
o	Both total orders (33,527) and total quantity sold (48,233) show a 32.3% improvement vs. last month, indicating strong growth.
2.	Top Performing Product Categories:
o	Coffee contributes the most sales at $60.36K, followed by Tea ($44.54K), with both showing a significant increase (+31.9% and +33.5%).
o	Bakery and Drinking Chocolate also show impressive growth (both over +30%).
3.	Product Type Trends:
o	Barista Espresso ($20.42K) and Brewed Chai Tea ($17.43K) lead among individual product types.
o	Hot Chocolate ($16.32K) and Premium brewed coffee ($8.74K) also exhibit strong performance.
4.	Sales by Weekday/Weekend:
o	Majority of sales occurred on weekdays (74.19%), suggesting weekday-focused customer engagement.
5.	Store Location Analysis:
o	Hell’s Kitchen ($52.60K) is the top-performing store, showing a 30.5% sales growth compared to last month.
o	Astoria and Lower Manhattan also performed well, with growth exceeding 32%.
6.	Sales by Hour/Day:
o	Peak sales hours occur in the morning and early afternoon (9 AM–2 PM), which aligns with typical coffee and snack purchase times.
o	Sales are consistent throughout the week, with slightly lower activity on Sundays.
7.	Sales Trends:
o	Daily sales average around $5,056, with no drastic fluctuations but minor dips on weekends.
________________________________________
Recommendations
1.	Focus on High-Performing Products:
o	Increase promotion of top products like Coffee, Tea, Barista Espresso, and Hot Chocolate through discounts, bundles, or loyalty programs to maintain momentum.
o	Introduce seasonal or limited-time offers in the Bakery category to boost sales further.
2.	Boost Weekend Sales:
o	Develop weekend-specific promotions (e.g., "Weekend Happy Hours" or special combos) to drive more traffic during this slower period.
o	Partner with local events to attract customers on weekends.
3.	Optimize Store Operations:
o	Hell’s Kitchen is a strong performer, but other locations like Astoria and Lower Manhattan show equally promising growth. Consider replicating successful strategies from Hell’s Kitchen in these areas.
o	Staff peak hours (9 AM–2 PM) with additional resources to handle high demand efficiently.
4.	Targeted Marketing Campaigns:
o	Since weekdays drive most sales, focus digital advertising and email campaigns during those days.
o	Utilize customer insights (from loyalty programs or surveys) to tailor product recommendations and upsell strategies.
5.	Introduce Evening Offerings:
o	With lower sales during evening hours, consider introducing special evening-themed beverages or snacks, such as herbal teas, desserts, or discounted coffee.
6.	Refine Data Analysis:
o	Drill down into customer preferences by combining product sales with customer demographics.
o	Analyze specific reasons for the Sunday sales dip and target this day with a unique promotion (e.g., family discounts or kids’ menus).
 

