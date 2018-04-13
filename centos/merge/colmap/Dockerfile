
#FROM nvidia/cuda:8.0-devel-ubuntu16.04
FROM 10.4.65.226/gpu/cuda-runtime-8:1.0.0

#RUN cp /etc/apt/sources.list /etc/apt/sources.listbak

#COPY sources.list2 /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libboost-all-dev \
    libsuitesparse-dev \
    libfreeimage-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libglew-dev \
    freeglut3-dev \
    qt5-default \
    libxmu-dev \
    libxi-dev \
    libatlas-base-dev \
    libsuitesparse-dev \
  && rm -rf /var/lib/apt/lists/*

# Install Eigen 3.2.10
COPY eigen /src/eigen
RUN mkdir -p /src/eigen/build
WORKDIR /src/eigen/build
RUN cmake .. && make && make install && make clean

# Install Ceres Solver
COPY ceres-solver /src/ceres-solver
RUN mkdir -p /src/ceres-solver/build
WORKDIR /src/ceres-solver/build
RUN cmake -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF .. && make && make install && make clean

# Install Colmap
COPY colmap /src/colmap
RUN mkdir -p /src/colmap/build
WORKDIR /src/colmap/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DTESTS_ENABLED=OFF .. && make && make install && make clean

RUN apt-get update && apt-get install -y  xrdp vnc4server tightvncserver
RUN echo xfce4-session >/root/.xsession

# Delete GUI executable
#RUN rm /usr/local/bin/colmap

# Remove unnecessary packages
RUN apt-get purge -y cmake && apt-get autoremove -y

#WORKDIR /root

# Delete source files
#RUN rm -r /src

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# setup our Ubuntu sources (ADD breaks caching)
RUN echo "deb http://tw.archive.ubuntu.com/ubuntu/ trusty main\n\
deb http://tw.archive.ubuntu.com/ubuntu/ trusty multiverse\n\
deb http://tw.archive.ubuntu.com/ubuntu/ trusty universe\n\
deb http://tw.archive.ubuntu.com/ubuntu/ trusty restricted\n\
deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu trusty main\n\
" >> /etc/apt/sources.list

# no Upstart or DBus
# https://github.com/dotcloud/docker/issues/1724#issuecomment-26294856
RUN apt-mark hold initscripts udev plymouth mountall \
    && dpkg-divert --local --rename --add /sbin/initctl \
    && ln -sf /bin/true /sbin/initctl

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9316A7BC7917B12 \
    && apt-get update \
    && apt-get install -y --force-yes software-properties-common python-software-properties \
    && apt-add-repository ppa:freenx-team/trusty \
    && apt-get update \
    && apt-get install -y --force-yes --no-install-recommends supervisor wget \
       openssh-server pwgen sudo vim-tiny \
       net-tools \
       gtk2-engines-murrine ttf-ubuntu-font-family \
    && apt-get install -y --force-yes xfce4 xfce4-goodies freenx-server \
        libreoffice libreoffice-gnome firefox \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://bugs.launchpad.net/freenx-server/+bug/576359/+attachment/1378450/+files/nxsetup.tar.gz \
    && tar -xvf nxsetup.tar.gz \
    && mv nxsetup /usr/lib/nx/nxsetup \
    && rm nxsetup*

#ADD startup2.sh /
ADD startup.sh /
ADD supervisord.conf /

EXPOSE 22 4000
WORKDIR /
CMD /bin/bash