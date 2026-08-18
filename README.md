# Tech-Mahindra-Stock-Analysis-Executive-Overview-SQL-Power-BI

## Executive Dashboard

Exploratory analysis of Tech Mahindra historical stock-market data using **PostgreSQL, SQL, and Power BI**.

![Tech Mahindra Stock Analysis Dashboard](screenshots/tech-mahindra-dashboard.png)

---

## Project Overview

This project analyzes historical stock-market data for **Tech Mahindra** to understand price performance, trading activity, volatility, and time-based market trends.

The analysis combines **PostgreSQL/SQL for data analysis** with **Power BI for interactive visualization and dashboard development**.

The project moves from raw market data to:

**Data → SQL Analysis → KPIs → Trend Analysis → Power BI Dashboard → Business Insights**

The objective is not to provide investment advice, but to demonstrate how SQL and business intelligence tools can be used to analyze financial data and communicate findings clearly.

---

# Business Problem

Historical stock-market datasets contain multiple measures such as:

- Opening price
- Closing price
- High and low prices
- Previous closing price
- VWAP
- Trading volume
- Number of trades
- 52-week high and low

Looking at individual records makes it difficult to identify broader trends.

The analysis therefore focuses on answering questions such as:

- How did Tech Mahindra's closing price change over the period?
- What were the highest and lowest closing prices?
- Which months had stronger or weaker average closing prices?
- Which quarters recorded the highest trading activity?
- When did the largest price movements occur?
- When did trading volume spike?
- Does higher trading activity consistently occur alongside higher prices?
- How did the stock recover after its early-2026 decline?

---

# Objectives

The main objectives of the project were to:

1. Analyze Tech Mahindra's historical closing-price performance.
2. Identify the highest and lowest closing prices.
3. Measure average closing price.
4. Analyze daily price movements and intraday ranges.
5. Analyze trading-volume patterns.
6. Compare monthly and quarterly performance.
7. Identify periods of unusually high trading activity.
8. Apply SQL aggregation and window functions to financial data.
9. Build an interactive Power BI executive dashboard.
10. Convert numerical analysis into clear business insights.

---

# Dataset

## Data Source

**NSC** — as specified for this project.

The dataset was stored/analyzed using **PostgreSQL**.

## Dataset Coverage

| Attribute | Details |
|---|---|
| Company | Tech Mahindra |
| Records | 246 |
| Columns | 17 |
| Start Date | 2025-08-01 |
| End Date | 2026-07-31 |
| Currency | Indian Rupee (INR) |
| Trading Series | EQ |

The dataset contains one record per trading day across the analyzed period.

---

# Dataset Fields

The dataset contains the following fields:

| Field | Description |
|---|---|
| DATE | Trading date |
| DAY | Day of the week |
| MONTH | Trading month |
| QUARTER | Calendar quarter |
| YEAR | Trading year |
| SERIES | Trading series |
| OPEN | Opening price |
| HIGH | Highest price during the trading day |
| LOW | Lowest price during the trading day |
| PREV. CLOSE | Previous trading day's closing price |
| LTP | Last traded price |
| CLOSE | Closing price |
| VWAP | Volume Weighted Average Price |
| 52W H | 52-week high |
| 52W L | 52-week low |
| VOLUME | Number of shares traded |
| NO. OF TRADES | Number of trades |

---

# Data Quality Checks

Before analysis, the supplied dataset was checked for basic structural issues.

| Check | Result |
|---|---|
| Total Records | 246 |
| Total Columns | 17 |
| Missing Values | 0 |
| Duplicate Rows | 0 |
| Duplicate Trading Dates | 0 |

The supplied CSV therefore contains a complete set of records for the fields analyzed, with no missing values or duplicate rows detected.

---

# Tools & Technologies

- **PostgreSQL**
- **SQL**
- **Power BI**
- **Excel** for supporting data handling
- **DAX / Power BI calculations** where applicable to the dashboard

---

# Data Preparation

The dataset was prepared for analytical use by working with the existing structured market fields.

