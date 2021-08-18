FROM golang:latest

LABEL org.opencontainers.image.authors="rootx <cslroot+github@gmail.com>"

RUN apt-get update
RUN apt-get install -y curl

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# python
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install pipenv

# reviewdog install to default: ./bin/
RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s 2>&1

COPY ./sphinx-textlint-reviewdog-bitbucket.sh /

WORKDIR /work
