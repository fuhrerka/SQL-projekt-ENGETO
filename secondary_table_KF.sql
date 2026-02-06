CREATE TABLE t_Katerina_Fuhrerova_project_SQL_secondary_finale AS 
	SELECT 
	e.country,
	e."year",
	e.gdp,
	e.population,
	e.gini 
FROM economies AS e 
JOIN countries c 
		ON e.country = c.country 
	WHERE c.continent = 'Europe'
		AND e."year" BETWEEN 2006 AND 2018
	ORDER BY e.country,
		e."year" 
;
