FROM 10.4.65.226/library/ubt16-desktop:1.0.2
MAINTAINER wangwei (www6v@126.com)

ARG OPENCV_VERISON="3.1.0"

# install dependencies
RUN apt-get update
RUN apt-get install -y gcc g++
RUN apt-get install -y libopencv-dev yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils pkg-config
RUN apt-get install -y curl build-essential checkinstall cmake

# download opencv
RUN curl -sL https://github.com/Itseez/opencv/archive/$OPENCV_VERISON.tar.gz | tar xvz -C /tmp
RUN mkdir -p /tmp/opencv-$OPENCV_VERISON/build

WORKDIR /tmp/opencv-$OPENCV_VERISON/build

# install
RUN cmake -DCMAKE_BUILD_TYPE=RELEASE -DWITH_FFMPEG=1 -DWITH_OPENEXR=OFF -DBUILD_TIFF=OFF -DWITH_CUDA=OFF -DWITH_NVCUVID=OFF -DBUILD_PNG=OFF -DBUILD_SHARED_LIBS=OFF ..
RUN make
RUN make install

# configure
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
RUN ldconfig
RUN ln /dev/null /dev/raw1394 # hide warning - http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394

# cleanup package manager
RUN apt-get remove --purge -y curl build-essential checkinstall cmake
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir /source

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]