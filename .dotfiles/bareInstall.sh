#!/bin/bash

cd ~/
# clone bare repo into tempDir and update files
git clone --separate-git-dir=$HOME/.fig -b linux https://github.com/b1mind/fig.git fig-tmp
rsync --recursive --verbose --exclude '.git' fig-tmp/ $HOME/
rm --recursive fig-tmp

function fig {
   /usr/bin/git --git-dir=$HOME/.fig/ --work-tree=$HOME $@
}

# Old from when I was cloning the bare repo without tempDir..
# fig checkout
# if [ $? = 0 ]; then
#   echo "Checked out fig.";
#   else
#     echo "Backing up pre-existing dot files.";
#     mkdir -p .config-backup
#     fig checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
# fi;
# echo "Backed up files"
# ls -a .config-backup

fig checkout
fig config --local status.showUntrackedFiles no
echo ".fig" >> .gitignore

# install ? extras?
read -p "Install vim-plug dependancies? ( y ) / ( any )" input
if [ $input == "y" ]; then
  echo "Installing vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "Install complete"

  else 
    echo "skipped vim-plug"
fi

read -p "Install ohMyPosh? ( y )/( any )" input
if [ $input == "y" ]; then
  echo "Installing oh my posh"
  sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
  sudo chmod +x /usr/local/bin/oh-my-posh
  echo "Install complete"

  read -p "Install ohMyPosh themes? ( y )/( any )" input
  if [ $input == "y" ]; then
    echo "Installing posh themes"
    sudo apt install unzip
    mkdir ~/.poshthemes
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
    unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
    chmod u+rw ~/.poshthemes/*.json
    rm ~/.poshthemes/themes.zip
    echo "Install complete"

    else 
      echo "skipped installing posh themes"
  fi

  else 
    echo "skipped installing posh"
fi

# clean up
rm ~/bareInstall.sh

read -p "Reload ? ( y ) / ( any )" input
if [ $input == 'y' ]; then
  clear | bash
else
fi

