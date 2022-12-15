FROM btguigushi/centos:centos7.9.2009.build-gcc

# RUN yum update -y && yum install wget tar bzip2 zlib-devel gcc gcc-c++ texinfo make -y

WORKDIR /root/gcc
COPY gcc-12.2.0 gcc-12.2.0
# RUN wget http://ftp.gnu.org/gnu/gcc/gcc-12.2.0/gcc-12.2.0.tar.gz && tar -zxvf gcc-12.2.0.tar.gz

WORKDIR /root/gcc/gcc-12.2.0
RUN ./contrib/download_prerequisites && mkdir build && cd build &&
  ../configure --prefix=/usr/local/gcc-12.2.0 \
    --enable-bootstrap \
    --with-system-zlib \
    --enable-threads=posix \
    --enable-checking=release \
    --enable-languages=c,c++ \
    --disable-multilib &&
  make -j$(nproc)

WORKDIR /root/gcc
