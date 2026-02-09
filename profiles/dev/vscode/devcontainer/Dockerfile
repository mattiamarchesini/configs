FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt upgrade -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt install -y git openssh-client ca-certificates curl gnupg python3

# Add Docker's repo
RUN sudo install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    sudo chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" >> /etc/apt/sources.list.d/docker.list
# Add just the docker cli (a docker deamon socket is supposed to be
RUN apt install -y docker-ce-cli