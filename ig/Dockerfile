
# Binary Ruby distributions are not yet available for Debian 11 "bullseye" as of 2022-01-01
FROM mcr.microsoft.com/vscode/devcontainers/java:11-buster

RUN apt-get update \
     && apt-get -y install curl openssl wget graphviz \
     && apt-get clean -y && rm -rf /var/lib/apt/lists/*
# RUN pip3 install --upgrade  requests zulip

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    curl -sSL https://get.rvm.io | bash -s stable

ENV PATH="/usr/local/rvm/bin:/usr/local/rvm/rubies/ruby-2.5.1/bin:${PATH}"
RUN rvm install 2.5.1
RUN gem install jekyll jekyll-asciidoc