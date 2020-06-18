#! /usr/bin/env bash

echo "** Andrew Cline's Most Excellent Config Files **"
echo ""

date=$(date '+%Y-%m-%d--%H-%M-%S')

echo "Do you want to clone vim plugins? (y/n)"
read

if [[ $REPLY == 'y' ]]
then
  echo "ok!"
  git clone https://github.com/tpope/vim-sensible $HOME/.vim/bundle/vim-sensible
  git clone https://github.com/tpope/vim-commentary $HOME/.vim/bundle/vim-commentary
  git clone https://github.com/tpope/vim-surround $HOME/.vim/bundle/vim-surround
  git clone https://github.com/tpope/vim-fugitive $HOME/.vim/bundle/vim-fugitive
  git clone https://github.com/ferranpm/vim-autopairs $HOME/.vim/bundle/vim-autopairs
  git clone https://github.com/junegunn/fzf.vim $HOME/.vim/bundle/fzf.vim
  git clone https://github.com/morhetz/gruvbox $HOME/.vim/bundle/gruvbox
  git clone https://github.com/sheerun/vim-polyglot $HOME/.vim/bundle/vim-polyglot
  git clone https://github.com/w0rp/ale $HOME/.vim/bundle/ale
  git clone https://github.com/neoclide/coc.nvim $HOME/.vim/bundle/coc.nvim
  git clone https://github.com/scrooloose/nerdtree $HOME/.vim/bundle/nerdtree
  echo"\n"
else
  echo "okay you will need to install your own plugins"
  echo"\n"
fi

function check_file () {
  if [[ -f $HOME/$1  ]]
  then
    echo "in $HOME/"
    echo "A $1 file already exists... "
    echo "would you like to create a bk and replace it? (y/n)"
    read
    if [[ $REPLY == "y"  ]]
    then
      mv $HOME/$1 $HOME/$1.$date.bk
      ln -s $PWD/$1 $HOME/$1
      echo "----------"
      echo ""
      echo "$1 updated"
    else
      echo ""
      echo "$1 not changed"
      echo ""
      echo "----------"
    fi
  else
    echo ""
    echo "$1 updated"
    echo ""
    echo "----------"
    ln -s $PWD/$1 $HOME/$1
  fi
}

check_file ".vimrc"
check_file ".zshrc"
check_file ".bashrc"
check_file ".tmux.conf"

echo ""
echo "would you like to install alacritty config? (y/n)"
read
if [[ $REPLY == "y" ]]
  then
    check_file ".alacritty.yml"
    echo ""
    echo "alacrity config installed"
  else
    echo ""
    echo "alacrity config not installed"
fi

echo ""
echo "Installation Complete"
echo ""
echo "** Special thank you to jsbarrett, jonhoo, tpope, and all the other inspirations and plugin authors **"
echo "** Please submit any issues to https://www.github.com/theAndrewCline/configs **"
