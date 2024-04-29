from pyspark.sql import SparkSession
from datetime import datetime

# Initialize a Spark session
spark = SparkSession.builder \
    .appName('Delete HDFS Data') \
    .config("spark.hadoop.fs.defaultFS", "hdfs://localhost:9000") \
    .getOrCreate()

# Access the Hadoop FileSystem
start = datetime.now()

sc = spark.sparkContext
fs = sc._jvm.org.apache.hadoop.fs.FileSystem.get(sc._jsc.hadoopConfiguration())

# Specify the HDFS directory path you want to delete
path = sc._jvm.org.apache.hadoop.fs.Path('hdfs://localhost:9000/sample-data.csv')

# Delete the directory and all its contents
fs.delete(path, True)  # True for recursive deletion
end = datetime.now()
print('Execution time: ' + str(end - start))

# Stop the Spark session
spark.stop()
