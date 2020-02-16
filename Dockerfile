FROM ubuntu:latest

MAINTAINER Mustafa Akseli <verilojistik@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ENV TERM=xterm
ENV TZ=Europe/Istanbul

# general purpose lib. install
RUN apt-get update --fix-missing
RUN apt-get install -f -y git curl zsh iputils-ping wget telnet net-tools ca-certificates locales nano tzdata

RUN echo "Europe/Istanbul" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

#clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

RUN git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh

#some alias
RUN sed -i 's/robbyrussell/avit/g' ~/.zshrc
RUN sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
RUN echo "alias nevarneyok='netstat -plntu'\n" >> ~/.zshrc
RUN echo "function cd()\n{\n builtin cd \"\$*\" && ls -halFt\n}\n" >> ~/.zshrc

RUN locale-gen "en_US.UTF-8" && dpkg-reconfigure locales && export LC_ALL=en_US.UTF-8

# Change default shell to ZSH
RUN chsh -s $(which zsh)

RUN locale-gen "en_US.UTF-8" && dpkg-reconfigure locales && export LC_ALL="en_US.UTF-8" && export LC_CTYPE="en_US.UTF-8"

#external file
ADD ./docker-run.sh /docker-run.sh
RUN chmod 755 /docker-run.sh
#RUN /docker-run.sh

#start terminal
CMD ["/usr/bin/zsh"]
