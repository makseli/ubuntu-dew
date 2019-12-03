FROM ubuntu:latest

MAINTAINER Mustafa Akseli <verilojistik@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ENV TERM=xterm
ENV TZ=Europe/Istanbul

# install
RUN apt-get update
RUN apt-get install -y git curl ca-certificates zsh nano iputils-ping wget telnet net-tools

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change default shell to ZSH
RUN chsh -s $(which zsh)

RUN echo "alias nevarneyok='netstat -plntu'" >> ~/.zshrc

RUN cp ~/.oh-my-zsh/themes/agnoster.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./docker-run.sh /docker-run.sh
RUN chmod 755 /docker-run.sh
RUN /docker-run.sh

CMD ["/usr/bin/zsh"]
