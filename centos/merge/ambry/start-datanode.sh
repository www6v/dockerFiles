#!/bin/sh
set -e

### BEGIN INIT INFO
# Provides:           ambry-server
# Required-Start:     $syslog $remote_fs
# Required-Stop:      $syslog $remote_fs
# Default-Start:      2 3 4 5
# Default-Stop:       0 1 6
# Short-Description:  Ambry data node service.
# Description:
#  Ambry server is the daemon of data node layer, which handles the persistence and replication
#  for blobs.
### END INIT INFO

# Get lsb functions
#. /lib/lsb/init-functions

# The deploy structure will be:
## Home directory (e.g. /data/ambry/)
## |- bin/ (ambry.jar and script tools)
## |- config/ (config files)
## |- log/ (log files)
## |- ambry-server.pid (ambry server PID file)

HOME_DIR=/data/ambry
BIN_DIR=$HOME_DIR/bin
CONFIG_DIR=$HOME_DIR/config
LOG_DIR=$HOME_DIR/log
AMBRY_JAR=$BIN_DIR/ambry.jar
PIDFILE=$HOME_DIR/ambry-server.pid
JVM_JMX_OPTS=" -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false "

# Check jar file is present
if [ ! -f $AMBRY_JAR ]; then
    echo "$AMBRY_JAR not present!"
    exit 1
fi


case "$1" in
    start)
        echo "Starting Ambry server..."
        if [ ! -f $PIDFILE ]; then
            nohup java -server -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9008 -Dlog4j.configuration=file:$CONFIG_DIR/log4j.properties $JVM_JMX_OPTS \
                -jar $BIN_DIR/ambry.jar \
                --serverPropsFilePath $CONFIG_DIR/server.properties \
                --hardwareLayoutFilePath $CONFIG_DIR/HardwareLayout.json \
                --partitionLayoutFilePath $CONFIG_DIR/PartitionLayout.json \
                >> $LOG_DIR/server.log &
            echo $! > $PIDFILE
            # TODO: check start status
        else
            echo "Ambry server is already running."
        fi
        ;;

    stop)
        echo "Stopping Ambry server..."
        if [ -f $PIDFILE ]; then
            kill -15 $(cat $PIDFILE)
            rm $PIDFILE
        else
            echo "Ambry server is NOT running."
        fi
        ;;
    status)
        if [ -f $PIDFILE ]; then
            echo "Ambry server (PID: $(cat $PIDFILE)) is running..."
        else
            echo "Ambry server is stopped"
        fi
        ;;
    *)
        echo "Usage: service ambry-server {start|stop|status}"
        exit 1
        ;;
esac