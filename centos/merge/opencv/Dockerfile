FROM centos:7.2.1511

# Install dependencies.
run yum update -y && yum install -y \
      zlib-devel \
      bzip2-devel \
      sqlite \
      sqlite-devel \
      openssl-devel \
      freetype* \
      libpng-devel \
      libjpeg-devel\
      gcc \
      cmake \
      git \
      gtk2-devel \
      pkgconfig \
      ffmpeg \
      wget \
      && yum groupinstall -y "Development Tools"

# Install Python 3.5.2 from source
workdir /
run wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz \
      && tar xvf Python-3.5.2.tar.xz \
      && cd Python-3.5.2 \
      && ./configure --prefix=/usr/local --enable-shared \
      && make \
      && make altinstall \
      && rm -r /Python-3.5.2 \
      && rm /Python-3.5.2.tar.xz \
      && echo /usr/local/lib | tee --append  /etc/ld.so.conf.d/python3.5.2.conf \
      && ldconfig

# Install numpy
run /usr/local/bin/python3.5 -m pip install numpy

# Install OpenCV 3.1 from source
run cd /usr/local/src \
      && wget https://github.com/Itseez/opencv/archive/3.1.0.zip \
      && wget https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip \
      && unzip 3.1.0.zip\* \
      && cd opencv-3.1.0 \
      && mkdir build \
      && cd build \
      && cmake \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_C_EXAMPLES=OFF \
        -D BUILD_opencv_python3=ON \
        -D BUILD_opencv_world=ON \
        -D PYTHON_EXECUTABLE=/usr/bin/python \
        -D PYTHON3_EXECUTABLE=/usr/local/bin/python3.5 \
        -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.5/site-packages/ \
        -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib-3.1.0/modules .. \
      && make \
      && make install \
      && rm /usr/local/src/3.1.0.zip* \
      && rm -r /usr/local/src/opencv_contrib-3.1.0/ \
      && rm -r /usr/local/src/opencv-3.1.0

# Link Python3.5 as python3
run ln -s /usr/local/bin/python3.5 /usr/local/bin/python3