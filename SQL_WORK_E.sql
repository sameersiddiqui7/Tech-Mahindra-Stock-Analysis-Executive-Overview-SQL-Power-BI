CREATE TABLE stock_data (
    trade_date DATE,
    day_name VARCHAR(20),
    month_name VARCHAR(20),
    quarter VARCHAR(5),
    year_no INTEGER,
    series VARCHAR(10),
    open_price NUMERIC(10,2),
    high_price NUMERIC(10,2),
    low_price NUMERIC(10,2),
    prev_close NUMERIC(10,2),
    ltp NUMERIC(10,2),
    close_price NUMERIC(10,2),
    vwap NUMERIC(10,2),
    high_52w NUMERIC(10,2),
    low_52w NUMERIC(10,2),
    volume BIGINT,
    no_of_trades BIGINT
);

DROP TABLE stock_data;

CREATE TABLE stock_data (
    "DATE" DATE,
    "DAY" VARCHAR(20),
    "MONTH" VARCHAR(20),
    "QUARTER" VARCHAR(5),
    "YEAR" INTEGER,
    "SERIES" VARCHAR(10),
    "OPEN" NUMERIC(10,2),
    "HIGH" NUMERIC(10,2),
    "LOW" NUMERIC(10,2),
    "PREV. CLOSE" NUMERIC(10,2),
    "LTP" NUMERIC(10,2),
    "CLOSE" NUMERIC(10,2),
    "VWAP" NUMERIC(10,2),
    "52W H" NUMERIC(10,2),
    "52W L" NUMERIC(10,2),
    "VOLUME" BIGINT,
    "NO. OF TRADES" BIGINT
);

SELECT *
FROM stock_data;

ALTER TABLE stock_data
ALTER COLUMN "VOLUME"
TYPE NUMERIC(20,2);

ALTER TABLE stock_data
ALTER COLUMN "NO. OF TRADES"
TYPE NUMERIC(20,2);

SELECT *
FROM stock_data;

SELECT COUNT(*)
FROM stock_data;

SELECT *
FROM stock_data
LIMIT 10;

SELECT COUNT(*) AS total_records   
FROM stock_data;



/*=========================================================
PROJECT : TECH MAHINDRA STOCK ANALYSIS
DATABASE: stock_analysis
TABLE   : stock_data
=========================================================*/

/*=========================================================
QUERY 01: TOTAL RECORD COUNT
PURPOSE  : Verify the total number of records.
=========================================================*/

SELECT
    COUNT(*) AS total_records
FROM stock_data;


/*=========================================================
QUERY 02: TABLE STRUCTURE
PURPOSE  : Display all columns and their data types.
=========================================================*/

SELECT
    *
FROM stock_data
LIMIT 5;


/*=========================================================
QUERY 03: DUPLICATE RECORD CHECK
PURPOSE  : Identify duplicate trading dates.
=========================================================*/

SELECT
    "DATE",
    COUNT(*) AS duplicate_count
FROM stock_data
GROUP BY "DATE"
HAVING COUNT(*) > 1;


/*=========================================================
QUERY 04: NULL VALUE CHECK
PURPOSE  : Identify missing values.
=========================================================*/

SELECT
    COUNT(*) - COUNT("DATE") AS missing_date,
    COUNT(*) - COUNT("OPEN") AS missing_open,
    COUNT(*) - COUNT("HIGH") AS missing_high,
    COUNT(*) - COUNT("LOW") AS missing_low,
    COUNT(*) - COUNT("CLOSE") AS missing_close,
    COUNT(*) - COUNT("VOLUME") AS missing_volume
FROM stock_data;


/*=========================================================
QUERY 06: CONSISTENCY CHECK
PURPOSE  : Verify the HIGH and LOW columns.
=========================================================*/

SELECT *
FROM stock_data
WHERE "HIGH" < "LOW";


/*=========================================================
QUERY 07: NEGATIVE VALUE CHECK
PURPOSE  : Identify invalid values.
=========================================================*/

SELECT *
FROM stock_data
WHERE "OPEN" < 0
   OR "HIGH" < 0
   OR "LOW" < 0
   OR "CLOSE" < 0;


/*=========================================================
QUERY 08: ZERO VALUE CHECK
PURPOSE  : Identify unexpected values.
=========================================================*/

SELECT *
FROM stock_data
WHERE "VOLUME" = 0;


/*=========================================================
QUERY 01: CREATE A BACKUP TABLE
PURPOSE  : Create a backup before cleaning the data.
=========================================================*/

CREATE TABLE stock_data_backup AS

SELECT *
FROM stock_data;


/*=========================================================
QUERY 02: VERIFY THE BACKUP TABLE
PURPOSE  : Verify that the backup was created successfully.
=========================================================*/

SELECT COUNT(*)
FROM stock_data_backup;


