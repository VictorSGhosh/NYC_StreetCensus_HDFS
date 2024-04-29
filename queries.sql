USE ECE_569;

-- get number of trees(total, alive, dead, stump, other) of a specific common name in each borough and city
SELECT spc_common, spc_latin, boroname, zip_city, COUNT(*) as tree_count,
SUM(CASE WHEN status = 'Alive' THEN 1 ELSE 0 END) AS alive_count,
SUM(CASE WHEN status = 'Dead' THEN 1 ELSE 0 END) AS dead_count,
SUM(CASE WHEN status = 'Stump' THEN 1 ELSE 0 END) AS stump_count,
SUM(CASE WHEN status = 'Other' THEN 1 ELSE 0 END) AS other_count
FROM NY_Trees_Data 
GROUP BY spc_latin, spc_common, boroname, zip_city
ORDER BY boroname, zip_city;

-- count number of trees per user_type
SELECT user_type, COUNT(*) AS tree_count FROM NY_Trees_Data
GROUP BY user_type;
