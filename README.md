# Coffee-Shop-Sales-Analysis
# **Problem Statement**
Businesses often struggle to analyze key sales metrics such as total revenue, order counts, and quantities sold over time. Without proper analytical tools, it becomes difficult to:

- Track month-over-month performance  
- Identify trends across days, weeks, and store locations  
- Perform deep-dive analysis on product, store, and time-based performance  
- Visualize sales behavior dynamically  
- Make data-driven decisions  

To address these challenges, this project uses:

- **SQL** for data cleaning, transformation, and in-depth analytical querying (KPIs, product trends, store performance, time-based analysis).
- **Power BI** for interactive dashboards, visual insights, and advanced DAX-driven calculations.

 # **Project Objective:**
The objective of this project is to design and develop a comprehensive data analytics solution that enables businesses to:
 - Analyze and track monthly key performance indicators (KPIs) such as total sales, total orders, and total quantity sold.
 - Identify trends and month-over-month changes to support data-driven decision-making.
 - Provide dynamic and interactive visualizations, including calendar heatmaps, weekday/weekend performance comparisons, and sales analysis by store locations.
 -  Deliver actionable insights to optimize business strategies and improve overall performance.
This project focuses on creating an end-to-end data analytics dashboard that empowers organizations to gain a deeper understanding of their performance metrics. The dashboard will provide:



# **KPI Analysis:**
- Calculation of total sales, orders, and quantity sold for each month.
- Month-over-month comparisons to highlight increases or decreases in metrics.
- Detailed insights into changes between the selected month and the previous month.

# **🛢️ SQL Analysis**

## 🔹 SQL Analysis

All data cleaning, preprocessing, KPI calculations, and analytical queries were performed using SQL.  

### Key Operations
- **Data type corrections**: Converted `transaction_date` and `transaction_time` to proper DATE and TIME formats.  
- **Data cleaning**: Fixed column names and removed inconsistencies.  
- **KPI calculations**: Total Sales, Total Orders, Total Quantity.  
- **Month-over-Month (MoM) growth**: Calculated using window functions.  
- **Time-based analysis**: Daily, hourly, and weekday/weekend sales.  
- **Store-wise and product-wise breakdowns**: Including top 10 product performance.

### SQL Techniques Used
- **CASE statements** – Categorize sales, weekdays/weekends, above/below average days.  
- **Window functions (LAG, AVG)** – Month-over-month growth, average daily sales.  
- **Aggregation functions (SUM, COUNT, ROUND)** – Total sales, total orders, quantities.  
- **Date and time functions (DAY, MONTH, HOUR, DAYOFWEEK)** – Time-based analysis.  
- **Filtering using WHERE** – Focused on specific months, days, or hours.  
- **LIMIT** – Top-N product analysis.  
- **Subqueries** – For intermediate calculations like average daily sales comparison.