/*=========================================================
QUERY 02: VERIFY THE BACKUP TABLE
PURPOSE  : Verify that the backup was created successfully.
=========================================================*/

SELECT COUNT(*)
FROM stock_data_backup;


/*=========================================================
QUERY 04: NULL VALUE CHECK
PURPOSE  : Identify missing values.
=========================================================*/

SELECT *
FROM stock_data
WHERE "OPEN" IS NULL
   OR "HIGH" IS NULL
   OR "LOW" IS NULL
   OR "CLOSE" IS NULL;


/*=========================================================
QUERY 05: INVALID VALUE CHECK
PURPOSE  : Identify incorrect price values.
=========================================================*/

SELECT *
FROM stock_data
WHERE "HIGH" < "LOW";


/*=========================================================
QUERY 06: NEGATIVE VALUE CHECK
PURPOSE  : Identify negative values.
=========================================================*/

SELECT *
FROM stock_data
WHERE "OPEN" < 0
   OR "HIGH" < 0
   OR "LOW" < 0
   OR "CLOSE" < 0;


/*=========================================================
QUERY 07: ZERO VALUE CHECK
PURPOSE  : Identify invalid volume values.
=========================================================*/

SELECT *
FROM stock_data
WHERE "VOLUME" = 0;


/*=========================================================
QUERY 08: DATE CONSISTENCY CHECK
PURPOSE  : Verify the date range.
=========================================================*/

SELECT
    MIN("DATE") AS start_date,
    MAX("DATE") AS end_date
FROM stock_data;


/*=========================================================
QUERY 01: HIGHEST STOCK PRICE  PH4
PURPOSE  : Identify the highest stock price.
=========================================================*/

SELECT
    MAX("HIGH") AS highest_price
FROM stock_data;


/*=========================================================
QUERY 02: LOWEST STOCK PRICE
PURPOSE  : Identify the lowest stock price.
=========================================================*/

SELECT
    MIN("LOW") AS lowest_price
FROM stock_data;


/*=========================================================
QUERY 03: AVERAGE CLOSING PRICE
PURPOSE  : Calculate the average closing price.
=========================================================*/

SELECT
    ROUND(AVG("CLOSE"), 2) AS average_close_price
FROM stock_data;


/*=========================================================
QUERY 04: HIGHEST TRADING VOLUME
PURPOSE  : Identify the highest trading volume.
=========================================================*/

SELECT
    "DATE",
    "VOLUME"
FROM stock_data
ORDER BY "VOLUME" DESC
LIMIT 1;


/*=========================================================
QUERY 05: LOWEST TRADING VOLUME
PURPOSE  : Identify the lowest trading volume.
=========================================================*/

SELECT
    "DATE",
    "VOLUME"
FROM stock_data
ORDER BY "VOLUME" ASC
LIMIT 1;


/*=========================================================
QUERY 06: DAILY PRICE MOVEMENT
PURPOSE  : Calculate daily price fluctuations.
=========================================================*/

SELECT
    "DATE",
    "HIGH",
    "LOW",
    ROUND(("HIGH" - "LOW"), 2) AS daily_movement
FROM stock_data
ORDER BY daily_movement DESC;


/*=========================================================
QUERY 07: OPENING VS CLOSING PRICE
PURPOSE  : Compare opening and closing prices.
=========================================================*/

SELECT
    "DATE",
    "OPEN",
    "CLOSE",
    ROUND(("CLOSE" - "OPEN"), 2) AS price_difference
FROM stock_data
ORDER BY price_difference DESC;


/*=========================================================
QUERY 08: MONTHLY PERFORMANCE ANALYSIS
PURPOSE  : Calculate the average monthly closing price.
=========================================================*/

SELECT
    "MONTH",
    ROUND(AVG("CLOSE"), 2) AS average_close_price
FROM stock_data
GROUP BY "MONTH"
ORDER BY average_close_price DESC;


/*=========================================================
QUERY 09: MONTHLY TRADING VOLUME ANALYSIS
PURPOSE  : Calculate monthly trading volume.
=========================================================*/

SELECT
    "MONTH",
    SUM("VOLUME") AS total_volume
FROM stock_data
GROUP BY "MONTH"
ORDER BY total_volume DESC;


/*=========================================================
QUERY 01: HIGHEST CLOSING PRICE
=========================================================*/

SELECT
    MAX("CLOSE") AS highest_closing_price
FROM stock_data;

/*=========================================================
QUERY 02: LOWEST CLOSING PRICE
PURPOSE : Identify the lowest closing price recorded in
           the dataset.
=========================================================*/

SELECT
    MIN("CLOSE") AS lowest_closing_price
FROM stock_data;


/*=========================================================
QUERY 03: AVERAGE CLOSING PRICE
PURPOSE : Calculate the average closing price recorded
          in the dataset.
=========================================================*/

