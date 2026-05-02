FROM ubuntu:24.04
LABEL maintainer="patthiel@gmail.com"

ENV TZ=America/New_York
ENV HOME /root

# 1. Setup Multi-Arch and Fix Repository Routing for ARM64/i386
RUN dpkg --add-architecture i386 && \
    echo "Types: deb\nURIs: http://ports.ubuntu.com/ubuntu-ports/\nSuites: noble noble-updates noble-backports noble-security\nComponents: main universe restricted multiverse\nArchitectures: arm64" > /etc/apt/sources.list.d/ubuntu.sources && \
    echo "Types: deb\nURIs: http://archive.ubuntu.com/ubuntu/\nSuites: noble noble-updates noble-backports\nComponents: main universe restricted multiverse\nArchitectures: i386" > /etc/apt/sources.list.d/i386.sources && \
    echo "Types: deb\nURIs: http://security.ubuntu.com/ubuntu/\nSuites: noble-security\nComponents: main universe restricted multiverse\nArchitectures: i386" >> /etc/apt/sources.list.d/i386.sources && \
    apt-get update && \
    apt-get install -yq libstdc++6:i386 unzip wget ca-certificates && \
    wget https://security.ubuntu.com/ubuntu/ubuntu/pool/universe/g/gcc-3.3/libstdc++5_3.3.6-30ubuntu2_i386.deb && \
    dpkg -i libstdc++5_3.3.6-30ubuntu2_i386.deb && \
    rm libstdc++5_3.3.6-30ubuntu2_i386.deb && \
    # 4. Cleanup
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Expose Default KDX Server Port
EXPOSE 10700/tcp

# Download KDX Binary
ADD https://pat-thiel-kdx.us-east-1.linodeobjects.com/KDXServer1620-Lnx.zip /app

# Copy Default KDX Settings. Default l/p: admin/admin
COPY . .

# Unpack and setup
RUN sh /app/setup-kdx-service.sh

CMD ["/app/KDXServer.lexe"]