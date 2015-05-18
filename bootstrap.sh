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


# sublime text
read -p "Install Sublime Text"
wget http://c758482.r82.cf2.rackcdn.com/sublime_text_3_build_3083_x64.tar.bz2
tar vxjf sublime_text_3_build_3083_x64.tar.bz2
sudo mv sublime_text_3 /opt/
sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime
echo '[Desktop Entry]
Version=1.0
Name=Sublime Text
GenericName=Text Editor

Exec=sublime
Terminal=false
Icon=/opt/sublime_text_3/Icon/128x128/sublime-text.png
Type=Application
Categories=TextEditor;IDE;Development
X-Ayatana-Desktop-Shortcuts=NewWindow

[NewWindow Shortcut Group]
Name=New Window
Exec=sublime -n
TargetEnvironment=Cinnamon' | sudo tee -a /usr/share/applications/sublime.desktop
sudo sed -i "s/gedit.desktop/sublime.desktop/g" /usr/share/applications/defaults.list


# sublime text package control
read -p "Install Sublime Text Package Control"
wget -P ~/.config/sublime-text-3/Installed\ Packages https://sublime.wbond.net/Package%20Control.sublime-package


# git
read -p "Install git"
sudo apt-get install git


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


# webdev / rails
read -p "Install webdev dependencies"
sudo apt-get install postgresql postgresql-server-dev-all postgresql-client
sudo apt-get install mysql-client mysql-server libmysqld-dev
sudo apt-get install libsqlite3-dev
sudo apt-get install nodejs-dev
should be able to run gem install rails now


# Heroku
read -p "Install heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
