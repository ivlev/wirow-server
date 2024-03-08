#! /bin/bash
apt install sudo &&
sudo apt update &&
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl-dev_1.1.0g-2ubuntu4_amd64.deb
sudo dpkg -i libssl-dev_1.1.0g-2ubuntu4_amd64.deb
clear
sudo apt install apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb\_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
sudo apt update &&
clear
sudo apt install docker-ce &&
sudo systemctl status docker
mkdir ./docker
cd ./docker
clear
wget https://github.com/wirow-io/wirow-server/blob/master/docker/Dockerfile &&
wget https://github.com/wirow-io/wirow-server/blob/master/docker/wirow.ini &&
docker build --no-cache --force-rm -t wirow .
