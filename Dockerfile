FROM ubuntu:14.04
MAINTAINER Patrick Thiel "patthiel@gmail.com"

ARG KDX_SERVER_DOWNLOAD_URL=http://kdx.technowiki.info/downloads/KDXServer1620-Lnx.zip

# Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y libstdc++5:i386 && \
  apt-get install -y unzip wget && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

WORKDIR /app

# Expose Default KDX Server Port
EXPOSE 10700/tcp


# Copy Default KDX Settings. Default l/p: admin/admin
COPY . .

# Fetch kdx, unpack and make executable:
RUN sh /app/setup-kdx-service.sh


CMD ["/app/KDXServer.lexe"]
