FROM ubuntu:latest

MAINTAINER Mustafa Akseli <verilojistik@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ENV TERM=xterm
ENV TZ=Europe/Istanbul

# install
RUN apt-get update
RUN apt-get install -y git curl ca-certificates tmux zsh nano iputils-ping wget telnet net-tools

# Change default shell to ZSH
RUN chsh -s $(which zsh)

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN echo "alias nevarneyok='netstat -plntu'" >> ~/.zshrc
#RUN cp ~/.oh-my-zsh/themes/agnoster.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

#clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#CMD bash
CMD ["/usr/bin/zsh"]
