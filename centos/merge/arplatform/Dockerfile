FROM 10.4.65.226/linux/centos:ssh-7
VOLUME /tmp
ENV WAIT_URL http://localhost:8888/health
ENV STORAGE_BASE_PATH /storage
RUN mkdir /services  && cd /services && wget -q http://10.4.65.35:8080/hdpSoftware/platform/config-service-0.0.1-SNAPSHOT.jar \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/discovery-service-0.0.1-SNAPSHOT.jar \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/auth-service-0.0.1-SNAPSHOT.jar \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/content-service-0.0.1-SNAPSHOT.jar \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/storage-service-0.0.1-SNAPSHOT.jar \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/developer-portal-0.0.1-SNAPSHOT.war \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/service-gateway-0.0.1-SNAPSHOT.jar \
    && wget -q http://10.4.65.35:8080/hdpSoftware/platform/remote-service-0.0.1-SNAPSHOT.jar

ADD ["waitforit.sh", "startup.sh", "/"]
RUN chmod +x /waitforit.sh
RUN chmod +x /startup.sh
CMD /startup.sh