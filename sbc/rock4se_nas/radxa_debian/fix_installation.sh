set -e

sudo apt purge -y openssh-server
sudo apt install -y openssh-server

sudo service ssh restart
sudo service ssh status
sudo service sshd status
