FROM tomcat:7

# 下面是一些创建者的基本信息
MAINTAINER wangwei (www6v@126.com)

ENV TZ "Asia/Shanghai"

ARG JSTORM_VERSION=2.2.1
ARG DISTRO_NAME=jstorm-${JSTORM_VERSION}
ARG JSTORM_INSTALL_PATH=/opt
ENV JSTORM_HOME ${JSTORM_INSTALL_PATH}/jstorm
ENV PATH $PATH:$JSTORM_HOME/bin

# copy Storm, untar and clean up
COPY ../file/docker-entrypoint.sh /
COPY ../file/${DISTRO_NAME}.zip /

RUN set -x && \
    unzip "/${DISTRO_NAME}.zip" -d "${JSTORM_INSTALL_PATH}/" && \
    mv "${JSTORM_INSTALL_PATH}/${DISTRO_NAME}" "$JSTORM_HOME" && \
    chmod +x "$JSTORM_HOME/bin/jstorm" && \
    rm "/${DISTRO_NAME}.zip" && \
    chmod +x "/docker-entrypoint.sh"

WORKDIR "/usr/local/tomcat/webapps"

RUN set -x && \
    cp "$JSTORM_HOME/jstorm-ui-${JSTORM_VERSION}.war" ./ && \
    mv "ROOT" "ROOT.old" && \
    ln -s "jstorm-ui-${JSTORM_VERSION}" "ROOT"

WORKDIR "/usr/local/tomcat/bin"

ENTRYPOINT ["/docker-entrypoint.sh"]