The workflow included:

1. Loading the stock data into PostgreSQL.
2. Reviewing the structure and available fields.
3. Validating the date and numeric fields.
4. Checking for missing values and duplicate records.
5. Creating time-based groupings such as month and quarter.
6. Calculating price differences.
7. Calculating trading-volume metrics.
8. Applying aggregate functions for KPI calculations.
9. Using SQL window functions for sequential analysis.
10. Connecting the analytical results to Power BI for visualization.

---

# SQL Analysis

The project uses SQL to perform both descriptive and analytical queries.

## Basic Analysis

The analysis includes:

- Maximum closing price
- Minimum closing price
- Average closing price
- Maximum trading volume
- Average trading volume
- Maximum VWAP
- Minimum VWAP
- Highest number of trades
- Daily price movement
- Monthly averages
- Quarterly averages

---

# Advanced SQL Analysis

The project also applies advanced SQL techniques including:

- `GROUP BY`
- `ORDER BY`
- Aggregate functions
- `CASE`
- `RANK()`
- `ROW_NUMBER()`
- `DENSE_RANK()`
- `LAG()`
- `LEAD()`
- `OVER()`
- CTEs
- Running totals
- Moving averages

These techniques allow the analysis to move beyond simple summaries into time-series and comparative analysis.

---

# Key KPIs

| KPI | Value | Business Meaning |
|---|---:|---|
| Highest Closing Price | ₹1,768.40 | Highest daily closing price in the dataset |
| Lowest Closing Price | ₹1,331.70 | Lowest daily closing price in the dataset |
| Average Closing Price | ₹1,492.98 | Average closing price across 246 trading records |
| Highest Trading Volume | 11.67M | Largest single-day trading volume |
| Average Trading Volume | 2.19M | Average daily trading volume |
| Highest VWAP | ₹1,759.86 | Highest volume-weighted average price |
| Highest Number of Trades | 311,306 | Highest recorded number of trades |

---

# Key Findings

## 1. The stock reached its highest closing price in January 2026

The highest closing price in the dataset was:

**₹1,768.40 on 29 January 2026.**

January also recorded the highest monthly average closing price:

**₹1,657.76.**

### Business Interpretation

The beginning of 2026 represented the strongest price period in the dataset based on closing-price levels.

---

# 2. The stock experienced a significant correction after the January peak

The stock reached a closing peak of **₹1,768.40** on 29 January 2026.

It subsequently reached its lowest closing price of:

**₹1,331.70 on 6 March 2026.**

This represents a decline of approximately:

**24.7% from the January closing peak to the March closing low.**

### Business Interpretation

The period between late January and early March represents the most significant downward movement in the analyzed period.

This is an important period for further investigation if additional market or company-level information is available.

---

# 3. The stock recovered after the March low

After reaching the closing low of **₹1,331.70**, the stock ended the dataset period at:

**₹1,651.30 on 31 July 2026.**

That represents an approximately:

**24.0% recovery from the March closing low.**

The July monthly average closing price was:

**₹1,518.76.**

### Business Interpretation

The data shows a substantial recovery from the March trough, although the July-end closing price remained below the January peak.

---

# 4. July recorded the highest monthly trading volume

July recorded total trading volume of:

**65.06 million shares.**

This was the highest monthly trading volume among the months in the dataset.

July also had the highest average daily trading volume:

**2.83 million shares per trading day.**

### Business Interpretation

Trading activity was particularly high during July.

However, high trading activity should not automatically be interpreted as positive price performance.

---

# 5. The largest single-day volume occurred in April

The highest daily trading volume was:

**11,668,801 shares on 22 April 2026.**

On that day:

- Open: ₹1,463.40
- High: ₹1,502.80
- Low: ₹1,404.10
- Close: ₹1,462.60
- VWAP: ₹1,452.85

### Business Interpretation

The volume spike occurred during a period when the stock was trading well below its January peak.

This demonstrates why trading volume should be analyzed together with price rather than treated as a standalone indicator.

---

# 6. Q2 had the highest quarterly trading volume

