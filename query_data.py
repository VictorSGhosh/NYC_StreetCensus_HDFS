from pyspark.sql import SparkSession

# Initialize a Spark session
spark = SparkSession.builder \
    .appName('HDFS CSV Query') \
    .getOrCreate()

# Read CSV file from HDFS
df = spark.read.csv('hdfs://localhost:9000/sample-data.csv', header=True, inferSchema=True)

# # Perform SQL-like queries
df.createOrReplaceTempView('trees')
result = spark.sql("SELECT boroname, COUNT(*) as count FROM trees WHERE spc_common LIKE '%maple%' GROUP BY boroname")
result.show()

# Stop the Spark session
spark.stop()
