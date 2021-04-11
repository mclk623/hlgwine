FROM ubuntu
MAINTAINER Pterodactyl wine, <mclk623@163.com>
RUN sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list && \
apt update -y && \
apt install wget gcc g++ make flex bison xserver-xorg-dev unzip sudo software-properties-common zip -y && \
add-apt-repository ppa:cybermax-dexter/sdl2-backport && \
apt-get install libfaudio0 -y && \
cd && \
wget https://od.hlgmc.cn/?/wine/wine-6.2.zip && \
unzip wine-6.2.zip && \
cd wine-6.2 && \
make install && \
cd && \
rm -fr * && \
wine64 --version && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo 'Asia/Shanghai' >/etc/timezone  && \
useradd container && \
mkdir /home/container && \
chown container /home && \
chown container /home/container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]



