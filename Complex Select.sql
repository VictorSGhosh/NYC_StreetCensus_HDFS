SELECT
  spc_latin AS Species,
  COUNT(*) AS TreeCount,
  AVG(tree_dbh) AS AverageDiameter,
  SUM(CASE WHEN status = 'Alive' THEN 1 ELSE 0 END) AS AliveCount,
  SUM(CASE WHEN status = 'Stump' OR status = 'Dead' THEN 1 ELSE 0 END) AS DeadOrStumpCount,
  nta_name AS Neighborhood,
  health,
  boro_ct
FROM
  NY_Trees_Data
WHERE
  curb_loc = 'OnCurb'
  AND health IN ('Good', 'Fair')
GROUP BY
  spc_latin, nta_name, health, boro_ct
HAVING
  TreeCount > 10
ORDER BY
  TreeCount DESC, AverageDiameter DESC;