SELECT
    ROUND(AVG("CLOSE"), 2) AS average_closing_price
FROM stock_data;


/*=========================================================
QUERY 04: HIGHEST STOCK PRICE
PURPOSE : Identify the highest stock price recorded in
          the dataset.
=========================================================*/

SELECT
    MAX("HIGH") AS highest_stock_price
FROM stock_data;


/*=========================================================
QUERY 05: LOWEST STOCK PRICE
PURPOSE : Identify the lowest stock price recorded in
          the dataset.
=========================================================*/

SELECT
    MIN("LOW") AS lowest_stock_price
FROM stock_data;


/*=========================================================
QUERY 06: HIGHEST TRADING VOLUME
PURPOSE : Identify the highest trading volume recorded
          in the dataset.
=========================================================*/

SELECT
    MAX("VOLUME") AS highest_trading_volume
FROM stock_data;


/*=========================================================
QUERY 07: LOWEST TRADING VOLUME
PURPOSE : Identify the lowest trading volume recorded
          in the dataset.
=========================================================*/

SELECT
    MIN("VOLUME") AS lowest_trading_volume
FROM stock_data;


/*=========================================================
QUERY 08: AVERAGE TRADING VOLUME
PURPOSE : Calculate the average trading volume recorded
          in the dataset.
=========================================================*/

SELECT
    ROUND(AVG("VOLUME"), 2) AS average_trading_volume
FROM stock_data;


/*=========================================================
QUERY 09: DAILY PRICE MOVEMENT
PURPOSE : Calculate the daily price movement.
=========================================================*/

SELECT
    "DATE",
    "HIGH",
    "LOW",
    ROUND(("HIGH" - "LOW"), 2) AS daily_movement
FROM stock_data
ORDER BY daily_movement DESC;


/*=========================================================
QUERY 10: OPENING PRICE VS CLOSING PRICE
PURPOSE : Compare opening and closing prices for each
          trading day.
=========================================================*/

SELECT
    "DATE",
    "OPEN",
    "CLOSE",
    ROUND(("CLOSE" - "OPEN"), 2) AS price_difference
FROM stock_data
ORDER BY price_difference DESC;


/*=========================================================
QUERY 11: MONTHLY AVERAGE CLOSING PRICE
PURPOSE : Calculate the average closing price for each
          month.
=========================================================*/

SELECT
    "MONTH",
    ROUND(AVG("CLOSE"), 2) AS average_closing_price
FROM stock_data
GROUP BY "MONTH"
ORDER BY average_closing_price DESC;

/*=========================================================
QUERY 12: MONTHLY TRADING VOLUME
PURPOSE : Calculate the total trading volume for each
          month.
=========================================================*/

SELECT
    "MONTH",
    SUM("VOLUME") AS total_trading_volume
FROM stock_data
GROUP BY "MONTH"
ORDER BY total_trading_volume DESC;

/*=========================================================
QUERY 13: QUARTERLY AVERAGE CLOSING PRICE
PURPOSE : Calculate the average closing price for each
          quarter.
=========================================================*/

SELECT
    "QUARTER",
    ROUND(AVG("CLOSE"), 2) AS average_closing_price
FROM stock_data
GROUP BY "QUARTER"
ORDER BY average_closing_price DESC;

/*=========================================================
QUERY 14: QUARTERLY TRADING VOLUME
PURPOSE : Calculate the total trading volume for each
          quarter.
=========================================================*/

SELECT
    "QUARTER",
    SUM("VOLUME") AS total_trading_volume
FROM stock_data
GROUP BY "QUARTER"
ORDER BY total_trading_volume DESC;

/*=========================================================
QUERY 15: HIGHEST VWAP
PURPOSE : Identify the highest volume-weighted average
          price recorded in the dataset.
=========================================================*/

SELECT
    MAX("VWAP") AS highest_vwap
FROM stock_data;


/*=========================================================
QUERY 16: LOWEST VWAP
PURPOSE : Identify the lowest volume-weighted average
          price recorded in the dataset.
=========================================================*/

SELECT
    MIN("VWAP") AS lowest_vwap
FROM stock_data;


/*=========================================================
QUERY 17: HIGHEST NUMBER OF TRADES
PURPOSE : Identify the highest number of trades recorded
          in the dataset.
=========================================================*/

SELECT
    MAX("NO. OF TRADES") AS highest_number_of_trades
FROM stock_data;


/*=========================================================
QUERY 18: LOWEST NUMBER OF TRADES
PURPOSE : Identify the lowest number of trades recorded
          in the dataset.
=========================================================*/

SELECT
    MIN("NO. OF TRADES") AS lowest_number_of_trades
FROM stock_data;


