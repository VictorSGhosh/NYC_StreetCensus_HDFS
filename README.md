# NYC_StreetCensus_HDFS
Performance Analysis of NYC Street Census Report on HDFS Systems vs Relational Database 

# Introduction
In the era of big data, the need for efficient and scalable data storage solutions is paramount. While relational databases have long been the go-to choice for structured data storage, the emergence of Hadoop Distributed File System (HDFS) presents an alternative solution capable of handling vast amounts of data across distributed environments. This project proposes the implementation of HDFS for migrating data from a relational database system, followed by a comprehensive performance analysis to compare the effectiveness of both systems.

Objectives
1.	Data Migration: 
Transfer existing data from the relational database to HDFS while ensuring data integrity and consistency.  
2.	Implementation of HDFS: 
Set up HDFS infrastructure and configure it to accommodate the migrated data.
3.	Performance Analysis: 
Conduct a thorough comparison between the performance of HDFS and the relational database system in terms of data storage, retrieval, processing speed, and scalability.
4.	Identification of Use Cases: 
Identify specific use cases where HDFS outperforms the relational database and vice versa.

Dataset
We intend to use the NYC 2015 Street Tree Census Report as our sample data for data migration and testing

Methodology
Data Migration
-	Data Profiling: 
Analyze the structure and volume of data stored in the relational database to plan for efficient migration.  
-	Data Transformation: 
Transform the relational database schema into a format compatible with HDFS, considering factors such as data types, partitioning, and distribution.
-	ETL (Extract, Transform, Load): 
Develop scripts or use ETL tools to extract data from the relational database, transform it according to the HDFS schema, and load it into the HDFS environment.
Implementation of HDFS
-	Infrastructure Setup: Deploy Hadoop cluster nodes and configure them according to the desired architecture (e.g., single node, multi-node).
-	HDFS Configuration: Configure HDFS settings such as replication factor, block size, and Namenode/ Datanode configurations to optimize data storage and retrieval performance.
-	Data Loading: Load the migrated data into HDFS and validate its integrity and consistency.
Performance Analysis
-	Benchmarking: Develop benchmarking tests to measure the performance of both systems under various conditions, including data volume, concurrent user access, and types of queries.
-	Metrics Collection: Collect metrics such as data access time, throughput, latency, and resource utilization for both HDFS and the relational database system.
-	Analysis and Comparison: Analyze the collected metrics to compare the performance of HDFS and the relational database system, identifying strengths and weaknesses of each solution.

Identification of Use Cases
Scenario-based Testing: Perform scenario-based testing to identify use cases where HDFS excels, such as handling large-scale batch processing or unstructured data types.

Timeline
-	Week 1: Relational Schema Setup and HDFS Infrastructure Setup & Configuration.
-	Week 2: ETL development and data migration into Relational Data and HDFS.
-	Week 3: Benchmarking tests on Relational Database and HDFS.
-	Week 4: Analysis, comparison, and use case identification.
-	Week 5: Documentation, report writing & Presentation preparation.

Deliverables
1.	Detailed documentation of the data migration process, including data profiling reports and ETL scripts.
2.	Configuration documentation for the HDFS infrastructure.
3.	Performance analysis report comparing HDFS and the relational database system, with insights into their respective strengths and weaknesses.
4.	Use case analysis highlighting scenarios where HDFS is preferred over the relational database system and vice versa.
5.	Presentation slides summarizing key findings and recommendations for future decisions.

Resources Required
-	Hadoop cluster infrastructure (nodes, storage, networking).
-	Database migration tools or scripts.
-	Benchmarking tools (e.g., Apache Bench, TPC benchmarks).
-	Data profiling and visualization tools.

Conclusion
By implementing HDFS for data storage and conducting a comprehensive performance analysis, this project aims to provide valuable insights into the suitability of HDFS compared to traditional relational database systems. The findings from this project will inform future data management strategies and contribute to optimizing data storage and processing capabilities in the organization.

