#jdk-1.8.0_162
echo "export JAVA_HOME=/usr/java/jdk-1.8.0" > java.sh
echo "export JRE_HOME=\${JAVA_HOME}/jre" >> java.sh
echo "export CLASSPATH=.:\${JAVA_HOME}/lib:\${JRE_HOME}/lib" >> java.sh
echo "export PATH=\${JAVA_HOME}/bin:\$PATH" >> java.sh
sudo mv java.sh /etc/profile.d/

echo "export HIVE_HOME=/usr/hive/hive-1.2.2" >hive.sh
echo "export PATH=\${HIVE_HOME}/bin:\$PATH" >> hive.sh
echo "export HIVE_CONF_DIR=\${HIVE_HOME}/conf" >>hive.sh
sudo mv hive.sh /etc/profile.d/

echo "export HADOOP_HOME=/usr/hadoop/hadoop-2.9.0" > hadoop.sh
echo "export PATH=\${HADOOP_HOME}/bin:\${HADOOP_HOME}/sbin:\$PATH" >> hadoop.sh
echo "export HADOOP_CLASSPATH=.:\$CLASSPATH:\$HADOOP_CLASSPATH:\$HADOOP_HOME/lib:\$HADOOP_HOME/bin" >> hadoop.sh
sudo mv hadoop.sh /etc/profile.d/

sudo chmod u+x /etc/profile.d/java.sh
sudo chmod u+x /etc/profile.d/hadoop.sh
sudo chmod u+x /etc/profile.d/hive.sh

sudo /etc/profile.d/java.sh
sudo /etc/profile.d/hadoop.sh
sudo /etc/profile.d/hive.sh

mv jdk-8u*tar.gz* jdk-1.8.0.tar.gz
if [ -f "jdk-1.8.0.tar.gz" ]; then
echo "jdk-*.tar.gz  exists"
else
#echo "jdk-1.8.0.tar.gz  not exists"
wget http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz?AuthParam=1523417791_53e56f80fc6d4f81eee8aee67c4ddb01
fi
if [ -d "/usr/java" ]; then 
echo "/usr/java  exists"
else
sudo mkdir /usr/java
fi
mv jdk-8u* jdk-1.8.0.tar.gz
tar -zxvf jdk-1.8.0.tar.gz
sudo mv jdk1.8* $JAVA_HOME

sudo chown $USER -R /usr/java
sudo chgrp $USER -R /usr/java

#hadoop-2.9.0
if [ -f "hadoop-2.9.0.tar.gz" ]; then 
echo "hadoop-2.9.0.tar.gz  exists"
else
wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz
fi
if [ -d "/usr/hadoop" ]; then 
echo "/usr/hadoop  exists"
else
sudo mkdir /usr/hadoop
fi
sudo tar -zxvf hadoop-2.9.0.tar.gz -C /usr/hadoop/

echo "export JAVA_HOME=/usr/java/jdk-1.8.0" >>/usr/hadoop/hadoop-2.9.0/etc/hadoop/hadoop-env.sh
sudo chown $USER -R /usr/hadoop
sudo chgrp $USER -R /usr/hadoop

#hive-1.2.2
if [ -f "apache-hive-1.2.2-bin.tar.gz" ]; then 
echo "apache-hive-1.2.2-bin.tar.gz  exists"
else
wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz
fi
if [ -d "/usr/hive" ]; then 
echo "/usr/hive  exists"
else
sudo mkdir /usr/hive
fi
tar -zxvf apache-hive-1.2.2-bin.tar.gz
mv apache-hive-1.2.2-bin hive-1.2.2
sudo mv hive-1.2.2 /usr/hive/

sudo mkdir /usr/hive/warehouse
sudo mkdir /usr/hive/tmp
sudo mkdir /usr/hive/log
sudo chown $USER -R /usr/hive
sudo chgrp $USER -R /usr/hive

echo "All Done!"
