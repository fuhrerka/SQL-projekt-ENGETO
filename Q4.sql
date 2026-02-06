-- 4. ukol: Existuje rok, ve kterém byl meziroční nárůst cen potravin
-- výrazně vyšší než růst mezd (větší než 10 %)?

WITH yearly_data AS ( 
    SELECT
        "year",
        AVG(avg_price) AS avg_food_price,
        AVG(avg_wages) AS avg_wages
    FROM t_katerina_fuhrerova_project_sql_primary_finale
    GROUP BY "year" 
),
growth_calculation AS (
    SELECT 
        "year",
        avg_food_price,
        avg_wages,
        ROUND((avg_food_price - LAG(avg_food_price) OVER (ORDER BY "year")) / LAG(avg_food_price) OVER (ORDER BY "year") * 100, 2) AS food_growth_pct,
        ROUND((avg_wages - LAG(avg_wages) OVER (ORDER BY "year")) / LAG(avg_wages) OVER (ORDER BY "year") * 100, 2) AS wages_growth_pct
    FROM yearly_data
)
SELECT 
    "year",
    food_growth_pct,
    wages_growth_pct,
    ROUND(food_growth_pct - wages_growth_pct, 2) AS growth_diff
FROM growth_calculation
WHERE food_growth_pct IS NOT NULL
ORDER BY "year"
;
