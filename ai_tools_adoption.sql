--CREATING A TABLE IN THE DATABASE

CREATE TABLE ai_adoption_dataset (
    country TEXT,
    industry TEXT,
    ai_tool TEXT,
    adoption_rate FLOAT,
    daily_active_users INTEGER,
    year DATE,
    age_group INTEGER,
    company_size TEXT
);

--VIEWING THE WHOLE DATA IN THE TABLE
SELECT * FROM ai_adoption_dataset;

--CHANGING THE DATATYPE OF THE COLUMNS WHICH ARE DECLARED THE TABLE

ALTER TABLE ai_adoption_dataset
ALTER COLUMN year TYPE INTEGER
USING EXTRACT(YEAR FROM year);

ALTER TABLE ai_adoption_dataset
ALTER COLUMN age_group TYPE TEXT;

--DATA CLEANING

--DELETING NULL VALUES
DELETE
FROM ai_adoption_dataset
WHERE country IS NULL
   OR industry IS NULL
   OR ai_tool IS NULL
   OR adoption_rate IS NULL
   OR daily_active_users IS NULL
   OR year IS NULL
   OR age_group IS NULL
   OR company_size IS NULL;

--REDUCING FILE SIZE
VACUUM FULL ai_adoption_dataset;

UPDATE ai_adoption_dataset
SET 
	country = TRIM(country),
  	industry = TRIM(industry),
	ai_tool=TRIM(ai_tool),
	age_group=TRIM(age_group),
	company_size=TRIM(company_size);

--SELECTING ROWS THAT NEEDED TO BE TRIM
SELECT *
FROM ai_adoption_dataset
WHERE country LIKE ' %' OR country LIKE '% ';

--FINDING MIN AND MAX VALUE OF DAILY_ACTIVE_USERS
SELECT MAX(daily_active_users), MIN(daily_active_users)
FROM ai_adoption_dataset;

--FINDING AVG, MIN AND MAX VALUE OF DAILY_ACTIVE_USERS AND ADOPTION_RATE
SELECT 
    AVG(adoption_rate) AS avg_adoption,
    MIN(adoption_rate) AS min_adoption,
    MAX(adoption_rate) AS max_adoption
FROM ai_adoption_dataset;

SELECT 
    AVG(daily_active_users) AS avg_daily_active_users,
    MIN(daily_active_users) AS min_daily_active_users,
    MAX(daily_active_users) AS max_daily_active_users
FROM ai_adoption_dataset;

--FINDING THE COUNT OF ROWS WHERE USERS = 100
SELECT COUNT(*)
FROM ai_adoption_dataset
WHERE daily_active_users = 100;

--FINDING THE COUNT OF ROWS WHERE USERS > 9000
SELECT COUNT(*)
FROM ai_adoption_dataset
WHERE daily_active_users > 9000;

SELECT COUNT(DISTINCT country) FROM ai_adoption_dataset;

CREATE INDEX idx_country ON ai_adoption_dataset(country);

SELECT country, AVG(adoption_rate) AS avg_adoption
FROM ai_adoption_dataset
GROUP BY country
ORDER BY avg_adoption DESC;

SELECT industry, AVG(adoption_rate) AS avg_adoption
FROM ai_adoption_dataset
GROUP BY industry
ORDER BY avg_adoption DESC;

SELECT ai_tool, AVG(adoption_rate) AS avg_adoption
FROM ai_adoption_dataset
GROUP BY ai_tool
ORDER BY avg_adoption DESC;

SELECT year, AVG(adoption_rate)
FROM ai_adoption_dataset
GROUP BY year
ORDER BY year DESC;

SELECT country, SUM(daily_active_users) AS total_users
FROM ai_adoption_dataset
GROUP BY country
ORDER BY total_users DESC;

SELECT country, SUM(adoption_rate) AS adoption_rate
FROM ai_adoption_dataset
GROUP BY country
ORDER BY adoption_rate DESC;

SELECT CORR(adoption_rate, daily_active_users)
FROM ai_adoption_dataset;


--Dividing Large sheet into multiple small data sets--
CREATE TABLE ai_adoption_australia AS
SELECT *
FROM ai_adoption_dataset
WHERE country='Australia';

CREATE TABLE ai_adoption_uk AS
SELECT *
FROM ai_adoption_dataset
WHERE country='UK';

CREATE TABLE ai_adoption_brazil AS
SELECT *
FROM ai_adoption_dataset
WHERE country='Brazil';

CREATE TABLE ai_adoption_canada AS
SELECT *
FROM ai_adoption_dataset
WHERE country='Canada';

CREATE TABLE ai_adoption_france AS
SELECT *
FROM ai_adoption_dataset
WHERE country='France';

CREATE TABLE ai_adoption_china AS
SELECT *
FROM ai_adoption_dataset
WHERE country='China';

CREATE TABLE ai_adoption_india AS
SELECT *
FROM ai_adoption_dataset
WHERE country='India';

CREATE TABLE ai_adoption_southkorea AS
SELECT *
FROM ai_adoption_dataset
WHERE country='South Korea';

CREATE TABLE ai_adoption_usa AS
SELECT * 
FROM ai_adoption_dataset
WHERE country='USA';

CREATE TABLE ai_adoption_germany AS
SELECT *
FROM ai_adoption_dataset
WHERE country='Germany';

SELECT *
FROM ai_adoption_dataset;