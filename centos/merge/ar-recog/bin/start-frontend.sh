#!/bin/sh
set -e

### BEGIN INIT INFO

# The deploy structure will be:
## Home directory (e.g. /home/ar-recog/)
## |- bin/ (ar-recog.jar and script tools)
## |- config/ (config files)
## |- lib/ (jar files)
## |- log/ (log files)
## |- recog-frontend.pid (ar-recog frontend PID file)

HOME_DIR=$(dirname $(pwd))
BIN_DIR=$HOME_DIR/bin
CONFIG_DIR=$HOME_DIR/conf
LIB_DIR=$HOME_DIR/lib
LOG_DIR=$HOME_DIR/log
PIDFILE=$HOME_DIR/recog-frontend.pid
JVM_JMX_OPTS=" -Dcom.sun.management.jmxremote.port=1100 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false "


case "$1" in
    start)
        echo "Starting ar-recog frontend..."
        if [ ! -f $PIDFILE ]; then
            nohup java -server -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9008 -Dlog4j.configuration=file:$CONFIG_DIR/log4j.properties $JVM_JMX_OPTS \
                -cp $LIB_DIR/recog-frontend-1.0-SNAPSHOT.jar:$LIB_DIR//* com.lenovo.arcloud.recog.frontend.FrontendMain \
                --serverPropsFilePath $CONFIG_DIR/frontend.properties \
                >> $LOG_DIR/frontend.log 2>&1 &
            echo $! > $PIDFILE
            # TODO: check start status
        else
            echo "ar-recog frontend is already running."
        fi
        ;;

    stop)
        echo "Stopping ar-recog frontend..."
        if [ -f $PIDFILE ]; then
            kill -15 $(cat $PIDFILE)
            rm $PIDFILE
        else
            echo "ar-recog frontend is NOT running."
        fi
        ;;
    status)
        if [ -f $PIDFILE ]; then
            echo "ar-recog frontend(PID: $(cat $PIDFILE)) is running..."
        else
            echo "ar-recog frontend is stopped"
        fi
        ;;
    *)
        echo "Usage: service ar-recog-frontend {start|stop|status}"
        exit 1
        ;;
esac