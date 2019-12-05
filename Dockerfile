FROM ubuntu:latest

MAINTAINER Mustafa Akseli <verilojistik@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ENV TERM=xterm
#ENV TZ=Europe/Istanbul

# general purpose lib. install
RUN apt-get update
RUN apt-get install -y git curl ca-certificates zsh iputils-ping wget telnet net-tools

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change default shell to ZSH
RUN chsh -s $(which zsh)

#some alias
RUN echo "alias nevarneyok='netstat -plntu'" >> ~/.zshrc

#clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#external file
ADD ./docker-run.sh /docker-run.sh
RUN chmod 755 /docker-run.sh
RUN /docker-run.sh

#start terminal
CMD ["/usr/bin/zsh"]