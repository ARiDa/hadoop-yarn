HADOOP_PREFIX=/usr/local/hadoop-yarn
mkdir -p ${HADOOP_PREFIX}
sudo chown -R ubuntu:ubuntu $HADOOP_PREFIX
cd $HADOOP_PREFIX
wget http://www.eu.apache.org/dist/hadoop/common/hadoop-2.5.1/hadoop-2.5.1.tar.gz
tar xvf hadoop-2.5.1.tar.gz
rm hadoop*.gz
mv hadoop-2.5.1/* ./
rm -rf hadoop-2.5.1

mkdir -p $HADOOP_PREFIX/yarn_data/hdfs/namenode
mkdir -p $HADOOP_PREFIX/yarn_data/hdfs/datanode

sudo chown -R ubuntu:ubuntu $HADOOP_PREFIX

PROFILE=$HADOOP_PREFIX"/profile"
echo 'export HADOOP_PREFIX="$HADOOP_DIR"' >> $PROFILE
echo 'export HADOOP_HOME=$HADOOP_PREFIX' >> $PROFILE
echo 'export HADOOP_COMMON_HOME=$HADOOP_PREFIX' >>  $PROFILE
echo 'export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop' >>  $PROFILE
echo 'export HADOOP_HDFS_HOME=$HADOOP_PREFIX' >>  $PROFILE
echo 'export HADOOP_MAPRED_HOME=$HADOOP_PREFIX' >>  $PROFILE
echo 'export HADOOP_YARN_HOME=$HADOOP_PREFIX' >>  $PROFILE
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >>  $PROFILE

source $PROFILE

for f in "core" "hdfs" "mapred" "yarn"
do
    cp templates/${f}-site.xml $HADOOP_CONF_DIR/${f}-site.xml
done
