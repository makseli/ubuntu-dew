
-> RUN 
- docker pull makseli/ubuntu-dew
- docker run -it makseli/ubuntu-dew 

-> Make your own
- git clone https://github.com/makseli/ubuntu-dew.git
- cd ubuntu-dew
- docker build -t makseli/ubuntu-dew:v1.1 .
- docker run -it makseli/ubuntu-dew:v1.1

DockerHub Url : https://hub.docker.com/r/makseli/ubuntu-dew

TODO 
- [ tamam ] external bir sh dosyası sonra editlenmek ve ihtiyaca binaen çalıştırmak üzere eklenecek
- [ tamam ] ilk maddedeki sh file ile function cd()
{
 builtin cd "$*" && ls -halF
} -> .zshrc ye eklenecek 
- .zshrc nin color u agnoster ile değiştirilecek