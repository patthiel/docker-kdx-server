FROM ubuntu:14.04
MAINTAINER Patrick Thiel "patthiel@gmail.com"

# Install
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -yq build-essential && \
  apt-get install -yq software-properties-common && \
  apt-get install -yq libstdc++5:i386 unzip wget && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

WORKDIR /app

# Expose Default KDX Server Port
EXPOSE 10700/tcp

ADD https://pat-thiel-kdx.us-east-1.linodeobjects.com/KDXServer1620-Lnx.zip /app

# Copy Default KDX Settings. Default l/p: admin/admin
COPY . .

# Fetch kdx, unpack and make executable:
RUN sh /app/setup-kdx-service.sh


CMD ["/app/KDXServer.lexe"]
