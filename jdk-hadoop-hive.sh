cd ~
if [ -d "hive" ]; then
echo "hive  exists"
else
mkdir hive
fi
cd hive

#jdk-1.8.0_162
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/local_mysql/server/java.sh -P /etc/profile.d/ 
export JAVA_HOME=/usr/java/jdk-1.8.0
mv jdk-8u*tar.gz* jdk-1.8.0.tar.gz
if [ -f "jdk-1.8.0.tar.gz" ]; then
echo "jdk-*.tar.gz  exists"
else
wget http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz?AuthParam=1523417791_53e56f80fc6d4f81eee8aee67c4ddb01
fi
if [ -d "/usr/java" ]; then 
echo "/usr/java  exists"
else
sudo mkdir -p /usr/java
fi
mv jdk-8u* jdk-1.8.0.tar.gz
tar -zxvf jdk-1.8.0.tar.gz
sudo mv jdk1.8* $JAVA_HOME


#hadoop-2.9.0
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/local_mysql/server/hadoop.sh -P /etc/profile.d/ 
export HIVE_HOME=/usr/hive/hive-1.2.2
if [ -f "hadoop-2.9.0.tar.gz" ]; then 
echo "hadoop-2.9.0.tar.gz  exists"
else
wget http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz
fi
if [ -d "/usr/hadoop" ]; then 
echo "/usr/hadoop  exists"
else
sudo mkdir -p /usr/hadoop
fi
sudo tar -zxvf hadoop-2.9.0.tar.gz -C /usr/hadoop/

echo "export JAVA_HOME=/usr/java/jdk-1.8.0" >>/usr/hadoop/hadoop-2.9.0/etc/hadoop/hadoop-env.sh

#hive-1.2.2
sudo wget https://github.com/JackEHolmes/hive_install/raw/master/local_mysql/server/hive.sh -P /etc/profile.d/  
export HIVE_HOME=/usr/hive/hive-1.2.2
if [ -f "apache-hive-1.2.2-bin.tar.gz" ]; then 
echo "apache-hive-1.2.2-bin.tar.gz  exists"
else
wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz
fi
if [ -d "/usr/hive" ]; then 
echo "/usr/hive  exists"
else
sudo mkdir -p /usr/hive
fi
tar -zxvf apache-hive-1.2.2-bin.tar.gz
mv apache-hive-1.2.2-bin hive-1.2.2
sudo mv hive-1.2.2 /usr/hive/

echo "All Done!"
