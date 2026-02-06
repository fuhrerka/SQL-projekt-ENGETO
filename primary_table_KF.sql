CREATE TABLE t_katerina_fuhrerova_project_sql_primary_finale AS
WITH wages AS (
    SELECT 
        cpay.payroll_year,
        cpib.name AS industry_branch_name,
        ROUND(AVG(cpay.value)::NUMERIC, 2) AS avg_wages
    FROM czechia_payroll AS cpay
    JOIN czechia_payroll_industry_branch AS cpib 
        ON cpay.industry_branch_code = cpib.code
    WHERE cpay.value_type_code = 5958
        AND cpay.calculation_code = 200
        AND cpay.payroll_year BETWEEN 2006 AND 2018
    GROUP BY cpay.payroll_year, cpib.name
),
prices AS (
    SELECT 
        ROUND(AVG(cp.value)::NUMERIC, 2) AS avg_price,
        DATE_PART('year', cp.date_from) AS price_year,
        cpc.name AS food_name
    FROM czechia_price AS cp 
    JOIN czechia_price_category AS cpc ON cp.category_code = cpc.code 
    WHERE cp.region_code IS NULL
      AND DATE_PART('year', cp.date_from) BETWEEN 2006 AND 2018
    GROUP BY DATE_PART('year', cp.date_from), cpc.name
)
SELECT 
    p.food_name,
    p.avg_price,
    p.price_year AS year,
    w.industry_branch_name,
    w.avg_wages
FROM prices p
JOIN wages w
    ON p.price_year = w.payroll_year
ORDER BY year, food_name, industry_branch_name
;
