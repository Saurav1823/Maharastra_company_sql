SELECT 
d.district,
COUNT(*) AS total_companies
FROM company c
JOIN pincode_district d
ON CAST(SUBSTRING(c.registered_office_address FROM '\d{6}') AS INT) = d.pincode
WHERE EXTRACT(YEAR FROM c.date_of_registration) = 2015
GROUP BY d.district
ORDER BY total_companies DESC
LIMIT 10;   