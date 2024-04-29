from datetime import datetime
from pyspark.sql import SparkSession
from pyspark.sql.functions import initcap

# Initialize a Spark session
spark = SparkSession.builder \
    .config("spark.driver.memory", "15g") \
    .appName('Capitalize Words in DataFrame') \
    .getOrCreate()

# Example data loading step, replace with actual data source if different
df = spark.read.csv('hdfs://localhost:9000/sample-data.csv', header=True, inferSchema=True)
start = datetime.now()
# Using the initcap function to capitalize each word in the 'spc_latin' column
df = df.withColumn('spc_latin', initcap('spc_latin'))

# Show the results to verify the transformation
df.show(df.count(), False)
end = datetime.now()
print('Execution time: ' + str(end - start))

# Optional: Save the updated DataFrame back to a persistent storage if needed
# df.write.format('your_preferred_format').save('path_to_save')

# Stop the Spark session
spark.stop()
