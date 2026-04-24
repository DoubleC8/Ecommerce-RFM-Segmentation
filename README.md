# E-Commerce: RFM Customer Segmentation & Targeted Marketing

## Executive Summary

Analyzed over 500,000 transaction records for a digital retail storefront to build a Recency, Frequency, Monetary (RFM) segmentation model. By engineering new metrics and classifying customers into distinct personas, this project provides a data-driven roadmap to optimize marketing spend, reduce churn, and maximize the lifetime value of high-rolling VIPs.

**[Tableau Dashboard](https://public.tableau.com/app/profile/chris.cortes2425/viz/E-CommerceCustomerSegmentationRFMAnalysis/Dashboard1)**

## The Business Problem

A retail brand specializing in modern streetwear, high-performance outerwear, and specialized pop-culture collectibles is wasting budget on generic, blast-all email campaigns. The marketing director needs to understand exactly who their core customers are. By segmenting the customer base based on actual purchasing behavior, the company can send tailored promotions (e.g., early access to specialized LEGO sets for VIPs, or discount codes on graphic apparel for At-Risk shoppers) to maximize ROI.

## Methodology & Skills

- **Data Engineering (Python/Pandas):** Scrubbed the transaction ledger by filtering out 'Guest' checkouts, removing negative quantities (canceled orders/returns), and engineering a `Total_Sales` monetary feature.
- **Diagnostic Analytics (SQL):** Utilized `COUNT(DISTINCT)` and date-math aggregations (`julianday`) to calculate base RFM scores. Wrapped the logic in a Common Table Expression (CTE) and applied a `CASE` statement to assign definitive marketing personas.
- **Data Visualization (Tableau):** Designed an interactive dashboard featuring a Tree Map for volume distribution, a horizontal bar chart for revenue dependency, and an RFM scatterplot matrix to visually prove the mathematical model.

## Key Insights

1. **The VIP Dependency:** While the 'VIP' segment makes up a smaller overall percentage of the total headcount, they generate a disproportionately massive share of the company's total revenue.
2. **The 'One-Time' Trap:** A significant portion of the customer base falls into the 'Lost' category (high recency, frequency of 1), indicating the store is excellent at initial acquisition but struggles heavily with post-purchase retention.
3. **Behavioral Clustering:** The RFM scatterplot visually confirms that customers who buy frequently also tend to have the most recent interactions, validating the strategy of targeting 'At-Risk' customers before their recency window completely closes.

## Strategic Recommendations

1. **VIP Loyalty Program:** Launch an exclusive tier for the VIP segment, offering early access to high-demand items (like limited-edition sneakers or exclusive Funko figures) rather than discount codes, as these customers are already highly price-insensitive.
2. **Re-Engagement Sequences:** Implement an automated "We Miss You" email sequence specifically triggered when a previously frequent buyer crosses the 150-day Recency threshold, offering a targeted discount on their favorite brand to prevent churn.
