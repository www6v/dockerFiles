profile_args=--spring.profiles.active=test
nohup java -Xms512m -Xmx512m -XX:PermSize=128m  -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9008 -jar services/config-service-0.0.1-SNAPSHOT.jar >> /logs/config-service.log 2>&1 &
nohup java -Xms512m -Xmx512m -XX:PermSize=128m -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9009 -jar services/discovery-service-0.0.1-SNAPSHOT.jar $profile_args >> /logs/discovery-service.log 2>&1 &
./waitforit.sh
nohup java -Xms512m -Xmx512m -XX:PermSize=128m -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9010 -jar services/auth-service-0.0.1-SNAPSHOT.jar --spring.profiles.active=test >> /logs/auth-service.log 2>&1 &
nohup java -Xms512m -Xmx512m -XX:PermSize=128m  -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9012 -jar services/content-service-0.0.1-SNAPSHOT.jar --spring.profiles.active=test >> /logs/content-service.log 2>&1 &
nohup java -Xms512m -Xmx512m -XX:PermSize=128m  -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9013 -jar services/storage-service-0.0.1-SNAPSHOT.jar $profile_args >> /logs/storage-service.log 2>&1 &
nohup java -Xms1g -Xmx1g -XX:PermSize=128m  -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9014 -jar services/developer-portal-0.0.1-SNAPSHOT.war $profile_args >> /logs/developer-portal.log 2>&1 &
nohup java -Xms512m -Xmx512m -XX:PermSize=128m -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9015 -jar services/service-gateway-0.0.1-SNAPSHOT.jar $profile_args>> /logs/service-gateway.log 2>&1 &

tail -f /dev/null