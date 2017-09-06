FROM ubuntu:14.04
MAINTAINER Patrick Thiel "patthiel@gmail.com"

# Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y libstdc++5:i386 && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root
ENV KDX_SERVER_DOWNLOAD_URL http://kdx.technowiki.info/downloads/KDXServer1620-Lnx.zip

# Define working directory.
WORKDIR /root
COPY setup-kdx-service.sh setup-kdx-service.sh

# Expose Default KDX Server Port
EXPOSE 10700/tcp


# Define default command.
RUN sh setup-kdx-service.sh

# Copy Default KDX Settings. Default l/p: admin/admin
COPY default-Config.stg /root/KDXServer1620-Lnx/KDXServer.stg
COPY default-Accounts.dat /root/KDXServer1620-Lnx/Accounts.dat

WORKDIR /root/KDXServer1620-Lnx

CMD ["/root/KDXServer1620-Lnx/KDXServer.lexe"]