-- 5. ukol: Má výška HDP vliv na změny ve mzdách a cenách potravin? 
-- Neboli, pokud HDP vzroste výrazněji v jednom roce,
-- projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?


WITH base_data AS (
    SELECT
        p."year",
        AVG(p.avg_price) AS avg_food_price,
        AVG(p.avg_wages) AS avg_wages,
        s.gdp
    FROM t_katerina_fuhrerova_project_sql_primary_finale p
    JOIN t_katerina_fuhrerova_project_sql_secondary_finale s 
        ON p."year" = s."year" 
        AND s.country = 'Czech Republic'
    GROUP BY p."year", s.gdp
),
growth_calculation AS (
  SELECT 
    "year",
   	gdp,
    ROUND(((gdp - LAG(gdp) OVER (ORDER BY "year")) / NULLIF(LAG(gdp) OVER (ORDER BY "year"), 0) * 100)::numeric, 2) AS gdp_growth_pct,
    ROUND(((avg_wages - LAG(avg_wages) OVER (ORDER BY "year")) / NULLIF(LAG(avg_wages) OVER (ORDER BY "year"), 0) * 100)::numeric, 2) AS salary_growth_pct,
    ROUND(((avg_food_price - LAG(avg_food_price) OVER (ORDER BY "year")) / NULLIF(LAG(avg_food_price) OVER (ORDER BY "year"), 0) * 100)::numeric, 2) AS price_growth_pct
FROM base_data
)
SELECT 
    "year",
    gdp_growth_pct,
    salary_growth_pct,
    price_growth_pct
FROM growth_calculation
WHERE gdp_growth_pct IS NOT NULL 
ORDER BY "year"
;
