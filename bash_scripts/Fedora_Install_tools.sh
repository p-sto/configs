#! /bin/bash

CUR_DIR=`pwd`

echo $'\n------ Updating dnf ------\n'
dnf update

dnf_install_soft="vim nedit brasero htop tmux"
dnf_install_programming="go python3 python-pip docker"

dnf install -y $dnf_install_soft 
dnf install -y $dnf_install_programming

echo $'\n------ Getting Anaconda for Python ------\n'
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda-2.3.0-Linux-x86_64.sh
chmod 775 ./Anaconda-2.3.0-Linux-x86_64.sh
./Anaconda-2.3.0-Linux-x86_64.sh
conda update anaconda

echo $'\n------ Getting Microsoft Visual Studio Code ------\n'
wget https://az764295.vo.msecnd.net/public/0.10.1-release/VSCode-linux64.zip
chmod 775 VSCode-linux64.zip
unzip VSCode-linux64.zip -d /usr/local/

echo $'\n------ Installing Texmaker for LaTeX ------\n'
wget http://www.xm1math.net/texmaker/texmaker_fedora23-4.5-xm1.x86_64.rpm
dnf install texmaker_fedora23-4.5-xm1.x86_64.rpm

echo $'\n------ Cleaning current dir -------\n'
rm -rf Anaconda*.sh
rm -rf VSCode-linux64.zip*
rm -rf texmaker_fedora*.rpm

echo $'\n------ Creating links in /usr/local/bin ------\n'
cd /usr/local/bin
ln -s ../VSCode-linux-x64/Code code
cd $CUR_DIR

echo $'\n------ Updating .bashrc ------\n'

echo $'export GOROOT=$HOME/go' > ~/.bashrc_sto
echo $'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc_sto
echo $'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> ~/.bashrc_sto
echo $'\n\n' >> ~/.bashrc_sto

echo $'\n# Aliases\n'	>> ~/.bashrc_sto
echo $'alias n="nedit"' >> ~/.bashrc_sto
echo $'alias chrome="google-chrome >/dev/null 2>&1"' >> ~/.bashrc_sto
echo $'alias nsight="./usr/local/cuda/bin/nsight"' >> ~/.bashrc_sto
echo $'alias nvcc="/usr/local/cuda/bin/nvcc"' >> ~/.bashrc_sto
echo $'alias nvvp="/usr/local/cuda/bin/nvvp"'	>> ~/.bashrc_sto
echo $'alias term="gnome-terminal"'	>> ~/.bashrc_sto

echo 'export PS1="\[\e[37m\]\t\[\e[m\] \[\e[31m\][\[\e[m\]\[\e[37m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[37m\]\h\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[37m\]:\[\e[m\]\[\e[37m\]\W\[\e[m\]\[\e[37m\]\\$\[\e[m\] "' >> ~/.bashrc_sto
echo 'source .bashrc_sto' >> ~/.bashrc
source ~/.bashrc

echo $'\n------ Finished ------\n'

