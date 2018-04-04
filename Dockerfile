FROM ubuntu:latest
MAINTAINER Greg Hawkins <os@curvelogic.co.uk>

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    netbase \
    ca-certificates \
    curl \
    xz-utils \
    libz-dev \
    libgmp3-dev \
    libghc-bzlib-dev \
    git \
    unzip

RUN rm -rf /var/lib/apt/lists

RUN curl -L https://github.com/commercialhaskell/stack/releases/download/v1.6.5/stack-1.6.5-linux-x86_64.tar.gz | tar zx -C /tmp
RUN mv /tmp/stack-1.6.5-linux-x86_64/stack /usr/local/bin
RUN curl -L https://github.com/rubik/stack-hpc-coveralls/releases/download/v0.0.4.0/shc-linux-x64-7.8.4.tar.bz2 | tar jx -C /tmp
RUN mv /tmp/shc /usr/bin
RUN stack setup

ENTRYPOINT /bin/bash
