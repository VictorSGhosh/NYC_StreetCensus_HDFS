import datetime

from pyspark.sql import SparkSession

# Initialize a Spark session
spark = SparkSession.builder \
    .appName('HDFS CSV Query') \
    .getOrCreate()

# Read CSV file from HDFS
df = spark.read.csv('hdfs://localhost:9000/sample-data.csv', header=True, inferSchema=True)

# # Perform SQL-like queries
df.createOrReplaceTempView('trees')
start = datetime.datetime.now()

# result = spark.sql("SELECT boroname, COUNT(*) as count FROM trees WHERE spc_common LIKE '%maple%' GROUP BY boroname")
result = spark.sql("SELECT st_assem, COUNT(*) as count FROM trees GROUP BY st_assem")
result.show(1000, False)
end = datetime.datetime.now()
print('Execution time: ' + str(end - start))
# result = spark.sql("SELECT COUNT(*) as count FROM trees;")
# result.show()

# Stop the Spark session
spark.stop()
