## Performance Comparision on Mac
**Dataset:** [NYC 2015 Street Tree Census Report](https://data.cityofnewyork.us/Environment/2015-Street-Tree-Census-Tree-Data/pi5s-9p35) (238 MB) (683K rows)
|  No.  |                                                   SQL Query                                                   | MySQL (in sec) | PySpark (in sec) |
| :---: | :-----------------------------------------------------------------------------------------------------------: | :-----------: | :-------------: |
|   1   | ```SELECT boroname, COUNT(*) as count FROM NY_Trees_Data WHERE spc_common LIKE '%maple%' GROUP BY boroname``` |     0.67      |      1.29       |

**Dataset:** [Weather-Dataset-US](https://www.kaggle.com/datasets/nachiketkamod/weather-dataset-us?resource=download) (8.37 GB) (155M rows)

|  No.  |                    SQL Query                     | MySQL (in sec) | PySpark (in sec) |
| :---: | :----------------------------------------------: | :-----------: | :-------------: |
|   1   | ```SELECT COUNT(DISTINCT ID) FROM weather```     |    163.79     |      37.57      |
