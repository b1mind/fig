# install bare script
git clone --branch linux --bare https://github.com/b1mind/fig.git $HOME/.fig
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
