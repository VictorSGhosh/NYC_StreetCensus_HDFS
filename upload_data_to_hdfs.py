from datetime import datetime
from hdfs import InsecureClient


start = datetime.now()
hdfs_client = InsecureClient('http://localhost:9870')

# Write data from a local file
hdfs_client.upload('/sample-data.csv', '/mnt/c/Users/HP/Documents/2015StreetTreesCensus.csv')
end = datetime.now()
print('Time taken to upload data to HDFS: ' + str(end - start))


