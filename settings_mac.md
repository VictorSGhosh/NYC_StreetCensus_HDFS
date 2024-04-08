# Setting HDFS environment in Mac

1. Install [JAVA JDK 8](https://www.oracle.com/java/technologies/downloads/)
2. Update environment variables in ``~/.zshrc``
   ``` bash
    JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home"

    # Hadoop 
    export HADOOP_HOME=/Users/revanth/hadoop-3.4.0/
    export HADOOP_INSTALL=$HADOOP_HOME 
    export HADOOP_MAPRED_HOME=$HADOOP_HOME 
    export HADOOP_COMMON_HOME=$HADOOP_HOME 
    export HADOOP_HDFS_HOME=$HADOOP_HOME
    export YARN_HOME=$HADOOP_HOME 
    export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
    export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin 
    export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/nativ"
   ```
3. Update ```JAVA_HOME``` path in ```hadoop-env.sh```
4. Update the following configuration files:
   ### core-site.xml
   ``` xml
   <configuration>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/Users/revanth/hdfs/tmp/</value>
    </property>
    <property>
        <name>fs.default.name</name>
        <value>hdfs://127.0.0.1:9000</value>
    </property>
   </configuration>
   ```

   ### hdfs-site.xml
   ``` xml
   <configuration>
    <property>
        <name>dfs.name.dir</name>
        <value>/Users/revanth/hdfs/namenode</value>
    </property>
    <property>
        <name>dfs.data.dir</name>
        <value>/Users/revanth/hdfs/datanode</value>
    </property>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
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
        <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
        <value>org.apache.hadoop.mapred.ShuffleHandler</value>
      </property>
      <property>
        <name>yarn.resourcemanager.hostname</name>
        <value>127.0.0.1</value>
      </property>
      <property>
        <name>yarn.acl.enable</name>
        <value>0</value>
      </property>
      <property>
        <name>yarn.nodemanager.env-whitelist</name>   
        <value>JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PERPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME</value>
      </property>
   </configuration>
   ```
5. Format the HDFS namenode: ```hdfs namenode -format```
6. Start hadoop: ```start-all.sh```
7. Access hadoop browser-interface at: [http://localhost:9870/dfshealth.html#tab-overview](http://localhost:9870/dfshealth.html#tab-overview)
8. Stop hadoop: ```stop-all.sh```


## Issues Fixed:
1.  The cluster ID of the datanodes and the namenodes do not match.
    ```
    // copy the clusterID from this file 
    /Users/revanth/hdfs/namenode/current/VERSION

    // make the datanode clusterID in this file same as namenode clusterID
    /Users/revanth/hdfs/datanode/current/VERSION
    ```
