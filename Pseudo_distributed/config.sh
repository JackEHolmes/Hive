cd ~
if [ -d "hive" ]; then
echo "hive  exists"
else
mkdir hive
fi
cd hive

export HIVE_HOME=/usr/hive/hive-1.2.2
if [ -f "mysql-connector-java-5.1.46.tar.gz" ]; then
echo "mysql-connector-java-5.1.46.tar.gz  exists"
else
sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz
fi
tar -zxvf mysql-connector-java-5.1.46.tar.gz
sudo cp mysql-connector-java-5.1.46/mysql*-bin.jar $HIVE_HOME/lib
rm -rf mysql-connector-java-5.1.46
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo_distributed/hive-site.xml -P $HIVE_HOME/conf/
sudo cp $HIVE_HOME/conf/hive-default.xml.template $HIVE_HOME/conf/hive-default.xml
sudo cp $HIVE_HOME/conf/hive-env.sh.template $HIVE_HOME/conf/hive-env.sh
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo_distributed/core-site.xml -P $HADOOP_HOME/etc/hadoop/
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo_distributed/hdfs-site.xml -P $HADOOP_HOME/etc/hadoop/
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo_distributed/mapred-site.xml -P $HADOOP_HOME/etc/hadoop/
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo_distributed/yarn-site.xml -P $HADOOP_HOME/etc/hadoop/

