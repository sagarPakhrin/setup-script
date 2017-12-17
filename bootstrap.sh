#!/bin/bash

# ask for password up-front.
sudo -v


# shell
read -p "install zsh and shell (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install zsh
    sudo apt-get install curl
fi


# git
read -p "Install git (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install git
    #sudo apt-get install -f
fi


# desktop theme
read -p "Setup Desktop theme (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # gnome cupertino
    # this hangs for some reason. ctrl-c fixed it and things kept moving
    wget https://dl.opendesktop.org/api/files/download/id/1461782792/147061-Gnome-Cupertino-2.1.5.tar.gz&type=gtk3_themes&filename=147061-Gnome-Cupertino-2.1.5.tar.gz
    mkdir ~/.themes > /dev/null
    tar xvzf 147061-Gnome-Cupertino-2.1.5.tar.gz -C ~/.themes

    # numix
    sudo apt-add-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install numix-icon-theme-circle

    # terminal colors
    git clone git://github.com/pricco/gnome-terminal-colors-monokai.git
    cd gnome-terminal-colors-monokai
    sudo apt-get install dconf-cli
    ./install.sh
    cd ~

    echo "Click Themes then choose:"
    echo "  Window borders: Gnome-Cupertino"
    echo "  Icons:          Numix-Circle"
    echo "  Controls:       Mint-X-Aqua"
    echo "  Desktop:        Mint-Y-Dark"
    cinnamon-settings
fi


# chrome
read -p "Install Google Chrome (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    if sudo dpkg -i google-chrome*.deb; then
     echo 'Done'
    else
     sudo apt-get install -f
     sudo dpkg -i google-chrome*.deb
     echo 'Done'
    fi
fi


# dropbox
read -p "Install Dropbox (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
    sudo dpkg -i *dropbox_*.deb
    dropbox start -i
fi


# keeWeb
read -p "Install KeeWeb (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget https://github.com/keeweb/keeweb/releases/download/v1.3.3/KeeWeb-1.3.3.linux.x64.deb
    sudo dpkg -i KeeWeb*.deb
fi


# vim and tmux
read -p "Install vim and tmux (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install vim tmux
fi


# atom
read -p "Install Atom (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget https://atom.io/download/deb -O atom.deb
    sudo dpkg -i atom.deb

    # atom package sync
    apm install package-sync
fi


# dotfiles
read -p "set up dotfiles(Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/kevinhughes27/dotfiles.git ~/dotfiles
    chmod +x ~/dotfiles/install.sh
    ~/dotfiles/install.sh

    cd ~/dotfiles
    git remote set-url origin git@github.com:kevinhughes27/dotfiles
    cd ~
fi


# c++
if [[ $REPLY =~ ^[Yy]$ ]]; then
read -p "Install c++ dev tools (Y/y)" -n 1 -r
    sudo apt-get install build-essential
    sudo apt-get install cmake cmake-gui
fi


# ruby
read -p "Install ruby (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
    tar -xzvf chruby-0.3.9.tar.gz
    cd chruby-0.3.9
    sudo make install

    wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
    tar -xzvf ruby-install-0.6.0.tar.gz
    cd ruby-install-0.6.0/
    sudo make install

    sudo ruby-install ruby 2.4.3

    echo "source /usr/local/share/chruby/chruby.sh" >> ~/.localrc
    echo "chruby 2.4.3" >> ~/.localrc
fi


# databases
read -p "Install databases (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt-get install postgresql postgresql-server-dev-all postgresql-client
    sudo apt-get install libsqlite3-dev
    sudo apt-get install redis-server redis-tools
fi


# node
read -p "Install Node (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt-get install nodejs
fi


# Heroku
read -p "Install Heroku toolbelt (Y/y)" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi


# ToDo
read -p "Copy over my ssh and gpg keys. Press enter when finished."

read -p "Turn off recent file history (its under privacy on Mint 18). Press enter when finished."

read -p "Add data hard drive to /etc/fstab. There is a script to do this in the root dir of the drive. Press enter when finished."

read -p "Add folders on data as bookmarks in nemo and remove other folders. Press enter when finished."

read -p "Login to all the things in chrome. Press enter when finished."
