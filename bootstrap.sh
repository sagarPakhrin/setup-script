#!/bin/bash

# ask for password up-front.
sudo -v


# chrome
read -p "Install Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
if sudo dpkg -i google-chrome*.deb; then
 echo 'Done'
else
 sudo apt-get install -f
 sudo dpkg -i google-chrome*.deb
 echo 'Done'
fi


# dropbox
read -p "Install Dropbox"
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.0_amd64.deb
sudo dpkg -i *dropbox_*.deb
dropbox start -i


# git
read -p "Install git"
sudo apt-get install git
sudo apt-get install -f

# atom
read -p "Install Atom"
wget https://atom.io/download/deb -O atom.deb
sudo dpkg -i atom.deb

# atom package sync
apm install package-sync


# vim and tmux
read -p "Install vim and tmux"
sudo apt-get install vim tmux


# shell
read -p "install zsh and shell"
sudo apt-get install zsh
sudo apt-get install curl

read -p "set up dotfiles"
git clone https://github.com/kevinhughes27/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/install.sh
~/dotfiles/install.sh


# c++
read -p "Install c++ dev tools"
sudo apt-get install build-essential
sudo apt-get install cmake


# python
read -p "Install python packages"
sudo apt-get install python-pip
sudo apt-get install python-numpy
sudo apt-get install python-matplotlib
sudo apt-get install ipython


# ruby
read -p "Install ruby"
sudo apt-get install ruby

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9
sudo make install

wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
tar -xzvf ruby-install-0.5.0.tar.gz
cd ruby-install-0.5.0/
sudo make install

sudo ruby-install ruby 2.1.5

echo "source /usr/local/share/chruby/chruby.sh" >> ~/.localrc
echo "chruby 2.1.5" >> ~/.localrc


# databases
read -p "Install databases"
sudo apt-get install postgresql postgresql-server-dev-all postgresql-client
sudo apt-get install mysql-client mysql-server libmysqld-dev
sudo apt-get install libsqlite3-dev
sudo apt-get install redis-server redis-tools


# node
read -p "Install Node"
sudo apt-get install nodejs-dev


# Heroku
read -p "Install heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
