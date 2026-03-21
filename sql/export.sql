-- P1
\copy (SELECT * FROM (SELECT CASE WHEN authorized_cap <= 100000 THEN '<=1L' WHEN authorized_cap <= 1000000 THEN '1L-10L' WHEN authorized_cap <= 10000000 THEN '10L-1Cr' WHEN authorized_cap <= 100000000 THEN '1Cr-10Cr' ELSE '>10Cr' END AS cap_range, COUNT(*) AS total_companies FROM company GROUP BY cap_range ORDER BY cap_range) AS t) TO '../output/p1.csv' CSV HEADER;

-- P2
\copy (SELECT * FROM (SELECT EXTRACT(YEAR FROM date_of_registration) AS year, COUNT(*) AS total_companies FROM company GROUP BY year ORDER BY year) AS t) TO '../output/p2.csv' CSV HEADER;

-- P3 
\copy (SELECT d.district, COUNT(*) AS total_companies FROM company c JOIN pincode_district d ON CAST(SUBSTRING(c.registered_office_address FROM '\d{6}') AS INT) = d.pincode WHERE EXTRACT(YEAR FROM c.date_of_registration) = 2015 GROUP BY d.district ORDER BY total_companies DESC LIMIT 10) TO '../output/p3.csv' CSV HEADER;
-- P4
\copy (SELECT * FROM (WITH top_activity AS (SELECT principal_business_activity FROM company GROUP BY principal_business_activity ORDER BY COUNT(*) DESC LIMIT 5) SELECT EXTRACT(YEAR FROM date_of_registration) AS year, principal_business_activity, COUNT(*) AS total FROM company WHERE principal_business_activity IN (SELECT * FROM top_activity) AND EXTRACT(YEAR FROM date_of_registration) >= EXTRACT(YEAR FROM CURRENT_DATE) - 10 GROUP BY year, principal_business_activity ORDER BY year) AS t) TO '../output/p4.csv' CSV HEADER;