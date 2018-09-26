## About

Haxial KDX was a popular BBS style client/server that was used and loved by many back in the early 2000's. This project attempts to keep this software running on newer machines via Docker + Ubuntu.

## Docker Repository

You can find the docker repository [here](https://hub.docker.com/r/patthiel/kdx-server/)

## Directions

1. Pull this repo
2. CD to this directory
3. Build Docker image: `docker build -t docker-kdx-server .`
4. Run Container: `docker run -td --name docker-kdx-server -p 10700:10700/tcp --restart unless-stopped docker-kdx-server`
5. If you already have a kdx server and want to migrate your files over, you can do so by mounting the files to a docker volume. Like so:
    ```bash
    docker run -td --name docker-kdx-server -p 10700:10700/tcp --restart unless-stopped -v /local/config/path:/root/KDXServer1620-Lnx docker-kdx-server
    ```
6. Also, if you use an alternative port or a specific port for file transfers, you will want to add the additional ports in the `docker run` command. These instructions assume you are only running on the default port 10700.
