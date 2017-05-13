wget http://archive.apache.org/dist/hbase/0.98.24/hbase-0.98.24-hadoop2-bin.tar.gz

conf/hbase-site.xml
<property>
	<name>hbase.rootdir</name>
	<value>hdfs://hadoop-master:9000/hbase</value>
</property>
<property>
	<name>hbase.cluster.distributed</name>
	<value>true</value>
</property>
<property>
	<name>hbase.master</name>
	<value>hdfs://hadoop-master:60000</value>
</property>
<property>
	<name>hbase.zookeeper.quorum</name>
	<value>hadoop-master,hadoop-slave1,hadoop-slave2</value>
</property>

conf/regionservers
hadoop-master
hadoop-slave1
hadoop-slave2

conf/hbase-env.sh
export HBASE_MANAGES_ZK=true


