FROM ubuntu:latest
MAINTAINER Arek Czarnik <arekczarnik@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    netbase \
    ca-certificates \
    curl \
    xz-utils \
    libgmp3-dev \
    unzip

RUN rm -rf /var/lib/apt/lists

RUN curl -L https://github.com/commercialhaskell/stack/releases/download/v1.4.0/stack-1.4.0-linux-x86_64.tar.gz | tar zx -C /tmp

RUN mv /tmp/stack-1.4.0-linux-x86_64/stack /usr/local/bin

ENTRYPOINT /bin/bash