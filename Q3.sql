-- 3. ukol: Která kategorie potravin zdražuje nejpomaleji
--  (je u ní nejnižší percentuální meziroční nárůst)? 

WITH annual_prices AS (
    SELECT 
        food_name,
        "year" ,
        AVG(avg_price) AS average_annual_price
    FROM t_katerina_fuhrerova_project_sql_primary_finale
    GROUP BY food_name,
    		"year" 
),
growth_calculation AS (
    SELECT 
        food_name,
        "year" ,
        average_annual_price,
        LAG(average_annual_price) OVER (PARTITION BY food_name ORDER BY "year" ) AS previous_year_price
    FROM annual_prices 
)
SELECT 
    food_name,
    ROUND(AVG((average_annual_price - previous_year_price) / previous_year_price * 100), 2) AS average_annual_growth_percentage
FROM growth_calculation
WHERE previous_year_price IS NOT NULL
GROUP BY food_name 
ORDER BY average_annual_growth_percentage ASC
;
