#!/bin/bash
printf "Installing Homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

printf "Remove old versions of docker"

sudo apt-get remove docker docker-engine docker.io containerd runc

printf "Update packages"

sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

printf "Add Docker’s official GPG key:" 

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

printf "Add Docker Repository"

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs)  stable"

printf "Install Docker Engine"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

printf "Varifing Docker Engine is installed"

sudo docker run hello-world

brew install davidalger/warden/warden

sudo service apache2 stop

warden svc up
