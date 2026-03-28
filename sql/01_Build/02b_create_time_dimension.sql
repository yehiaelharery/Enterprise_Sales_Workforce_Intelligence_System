DROP TABLE IF EXISTS time_dimension;

CREATE TABLE time_dimension AS
SELECT 
    datum::date AS date,
    EXTRACT(YEAR FROM datum) AS year,
    EXTRACT(MONTH FROM datum) AS month,
    TRIM(TO_CHAR(datum, 'Month')) AS month_name,
    EXTRACT(QUARTER FROM datum) AS quarter,
    CASE 
        WHEN EXTRACT(ISODOW FROM datum) IN (5, 6) 
        THEN 'Weekend' 
        ELSE 'Weekday' 
    END AS day_type,
    TRIM(TO_CHAR(datum, 'Day')) AS day_name
FROM generate_series(
    '2025-01-01'::date,
    '2026-12-31'::date,
    '1 day'::interval
) AS datum;

ALTER TABLE time_dimension ADD PRIMARY KEY (date);