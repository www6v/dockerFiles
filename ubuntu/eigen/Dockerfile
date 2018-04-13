FROM 10.4.65.226/library/ubt-desktop-cv:1.0.1

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