/*=========================================================
QUERY 19: YEARLY PERFORMANCE ANALYSIS
PURPOSE : Calculate the average closing price for each year.
=========================================================*/

SELECT
    "YEAR",
    ROUND(AVG("CLOSE"), 2) AS average_closing_price
FROM stock_data
GROUP BY "YEAR"
ORDER BY "YEAR";


/*=========================================================
QUERY 20: HIGHEST 52-WEEK HIGH
PURPOSE : Identify the highest value recorded in the
          52-week high column.
=========================================================*/

SELECT
    MAX("52W H") AS highest_52_week_high
FROM stock_data;


/*=========================================================
QUERY 21: LOWEST 52-WEEK LOW
PURPOSE : Identify the lowest value recorded in the
          52-week low column.
=========================================================*/

SELECT
    MIN("52W L") AS lowest_52_week_low
FROM stock_data;


/*=========================================================
QUERY 22: RANK DAILY PRICE MOVEMENTS
PURPOSE : Rank days according to price movement.
=========================================================*/

SELECT
    "DATE",
    "HIGH",
    "LOW",
    ROUND(("HIGH" - "LOW"), 2) AS daily_movement,
    RANK() OVER (
        ORDER BY ("HIGH" - "LOW") DESC
    ) AS movement_rank
FROM stock_data;


/*=========================================================
QUERY 23: ROW NUMBER ANALYSIS
PURPOSE : Assign a unique row number to every record.
=========================================================*/

SELECT
    "DATE",
    "CLOSE",
    ROW_NUMBER() OVER (
        ORDER BY "CLOSE" DESC
    ) AS row_number_rank
FROM stock_data;


/*=========================================================
QUERY 24: DENSE RANK ANALYSIS
PURPOSE : Rank records according to the closing price.
=========================================================*/

SELECT
    "DATE",
    "CLOSE",
    DENSE_RANK() OVER (
        ORDER BY "CLOSE" DESC
    ) AS dense_rank_number
FROM stock_data;


/*=========================================================
QUERY 25: LAG ANALYSIS
PURPOSE : Compare the current closing price with the
          previous day's closing price.
=========================================================*/

SELECT
    "DATE",
    "CLOSE",

    LAG("CLOSE", 1) OVER (
        ORDER BY "DATE"
    ) AS previous_day_close,

    ROUND(
        "CLOSE" - LAG("CLOSE", 1) OVER (
            ORDER BY "DATE"
        ),
        2
    ) AS price_change

FROM stock_data;


/*=========================================================
QUERY 26: LEAD ANALYSIS
PURPOSE : Compare the current closing price with the
          next day's closing price.
=========================================================*/

SELECT
    "DATE",
    "CLOSE",

    LEAD("CLOSE", 1) OVER (
        ORDER BY "DATE"
    ) AS next_day_close,

    ROUND(
        LEAD("CLOSE", 1) OVER (
            ORDER BY "DATE"
        ) - "CLOSE",
        2
    ) AS next_day_change

FROM stock_data;


/*=========================================================
QUERY 27: CASE ANALYSIS
PURPOSE : Categorize stock movement.
=========================================================*/

SELECT
    "DATE",
    "OPEN",
    "CLOSE",

    CASE
        WHEN "CLOSE" > "OPEN" THEN 'Price Increased'
        WHEN "CLOSE" < "OPEN" THEN 'Price Decreased'
        ELSE 'Price Stable'
    END AS stock_status

FROM stock_data;


/*=========================================================
QUERY 28: CTE ANALYSIS
PURPOSE : Identify the top five closing prices.
=========================================================*/

WITH highest_prices AS
(
    SELECT
        "DATE",
        "CLOSE"
    FROM stock_data
)

SELECT *
FROM highest_prices
ORDER BY "CLOSE" DESC
LIMIT 5;


/*=========================================================
QUERY 28: CTE ANALYSIS
PURPOSE : Identify the top five closing prices.
=========================================================*/

WITH highest_prices AS
(
    SELECT
        "DATE",
        "CLOSE"
    FROM stock_data
)

SELECT *
FROM highest_prices
ORDER BY "CLOSE" DESC
LIMIT 5;


/*=========================================================
QUERY 29: RUNNING TOTAL ANALYSIS
PURPOSE : Calculate cumulative trading volume.
=========================================================*/

SELECT
    "DATE",
    "VOLUME",

    SUM("VOLUME") OVER (
        ORDER BY "DATE"
    ) AS cumulative_volume

FROM stock_data;

/*=========================================================
QUERY 30: MOVING AVERAGE ANALYSIS
PURPOSE : Calculate the moving average of closing prices.
=========================================================*/

SELECT
    "DATE",
    "CLOSE",

    ROUND(
        AVG("CLOSE") OVER (
            ORDER BY "DATE"
            ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average

FROM stock_data;