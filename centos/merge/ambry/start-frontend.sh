#!/bin/sh
set -e

### BEGIN INIT INFO
# Provides:           ambry-frontend
# Required-Start:     $syslog $remote_fs
# Required-Stop:      $syslog $remote_fs
# Default-Start:      2 3 4 5
# Default-Stop:       0 1 6
# Short-Description:  Ambry frontend service.
# Description:
#  Ambry frontend is the daemon of frontend service layer, which provides RESTFul API for blob
#  PUT, GET, HEAD, DELETE operation.
### END INIT INFO

# Get lsb functions
#. /lib/lsb/init-functions

# The deploy structure will be:
## Home directory (e.g. /data/ambry/)
## |- bin/ (ambry.jar and script tools)
## |- config/ (config files)
## |- log/ (log files)
## |- ambry-frontend.pid (ambry frontend PID file)

HOME_DIR=/data/ambry
BIN_DIR=$HOME_DIR/bin
CONFIG_DIR=$HOME_DIR/config
LOG_DIR=$HOME_DIR/log
AMBRY_JAR=$BIN_DIR/ambry.jar
PIDFILE=$HOME_DIR/ambry-frontend.pid
JVM_JMX_OPTS=" -Dcom.sun.management.jmxremote.port=1100 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false "

# Check jar file is present
if [ ! -f $AMBRY_JAR ]; then
    echo "$AMBRY_JAR not present!"
    exit 1
fi

case "$1" in
    start)
        echo "Starting Ambry frontend..."
        if [ ! -f $PIDFILE ]; then
            nohup java -server -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9008 -Dlog4j.configuration=file:$CONFIG_DIR/log4j.properties $JVM_JMX_OPTS \
                -cp $BIN_DIR/ambry.jar com.github.ambry.frontend.AmbryFrontendMain \
                --serverPropsFilePath $CONFIG_DIR/frontend.properties \
                --hardwareLayoutFilePath $CONFIG_DIR/HardwareLayout.json \
                --partitionLayoutFilePath $CONFIG_DIR/PartitionLayout.json \
                >> $LOG_DIR/frontend.log 2>&1 &
            echo $! > $PIDFILE
            # TODO: check start status
        else
            echo "Ambry frontend is already running."
        fi
        ;;

    stop)
        echo "Stopping Ambry frontend..."
        if [ -f $PIDFILE ]; then
            kill -15 $(cat $PIDFILE)
            rm $PIDFILE
        else
            echo "Ambry frontend is NOT running."
        fi
        ;;
    status)
        if [ -f $PIDFILE ]; then
            echo "Ambry frontend(PID: $(cat $PIDFILE)) is running..."
        else
            echo "Ambry frontend is stopped"
        fi
        ;;
    *)
        echo "Usage: service ambry-frontend {start|stop|status}"
        exit 1
        ;;
esac