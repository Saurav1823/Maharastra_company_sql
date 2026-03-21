WITH top_activity AS (
SELECT principal_business_activity
FROM company
GROUP BY principal_business_activity
ORDER BY COUNT(*) DESC
LIMIT 5
)

SELECT 
EXTRACT(YEAR FROM date_of_registration) AS year,
principal_business_activity,
COUNT(*) AS total
FROM company
WHERE principal_business_activity IN (SELECT * FROM top_activity)
AND EXTRACT(YEAR FROM date_of_registration) >= EXTRACT(YEAR FROM CURRENT_DATE) - 10
GROUP BY year, principal_business_activity
ORDER BY year;