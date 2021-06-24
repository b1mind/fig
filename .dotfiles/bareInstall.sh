#!/bin/bash

# install bare script
git clone --separate-git-dir=$HOME/.fig -b linux https://github.com/b1mind/fig.git fig-tmp
rsync --recursive --verbose --exclude '.git' fig-tmp/ $HOME/
rm --recursive fig-tmp

# working but trying above method of cloning
# git clone --branch linux --bare https://github.com/b1mind/fig.git $HOME/.fig

function fig {
   /usr/bin/git --git-dir=$HOME/.fig/ --work-tree=$HOME $@
}

mkdir -p .config-backup
fig checkout

if [ $? = 0 ]; then
  echo "Checked out fig.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

fig checkout
fig config --local status.showUntrackedFiles no
echo ".fig" >> .gitignore

sudo apt install unzip

# instal ? vim-plug?
echo "Install vim-plug dependancies?"

read input
if [ $input == "y" ]; then
  echo "Installing vim-plug"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  else 
    echo "skipped vim-plug"

# TODO install ? ohMyPosh?
echo "Install ohMyPosh"
read input

if [ $input == "y" ]; then
  echo "Installing oh my posh"
  sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
  sudo chmod +x /usr/local/bin/oh-my-posh

  else 
    echo "skipped installing posh"


