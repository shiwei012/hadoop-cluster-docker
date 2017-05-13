#!/bin/bash

# the default node number is 3
N=${1:-3}
tag=1.2

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
				-v $PWD/data/hbase98:/root/hbase98 \
				-v $PWD/data/master_hdfs:/root/hdfs \
                --hostname hadoop-master \
                kiwenlau/hadoop:$tag &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
					-v $PWD/data/hbase98:/root/hbase98 \
					-v $PWD/data/slave_hdfs$i:/root/hdfs \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                kiwenlau/hadoop:$tag &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash
