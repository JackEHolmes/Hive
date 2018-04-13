create database hive;  
create user hive@localhost identified by 'Hive_12345';  
grant all on hive.* to hive@localhost;  
  

#revoke all from hive@localhos  
#drop user hive@localhost;  
