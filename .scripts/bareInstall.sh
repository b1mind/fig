#!/bin/bash

cd ~/
read -p "Apt Update and Install Utils? ( n ) / ( any )" input
if [ $input == "n" ]; then
  echo "Skipped Apts"
else
  sudo apt update
  sudo apt-get update
  # TODO requried installs ??

  # TODO Install more? utils
  read -p "Install nvm/python3/pip? ( n ) / ( any )" input
  if [ $input == 'n' ]; then
    echo "skipped installing packages"
  else
    sudo apt-get install python3.6 python3-pip python3-venv
    sudo wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh / root
    nvm install v14.17.0
    echo "Installs complete"
  fi

fi

read -p "Backup current figs ? ( n ) / ( any )" input
if [ $input == "n" ]; then
  echo "Skipped backup"

else
  # TODO make better backup function?
  echo "Backing up pre-existing dot files.";
  mkdir -p .fig-backup
  cp ~/.bashrc .fig-backup/.bashrc
  echo "Backed up files"
  ls -a .fig-backup

fi

# clone bare repo into tempDir and update files
echo "Cloning bare repo and staring fig setup"
git clone --separate-git-dir=$HOME/.fig -b linux https://github.com/b1mind/fig.git fig-tmp
rsync --recursive --verbose --exclude '.git' fig-tmp/ $HOME/
rm --recursive fig-tmp

function fig {
   /usr/bin/git --git-dir=$HOME/.fig/ --work-tree=$HOME $@
}

fig checkout
fig config --local status.showUntrackedFiles no
fig remote set-url origin https://github.com/b1mind/fig.git
echo ".fig" >> .gitignore

# install ? extras?
# read -p "Install vim-plug dependancies? ( n ) / ( any )" input
# if [ $input == "n" ]; then
#   echo "skipped vim-plug"

# else 
  echo "Installing vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "Install complete"
# fi

if [$editor == $vim]; then
  echo 'default editor is vim'
else
  sudo update-alternatives --config editor
fi

read -p "Install ohMyPosh? ( n ) / ( any )" input
if [ $input == "n" ]; then
  echo "skipped installing posh"

else 
  echo "Installing oh my posh"
  sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
  sudo chmod +x /usr/local/bin/oh-my-posh
  echo "Install complete"

  # read -p "Install ohMyPosh themes? ( n ) / ( any )" input
  # if [ $input == "n" ]; then
  #   echo "skipped installing posh themes"

  # else 
  #   echo "Installing posh themes"
  #   sudo apt install unzip
  #   mkdir ~/.poshthemes
  #   wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
  #   unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
  #   chmod u+rw ~/.poshthemes/*.json
  #   rm ~/.poshthemes/themes.zip
  #   echo "Install complete"
  # fi

fi

# clean up
read -p "Reload ? ( n ) / ( any )" input
if [ $input == 'n' ]; then
  echo "Reload to take effect"

  else
    clear 
    . ~/.bashrc
fi
