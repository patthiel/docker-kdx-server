## About

Haxial KDX was a popular BBS style client/server that was used and loved by many back in the early 2000's. This project attempts to keep this software running on newer machines via Docker + Ubuntu.

## Docker Repository

You can find the docker repository [here](https://hub.docker.com/r/patthiel/kdx-server/)

## Directions

1. Pull this repo
2. CD to this directory
3. Build Docker image: `docker build -t docker-kdx-server .`
4. Run Container: `docker run -td --name docker-kdx-server -p 10700:10700/tcp docker-kdx-server`
