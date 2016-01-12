ln -sfv ~/.config/vimrc ~/.vimrc
ln -sfv ~/.config/git-config ~/.gitconfig
ln -sfv ~/.config/git-ignore ~/.gitignore
ln -sfv ~/.config/bash-profile ~/.bash_profile
# if ~/.vim already exists then delete it
if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi
ln -sfv ~/.config/vim ~/.vim
ln -sfv ~/.config/tmux-conf ~/.tmux.conf
ln -sfv ~/.config/ssh-config ~/.ssh/config
source ~/.bash_profile
