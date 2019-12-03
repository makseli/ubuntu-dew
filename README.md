şimdiki hali idare eder 

- docker build -t makseli/ubuntu-dew:v0.34 .
- docker run -it makseli/ubuntu-dew:v0.34 

TODO 
- external bir sh dosyası sonra editlenmek ve ihtiyaca binaen çalıştırmak üzere eklenecek
- ilk maddedeki sh file ile function cd()
{
 builtin cd "$*" && ls -halF
} -> .zshrc ye eklenecek 
- .zshrc nin color u agnoster ile değiştirilecek