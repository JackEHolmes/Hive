hdfs dfs -rm -r /wc/ouput
echo -e 'hadoop mapreduce hive\nhbase spark storm\nsqoop hadoop hive\nspark hadoop'>input.txt
hdfs dfs -mkdir /wc
hdfs dfs -put input.txt /wc
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.9.0.jar wordcount /wc/input.txt /wc/ouput
hdfs dfs -cat /wc/ouput/*

hdfs dfs -rm -r /wc
rm input.txt
