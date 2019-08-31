#! /bin/bash

CUR_DIR=`pwd`

echo $'\n------ Adding repos ------\n'
add-apt-repository ppa:nathan-renniewaldock/flux
add-apt-repository ppa:deadsnakes/ppa

wget https://dl.google.com/linux/linux_signing_key.pub
apt-key add linux_signing_key.pub

echo $'\n------ Updating apt-get ------\n'
apt-get update

apt install curl
apt-get -y install fluxgui
apt-get -y install python3.6
apt-get -y install python3.7
apt-get -y install python3-pip
apt-get -y install virtualenv
apt-get -y install vim
apt-get -y install docker
apt-get -y install rustc
apt-get -y install postgresql
apt-get -y install libpq-dev
rm -rf rustup.sh
apt install google-chrome-stable
snap install pycharm-community --classic


echo 'export PS1="\[\e[37m\]\t\[\e[m\] \[\e[31m\][\[\e[m\]\[\e[37m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[37m\]\h\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[37m\]:\[\e[m\]\[\e[37m\]\W\[\e[m\]\[\e[37m\]\\$\[\e[m\] "' > ~/.bashrc_pawel
echo 'source "$HOME/.bashrc_pawel"' >> ~/.bashrc
source ~/.bashrc

echo $'\n------ Done ------\n'
