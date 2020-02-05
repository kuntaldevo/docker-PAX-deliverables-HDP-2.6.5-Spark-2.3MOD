
# If network is not created then please run the command below, otherwise leave it commented out.
# docker network create hadoop-network

# Building the images to be used for the environment
docker build -t dtr.paxatadev.com/paxata/paxata-base:8-hdp docker-base
docker build -t dtr.paxatadev.com/hortonworks/kerboros:2.6.5 docker-kerberos
docker build -t dtr.paxatadev.com/hortonworks/base:2.6.5-kerberos-8-hdp docker-hadoop-base
docker build -t dtr.paxatadev.com/hortonworks/namenode:2.6.5-kerberos-8-hdp docker-hadoop-namenode
docker build -t dtr.paxatadev.com/hortonworks/datanode-nodemanager:2.6.5-kerberos-8-hdp docker-hadoop-datanode-nodemanager
docker build -t dtr.paxatadev.com/hortonworks/resourcemanager:2.6.5-kerberos-8-hdp docker-hadoop-resourcemanager
docker build -t dtr.paxatadev.com/hortonworks/spark:2.6.5-spark-2.3.0-kerberos-8-hdp docker-spark
docker build -t dtr.paxatadev.com/hortonworks/hive:2.6.5-kerberos-8-hdp docker-hive
#docker build -t dtr.paxatadev.com/hortonworks/pipeline:2.6.5-spark-2.3.0-kerberos-8-hdp docker-pipeline



