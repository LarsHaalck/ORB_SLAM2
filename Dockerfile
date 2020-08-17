FROM ubuntu:18.04

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    build-essential \
    cmake \
    wget \
    libopencv-dev \
    libeigen3-dev \
    libglew-dev \
    git \
    ca-certificates

RUN git clone https://github.com/stevenlovegrove/Pangolin && \
    cd Pangolin && mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Relase ../ && make install -j

COPY . /opt
RUN cd /opt && bash build.sh
CMD ["/opt/Examples/Monocular/mono_simple", "/opt/Vocabulary/ORBvoc.txt", "/opt/Examples/Monocular/simple.yaml", "/mnt"]
