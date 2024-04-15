from hdfs import InsecureClient

hdfs_client = InsecureClient('http://localhost:9870')

# Write data from a local file
hdfs_client.upload('/sample-data.csv', '/mnt/c/Users/HP/Documents/2015StreetTreesCensus.csv')


