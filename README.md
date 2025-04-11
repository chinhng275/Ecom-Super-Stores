<h1 align="center">Super Store Sales Dashboard - Power BI Project</h>
<div align="center"><img src="https://github.com/user-attachments/assets/f7111d1a-3694-4ee9-991c-b55d59bc0ebe"></div>

## Overview
The E-commerce Super Store Sales Analysis project is a comprehensive analysis of sales performance, customer behavior, and operational metrics for a super store chain from 2016 to 2018. The project leverages SQL queries to extract and transform data from a relational database and uses Power BI to visualize the results in an interactive dashboard. This combination enables stakeholders to gain actionable insights into sales trends, customer satisfaction, payment patterns, seller performance, and geographical revenue distribution, facilitating data-driven decision-making to optimize business strategies.

## Purpose
The primary goal of this project is to:
- Extract meaningful insights from the super store dataset using SQL queries.
- Visualize sales trends, customer behavior, and operational metrics in Power BI.
- Identify top-performing cities, categories, and sellers to optimize business strategies.
- Analyze customer satisfaction through review scores and payment patterns.
- Provide a geographical overview of revenue distribution across cities and states.

## Data Source
The dataset includes sales transactions, customer reviews, delivery details, and product category information for the super store from 2016 to 2018. Key metrics include total orders, total sales value, customer IDs, product categories, review scores, and delivery statuses.

## SQL Queries for Data Extraction
The project uses several SQL queries to extract and transform data for analysis. Below is a summary of each query and its purpose:

Q1: Customer Purchase Trend Year-on-Year
This query extracts the number of delivered orders per month, broken down by year (2016, 2017, 2018), to analyze year-on-year purchase trends. It converts month numbers to names (e.g., '1' to 'Jan') and filters for orders with a 'delivered' status.

Q2: Top 10 Cities with Highest Revenue (2016–2018)
This query calculates the total revenue (payment_value) and number of orders per city, ranking the top 10 cities by total revenue, including their states. It filters for delivered orders.

Q3: Extract Payment Value by Day and Month
This query calculates the total payment value and number of orders per day and per month to track sales performance over time. It ensures non-null payment values for daily analysis.

Q4: Average Review Score by Month
This query computes the average review score per month to analyze customer satisfaction trends over time.

Q5: Customers Using Only Boleto Payment Type
This query identifies customers who exclusively use the 'boleto' payment type, excluding those who have used other payment methods.

Q6: Top Average Review Score by Category
This query calculates the average review score for each product category, sorting the results to identify the highest-rated categories.

Q7: Top Payment Value by Category
This query computes the total payment value for each product category, sorting the results to identify the top revenue-generating categories.

Q9: Seller with the Most Products Sold
This query identifies sellers who sold the most products by counting distinct orders per seller, including details like product category, seller city, and state.

## Power BI Dashboard
The extracted data from the SQL queries is visualized in a Power BI dashboard, which consists of three pages:

### Page 1: Customer and Revenue Insights
- Top Customer by Average Payment (Table)
- Lists customers by their average payment amount and total orders.

Key Insight: Customer "0da9212..." has the highest average payment (13,664.08) with 100 orders, while most customers average around 3,000–7,000. The total average payment across all customers is 14,732.85.

- Customer Purchase Trend Year-on-Year (Area Chart)
- Compares monthly purchase trends for 2016 (red), 2017 (green), and 2018 (yellow).

Key Insight: Purchases peaked in 2017 (around 8.3K in August) but declined in 2018, stabilizing around 4.5K–7.2K.

- Top 10 States with Highest Revenue (2016–2018) (Horizontal Bar Chart)
- Ranks states by total revenue generated.

Key Insight: SP leads with the highest revenue, followed by MG, RJ, and PR. States like AM and AP have the lowest revenue.

- Revenue by State (Horizontal Bar Chart)
- Displays revenue distribution across states for 2016 (red), 2017 (green), and 2018 (yellow).

Key Insight: SP consistently generates the highest revenue across all years, with a noticeable increase in 2017.

- State Map (Geographical Map)
- Visualizes revenue distribution across states on a world map.

Key Insight: Most revenue is concentrated in South America, particularly Brazil, with states like SP and MG being the top contributors.

![Demo 1](https://github.com/user-attachments/assets/2d93f6d9-5fd6-433e-a3ea-b91df58bac26)


### Page 2: Customer and Operational Insights
- Average Review Score by Customer (Line Chart)
- Compares average review scores across months for 2016 (red), 2017 (green), and 2018 (yellow).

Key Insight: Review scores dropped significantly in 2017 (down to 2.3 in March) but recovered in 2018, stabilizing around 4.1.

- Top Seller by Number of Orders (Table)
- Lists the top sellers by the number of orders they fulfilled.

Key Insight: Seller ID "6560211a..." leads with 1,982 orders, followed by "4a3ca931..." with 1,789 orders.

- Review Score on Category (Table)
- Shows the average review score for each product category.

Key Insight: "cds_dvds_musicals" has the highest average review score (4.64), while "computers_accessories" scores the lowest (3.93).

- Delivery Success Rate by Customer State (Stacked Bar Chart)
- Displays delivery success (blue), failure (red), delivered (yellow), and not delivered (orange) rates across customer states for 2016, 2017, and 2018.

Key Insight: Delivery success rates are generally high across states, with minimal failures. States like SP and MG show consistent delivery performance.

![Demo 2](https://github.com/user-attachments/assets/0745ca2e-ae6a-4682-9be8-9b92443f521e)

### Page 3: Sales and Category Insights
- Total Order and Total Value by Day (Line Chart)
- Displays daily trends for total orders (yellow) and total sales value (purple) from September 2016 to October 2017.

Key Insight: Sales value peaked around late 2016 and early 2017, with a noticeable spike in orders around the same period.

- Total Order and Total Value by Month (Histogram with Line Overlay)
- Shows monthly trends for total orders (yellow bars) and total sales value (purple line) from September 2016 to October 2018.

Key Insight: Both orders and sales value saw significant growth in late 2017, peaking around November 2017, followed by a decline in 2018.

- Total Value by Category (Horizontal Bar Chart)
- Ranks product categories by total sales value.

Key Insight: "bed_bath_table" leads with 3,425.11K in sales, followed by "health_beauty" (3,313K) and "computers_accessories" (3,170.66K). Categories like "home_appliances" and "agro_industry_and_commerce" have the lowest sales.

![Demo 3](https://github.com/user-attachments/assets/7a4da99a-c334-4933-bf8b-f8610d3659dd)

## Key Insights
- Sales Trends: Sales and orders peaked in late 2017, likely due to seasonal demand (e.g., holiday season), but declined in 2018, indicating a potential need for new marketing strategies.
- Product Categories: "bed_bath_table" and "health_beauty" are the top revenue-generating categories, while "computers_accessories" has the lowest customer satisfaction (review score of 3.93).
- Customer Satisfaction: Review scores dropped in 2017 but improved in 2018, suggesting improvements in product quality or service.
- Delivery Performance: Delivery success rates are high across all states, with minimal failures, indicating strong logistics operations.
- Geographical Performance: SP and MG are the top revenue-generating states, highlighting the importance of focusing marketing efforts in these regions.
- Customer Spending: High-value customers (e.g., "0da9212...") contribute significantly to revenue, indicating potential for targeted loyalty programs.

## Future Enhancements
- Add predictive analytics to forecast future sales trends.
- Include customer segmentation to identify high-value customer groups.
- Integrate real-time data for more up-to-date insights.
- Expand geographical analysis to include international markets.
- Analyze the impact of payment types (e.g., boleto) on customer retention.
