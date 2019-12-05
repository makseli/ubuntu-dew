
#ping apilojistik.com
echo ""
echo "STARTING docker-run.sh"
echo ""

apt-get update
apt-get install -y nano

#echo '\nfunction cd()\n{\n builtin cd "$*" && ls -halF\n}\n' >> ~/.zshrc