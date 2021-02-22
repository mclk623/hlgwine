FROM ubuntu
MAINTAINER Pterodactyl wine, <mclk623@163.com>
RUN sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
apt update -y && \
apt install wget gcc g++ make flex bison xserver-xorg-dev unzip sudo software-properties-common -y && \
add-apt-repository ppa:cybermax-dexter/sdl2-backport && \
apt-get install libfaudio0 -y && \
cd && \
wget https://od.hlgmc.cn/wine/wine.zip && \
unzip wine.zip && \
cd wine-5.9 && \
make install && \
cd && \
rm -fr wine-5.9 && \
wine64 --version && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd container
USER container
ENV USER=container HOME=/home/container
ENV LANG zh_CN.UTF-8
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]


