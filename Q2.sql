-- 2. otázka: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období 
-- v dostupných datech cen a mezd?

SELECT 
    ptkf."year",
    ptkf.food_name,
    ptkf.avg_price,
    w.average_wage_total,
   ROUND(w.average_wage_total / ptkf.avg_price, 2) AS quantity
FROM t_katerina_fuhrerova_project_sql_primary_finale AS ptkf
JOIN (
       SELECT 
        "year",
        ROUND(AVG(avg_wages), 0) AS average_wage_total
    FROM t_katerina_fuhrerova_project_sql_primary_finale
    WHERE "year" IN (2006, 2018)
    GROUP BY "year"
) AS w ON ptkf."year" = w."year" 
WHERE 
    ptkf.food_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
    AND ptkf."year" IN (2006, 2018)
GROUP BY 
    ptkf."year",
    ptkf.food_name, 
    ptkf.avg_price, 
    w.average_wage_total
ORDER BY 
    ptkf.food_name,
	ptkf."year"
;
