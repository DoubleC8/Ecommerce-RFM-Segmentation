-- Task 1: The High Rollers (Frequency & Monetary)
SELECT
    CustomerID, 
    COUNT(DISTINCT InvoiceNo) AS total_num_of_purchases, 
    SUM(Total_Sales) AS total_revenue_generated
FROM 
    retail_ledger
GROUP BY 
    CustomerID
ORDER BY 
    SUM(Total_Sales) DESC;
    
-- Task 2: Completing the RFM Base Table
SELECT
    CustomerID, 
    CAST(julianday('2011-12-10') - julianday(MAX(InvoiceDate)) AS INTEGER) AS Recency,
    COUNT(DISTINCT InvoiceNo) AS Frequency, 
    ROUND(SUM(Total_Sales), 2) AS Monetary
FROM 
    retail_ledger
GROUP BY 
    CustomerID
ORDER BY 
    Monetary DESC;

-- Task 3: The Segmentation (CTE)
WITH RFM_Base AS (
    SELECT
        CustomerID, 
        CAST(julianday('2011-12-10') - julianday(MAX(InvoiceDate)) AS INTEGER) AS Recency,
        COUNT(DISTINCT InvoiceNo) AS Frequency, 
        ROUND(SUM(Total_Sales), 2) AS Monetary
    FROM 
        retail_ledger
    GROUP BY 
        CustomerID
)
SELECT 
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    CASE
        WHEN Recency < 30 AND Frequency > 5 AND Monetary > 1000 THEN 'VIP'
        WHEN Recency >= 150 AND Frequency > 2 THEN 'At Risk (Previous Frequent Buyer)'
        WHEN Recency >= 200 AND Frequency = 1 THEN 'Lost (One-Time Buyer)'
        WHEN Recency < 30 AND Frequency = 1 THEN 'New Customer'
        ELSE 'Regular'
    END AS Customer_Segment
FROM 
    RFM_Base
ORDER BY 
    Monetary DESC;
