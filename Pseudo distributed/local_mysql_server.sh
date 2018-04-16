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
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz
fi
tar -zxvf mysql-connector-java-5.1.46.tar.gz
cp mysql-connector-java-5.1.46/mysql*-bin.jar $HIVE_HOME/lib
rm -rf mysql-connector-java-5.1.46
wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo%20distributed/hive-site.xml -P $HIVE_HOME/conf/
cp $HIVE_HOME/conf/hive-default.xml.template $HIVE_HOME/conf/hive-default.xml
cp $HIVE_HOME/conf/hive-env.sh.template $HIVE_HOME/conf/hive-env.sh
ln -s /usr/hadoop/hadoop-2.9.0/sbin/start-dfs.sh /etc/rc3.d/S07start-dfs.sh
ln -s /usr/hadoop/hadoop-2.9.0/sbin/start-yarn.sh /etc/rc3.d/S07start-yarn.sh
wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo%20distributed/core-site.xml -P $HADOOP_HOME/etc/hadoop/
wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo%20distributed/hdfs-site.xml -P $HADOOP_HOME/etc/hadoop/
wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo%20distributed/mapred-site.xml -P $HADOOP_HOME/etc/hadoop/
wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo%20distributed/yarn-site.xml -P $HADOOP_HOME/etc/hadoop/