| Quarter | Average Closing Price | Total Trading Volume |
|---|---:|---:|
| Q1 | ₹1,523.09 | 141.37M |
| Q2 | ₹1,449.67 | 152.67M |
| Q3 | ₹1,501.44 | 136.05M |
| Q4 | ₹1,497.03 | 108.85M |

Q2 recorded the highest total trading volume at:

**152.67 million shares.**

At the same time, Q2 had the lowest average closing price:

**₹1,449.67.**

### Business Interpretation

The quarter with the highest trading activity did not have the highest average price.

This is an important analytical finding: **higher volume does not necessarily mean higher price levels.**

---

# 7. The largest intraday price range occurred on 3 February 2026

The largest High-Low range was:

**₹141.30**

on **3 February 2026**.

The stock traded between:

- High: ₹1,854.00
- Low: ₹1,712.70

The intraday range represented approximately **8.23% of the closing price**.

### Business Interpretation

This was one of the most volatile trading sessions in the dataset.

It occurred shortly after the stock's January closing-price peak, making this period particularly important for volatility analysis.

---

# 8. The largest positive daily closing-price movement occurred on 16 January 2026

The largest increase in closing price versus the previous trading day was:

**₹82.00**

on **16 January 2026**.

The stock moved from a previous close of approximately ₹1,588.50 to a close of ₹1,670.50.

This represented approximately a:

**5.16% daily increase.**

### Business Interpretation

This was the strongest positive day-to-day closing-price movement identified in the dataset.

---

# 9. Trading volume and closing price were not strongly correlated

An additional statistical check was performed on the supplied dataset.

The Pearson correlation between:

**Closing Price ↔ Trading Volume**

was approximately:

**-0.009**

This is effectively a near-zero linear relationship within this dataset.

### Business Interpretation

The data does **not** support the statement that higher trading volume consistently drove higher closing prices.

This is an important distinction between:

**Observed market activity**

and

**causal conclusions**.

Correlation alone cannot establish causation.

---

# 10. July showed a stronger recovery in both price and trading activity

The monthly average closing price increased from:

**₹1,434.36 in May**

to:

**₹1,461.82 in June**

and then:

**₹1,518.76 in July.**

At the same time, July recorded the highest monthly trading volume:

**65.06M shares.**

### Business Interpretation

The July period combined a stronger monthly average closing price with elevated trading activity.

This is a more defensible statement than claiming that trading volume caused the price recovery.

---

# Monthly Analysis

| Month | Average Close | Total Volume |
|---|---:|---:|
| January | ₹1,657.76 | 43.79M |
| February | ₹1,542.20 | 54.64M |
| March | ₹1,360.22 | 42.94M |
| April | ₹1,451.45 | 53.08M |
| May | ₹1,434.36 | 43.36M |
| June | ₹1,461.82 | 56.24M |
| July | ₹1,518.76 | 65.06M |
| August | ₹1,490.98 | 31.64M |
| September | ₹1,492.37 | 39.35M |
| October | ₹1,447.47 | 33.83M |
| November | ₹1,449.73 | 44.28M |
| December | ₹1,585.20 | 30.73M |

---

# Quarterly Analysis

| Quarter | Average Close | Total Volume |
|---|---:|---:|
| Q1 | ₹1,523.09 | 141.37M |
| Q2 | ₹1,449.67 | 152.67M |
| Q3 | ₹1,501.44 | 136.05M |
| Q4 | ₹1,497.03 | 108.85M |

### Key observation

Q1 had the highest average closing price, while Q2 had the highest total trading volume.

This shows that price performance and trading activity followed different patterns during the year.

---

# Price Trend

The overall price path can be summarized as:

```text
Aug 2025
₹1,438.80
     ↓
Late 2025 recovery
     ↓
Jan 2026
₹1,768.40 peak close
     ↓
Feb–Mar correction
     ↓
Mar 2026
₹1,331.70 low close
     ↓
Apr–Jul recovery
     ↓
Jul 2026
₹1,651.30 final close
