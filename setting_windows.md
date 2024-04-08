# Setting HDFS environment on Windows

1. Install [JAVA JDK 8](https://www.oracle.com/java/technologies/downloads/)
2. Update environment variables and make sure JAVA_HOME & its path on C: drive is present on the list of enironment variables
3. Download HDFS from [HDFS distribution](https://hadoop.apache.org/releases.html). We have downloaded Hadoop v3.4.0 for our use.
4. Unzip HDFS-distribution in C: drive  
5. Go to C:\hadoop-3.4.0\etc\hadoop folder and make the following edits.
   ### core-site.xml
   ``` xml
   <configuration>
      <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:900</value>
      </property>
   </configuration>
   ```

   ### hdfs-site.xml
   ``` xml
   <configuration>
       <property>
           <name>dfs.replication</name>
           <value>1</value>
       </property>
       
       <property>
           <name>dfs.namenode.name.dir</name>
           <value>C:\hadoop-3.4.0\data\namenode</value>
       </property>
       
       <property>
           <name>dfs.datanode.name.dir</name>
           <value>C:\hadoop-3.4.0\data\datanode</value>
       </property>
   </configuration>
   ```

   ### mapred-site.xml
   ``` xml
   <configuration>
       <property>
           <name>mapreduce.framework.name</name>
           <value>yarn</value>
       </property>
   </configuration>
   ```

   ### yarn-site.xml
   ``` xml
   <configuration>
       <property>
           <name>yarn.nodemanager.aux-services</name>
           <value>mapreduce_shuffle</value>
       </property>
       <property>
           <name>yarn.nodemanager.auxservices.mapreduce.shuffle</name>
           <value>org.apache.hadoop.mapred.shufflehandler</value>
       </property>
   </configuration>
   ```
6. Create HDFS namenode and datanode folders under C:\hadoop-3.4.0\data: `
7. Start hadoop: ```start-all.cmd```



