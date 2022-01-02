
FROM openjdk:11-jre-slim

RUN export DEBIAN_FRONTEND=noninteractive

# This creates a user with the name "vcode" which is the default user that vscode uses to connect to the container
ARG USERNAME=vscode
RUN useradd -m $USERNAME

ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
        groupmod --gid $USER_GID $USERNAME \
        && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
        && chown -R $USER_UID:$USER_GID /home/$USERNAME; \
    fi 

RUN apt-get update && apt-get -y install python3 python3-pip gosu openssl wget graphviz curl procps
RUN pip3 install --upgrade  requests zulip

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
    curl -sSL https://get.rvm.io | bash -s stable
ENV PATH="/usr/local/rvm/bin:/usr/local/rvm/rubies/ruby-2.5.1/bin:${PATH}"
RUN rvm install 2.5.1
RUN gem install jekyll jekyll-asciidoc