if [ -f "mysql-connector-java-5.1.46.tar.gz" ]; then
echo "mysql-connector-java-5.1.46.tar.gz  exists"
else
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz
fi
tar -zxvf mysql-connector-java-5.1.46.tar.gz
cp mysql-connector-java-5.1.46/mysql*.jar $HIVE_HOME/lib
rm -rf mysql-connector-java-5.1.46
wget https://raw.githubusercontent.com/JackEHolmes/Hive_install/master/local_mysql/server/hive-site.xml -P $HIVE_HOME/conf/
cp $HIVE_HOME/conf/hive-default.xml.template $HIVE_HOME/conf/hive-default.xml
cp $HIVE_HOME/conf/hive-env.sh.template $HIVE_HOME/conf/hive-env.sh
