### Version

ubuntu-17.10  
[jdk-1.8.0](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)  
[hadoop-2.9.0](http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.9.0/)  
[hive-1.2.2](https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-1.2.2/)  

* * *

### Install and Config
    
    wget https://github.com/JackEHolmes/hive_install/raw/master/jdk-hadoop-hive.sh
    chmod +x jdk-hadoop-hive.sh  
    sudo ./jdk-hadoop-hive.sh  

    wget https://github.com/JackEHolmes/hive_install/raw/master/Pseudo_distributed/config.sh  
    chmod +x local_mysql_server.sh  
    sudo ./local_mysql_server.sh  
  
  
* * *

### Update Environment Variables and Permissions
      
      sudo su $USER
      
      source /etc/profile.d/java.sh  
      source /etc/profile.d/hadoop.sh  
      source /etc/profile.d/hive.sh  
      sudo chown $USER -R /usr/java
      sudo chgrp $USER -R /usr/java
      sudo chown $USER -R /usr/hive
      sudo chgrp $USER -R /usr/hive
      sudo chown $USER -R /usr/hadoop
      sudo chgrp $USER -R /usr/hadoop
      sudo mkdir -p /usr/hadoop/tmp
      sudo chown $USER -R /usr/hadoop/tmp
      sudo chgrp $USER -R /usr/hadoop/tmp
      hdfs namenode -format
      hadoop-daemon.sh start namenode
      hadoop-daemon.sh start datanode
      hadoop-daemon.sh start secondarynamenode
      yarn-daemon.sh start resourcemanager
      yarn-daemon.sh start nodemanager
      hdfs dfs -mkdir -p /user/hive/warehouse
      hdfs dfs -mkdir -p /user/hive/log
      hdfs dfs -mkdir -p /user/hive/tmp
      hdfs dfs -chmod 777 /user/hive/tmp



* * *
### Remove
     
    wget https://github.com/JackEHolmes/hive_install/raw/master/uninstall.sh  
    chmod +x uninstall.sh  
    sudo ./uninstall.sh   
      
