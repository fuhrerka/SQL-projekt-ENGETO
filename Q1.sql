-- 1. ukol : Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

WITH payroll_trends AS (
    SELECT 
        "year",
        industry_branch_name,
        avg_wages,
        LAG(avg_wages) OVER (PARTITION BY industry_branch_name ORDER BY "year" ) AS prev_avg_wages
    FROM t_katerina_fuhrerova_project_sql_primary_finale
    WHERE industry_branch_name IS NOT NULL
    GROUP BY "year", 
    		industry_branch_name, 
    		avg_wages
)
SELECT 
    "year",
    industry_branch_name,
    avg_wages,
    prev_avg_wages,
    ROUND(((avg_wages - prev_avg_wages) / prev_avg_wages * 100), 2) AS growth_pct
FROM payroll_trends
WHERE prev_avg_wages IS NOT NULL 
	AND avg_wages < prev_avg_wages -- podminka, kt. ukaze jen pokles
ORDER BY "year"  DESC, 
		industry_branch_name ASC
;
