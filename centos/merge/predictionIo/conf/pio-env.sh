# Safe config that will work if you expand your cluster later
SPARK_HOME=/usr/local/spark
ES_CONF_DIR=/usr/share/elasticsearch
HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
HBASE_CONF_DIR=/usr/local/hbase/conf


# Filesystem paths where PredictionIO uses as block storage.
PIO_FS_BASEDIR=$HOME/.pio_store
PIO_FS_ENGINESDIR=$PIO_FS_BASEDIR/engines
PIO_FS_TMPDIR=$PIO_FS_BASEDIR/tmp

# PredictionIO Storage Configuration
#
# This section controls programs that make use of PredictionIO's built-in
# storage facilities. Default values are shown below.

# Storage Repositories

# Default is to use PostgreSQL but for clustered scalable setup we'll use
# Elasticsearch
PIO_STORAGE_REPOSITORIES_METADATA_NAME=pio_meta
PIO_STORAGE_REPOSITORIES_METADATA_SOURCE=ELASTICSEARCH

PIO_STORAGE_REPOSITORIES_EVENTDATA_NAME=pio_event
PIO_STORAGE_REPOSITORIES_EVENTDATA_SOURCE=HBASE

# Need to use HDFS here instead of LOCALFS to enable deploying to
# machines without the local model
PIO_STORAGE_REPOSITORIES_MODELDATA_NAME=pio_model
PIO_STORAGE_REPOSITORIES_MODELDATA_SOURCE=HDFS

# Storage Data Sources, lower level that repos above, just a simple storage API
# to use

# Elasticsearch Example
PIO_STORAGE_SOURCES_ELASTICSEARCH_TYPE=elasticsearch
PIO_STORAGE_SOURCES_ELASTICSEARCH_HOME=/usr/share/elasticsearch
# The next line should match the ES cluster.name in ES config
PIO_STORAGE_SOURCES_ELASTICSEARCH_CLUSTERNAME=els-arcloud

# For clustered Elasticsearch (use one host/port if not clustered)
PIO_STORAGE_SOURCES_ELASTICSEARCH_HOSTS=els-master1,els-master2,els-slave1,els-slave2
PIO_STORAGE_SOURCES_ELASTICSEARCH_PORTS=9300,9300,9300,9300

PIO_STORAGE_SOURCES_HDFS_TYPE=hdfs
PIO_STORAGE_SOURCES_HDFS_PATH=hdfs://hadoop-master:54310/models

# HBase Source config
PIO_STORAGE_SOURCES_HBASE_TYPE=hbase
PIO_STORAGE_SOURCES_HBASE_HOME=/usr/local/hbase

# Hbase clustered config (use one host/port if not clustered)
PIO_STORAGE_SOURCES_HBASE_HOSTS=hbase-master,hbase-slave1,hbase-slave2,hbase-slave3
PIO_STORAGE_SOURCES_HBASE_PORTS=0,0,0,0