📄 **SQL File:**  
👉 [Click here to view the SQL Analysis](https://github.com/nehajade03/Coffee-Shop-Sales-Analysis-/blob/main/Coffee%20Shop%20Sales%20Analysis%20BY%20SQL.sql)


---
**Interactive Visualizations:**
- A calendar heatmap that dynamically adjusts based on the selected month, highlighting sales trends by day with tooltips displaying detailed metrics (sales, orders, and quantity).
  
- Segmentation of sales performance by weekdays and weekends to analyze behavioral patterns.
 
- Visualization of sales trends by store locations, including month-over-month differences to identify high- and low-performing locations.
  
By combining KPI analysis with dynamic and actionable visualizations, the project aims to enable businesses to uncover hidden trends, monitor their performance effectively, and make data-driven decisions to enhance operations and profitability.

# **Dataset Overview**

•	Duration: The data spans six months, from January 2023 to June 2023.
Dataset Size
•	Total Records: 149,116 rows, indicating a robust dataset with extensive transaction details.

•	Number of Attributes: 10 columns, each contributing valuable insights into different aspects of the transactions.

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

# **Data Visualizations** 
[Live Dashboard](https://www.novypro.com/profile_about/neha--jade?Popup=memberProject&Data=1737647449090x483840063660778700)


DashBoard

![image](https://github.com/user-attachments/assets/f6733e0c-8ff0-4824-b829-2e7a49997a87)

# **Interactive Features (Tooltip Section)**

Tooltips are a powerful interactive feature in the dashboard that significantly enhance the user experience. By hovering over visual elements, users can access detailed insights without navigating away from the main dashboard view.
•	Enhancing User Experience: Tooltips provide users with instant, context-specific details like daily or hourly breakdowns, saving time and reducing the need for multiple clicks.

![image](https://github.com/user-attachments/assets/7fa3dd05-0ffc-4f12-b1b2-545ce26f07c1)


![image](https://github.com/user-attachments/assets/bc06959a-0f24-4e66-a19d-e9e196876f97)

 # **Insights**
 
**Overall Sales Performance:**
- Total sales for May 2023: $157K, which represents a 31.8% increase compared to last month.
- Both total orders (33,527) and total quantity sold (48,233) show a 32.3% improvement vs. last month, indicating strong growth.

**Top Performing Product Categories:**
 - Coffee contributes the most sales at $60.36K, followed by Tea ($44.54K), with both showing a significant increase (+31.9% and +33.5%).
 - Bakery and Drinking Chocolate also show impressive growth (both over +30%).

**Product Type Trends:**
 - Barista Espresso ($20.42K) and Brewed Chai Tea ($17.43K) lead among individual product types.
 - Hot Chocolate ($16.32K) and Premium brewed coffee ($8.74K) also exhibit strong performance.

**Sales by Weekday/Weekend:**
- Majority of sales occurred on weekdays (74.19%), suggesting weekday-focused customer engagement.

**Store Location Analysis:**
- Hell’s Kitchen ($52.60K) is the top-performing store, showing a 30.5% sales growth compared to last month.
- Astoria and Lower Manhattan also performed well, with growth exceeding 32%.

**Sales by Hour/Day:**
- Peak sales hours occur in the morning and early afternoon (9 AM–2 PM), which aligns with typical coffee and snack purchase times.
- Sales are consistent throughout the week, with slightly lower activity on Sundays.

**Sales Trends:**
- Daily sales average around $5,056, with no drastic fluctuations but minor dips on weekends.

# **Recommendations**

**Focus on High-Performing Products:**
- Increase promotion of top products like Coffee, Tea, Barista Espresso, and Hot Chocolate through discounts, bundles, or loyalty programs to maintain momentum.
- Introduce seasonal or limited-time offers in the Bakery category to boost sales further.

**Boost Weekend Sales:**
- Develop weekend-specific promotions (e.g., "Weekend Happy Hours" or special combos) to drive more traffic during this slower period.
- Partner with local events to attract customers on weekends.

**Optimize Store Operations:**
- Hell’s Kitchen is a strong performer, but other locations like Astoria and Lower Manhattan show equally promising growth. Consider replicating successful strategies from Hell’s Kitchen in these areas.
- Staff peak hours (7AM– 12 PM) with additional resources to handle high demand efficiently.

**Targeted Marketing Campaigns:**
- Since weekdays drive most sales, focus digital advertising and email campaigns during those days.
- Utilize customer insights (from loyalty programs or surveys) to tailor product recommendations and upsell strategies.

**Introduce Evening Offerings:**
- With lower sales during evening hours, consider introducing special evening-themed beverages or snacks, such as herbal teas, desserts, or discounted coffee.

**Refine Data Analysis:**
- Drill down into customer preferences by combining product sales with customer demographics.
- Analyze specific reasons for the Sunday sales dip and target this day with a unique promotion (e.g., family discounts or kids’ menus).
 

