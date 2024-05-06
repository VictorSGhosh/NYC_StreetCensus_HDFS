from datetime import datetime

from pyspark.sql import SparkSession

# Initialize a Spark session
spark = SparkSession.builder \
    .appName('HDFS CSV Query') \
    .getOrCreate()

# Read CSV file from HDFS
df = spark.read.csv('hdfs://localhost:9000/sample-data.csv', header=True, inferSchema=True)

# # Perform SQL-like queries
df.createOrReplaceTempView('NY_Trees_Data')


start = datetime.now()
# sql_query = "SELECT boroname, COUNT(*) as count FROM trees WHERE spc_common LIKE '%maple%' GROUP BY boroname"

# Read SQL query from a file
with open('Complex Select.sql', 'r') as file:
    sql_query = file.read()

result = spark.sql(sql_query)
result.show(result.count(), False)
end = datetime.now()
print('Execution time: ' + str(end - start))

# Stop the Spark session
spark.stop()
