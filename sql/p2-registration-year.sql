SELECT 
EXTRACT(YEAR FROM date_of_registration) AS year,
COUNT(*) AS total_companies
FROM company
GROUP BY year
ORDER BY year