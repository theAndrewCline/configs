#! /bin/bash

echo "Andrew Cline's Most Excellent Config Files"

date=$(date '+%Y-%m-%d--%H-%M-%S')

echo "Do you want to clone vim plugins? (y/n)"
read

if [[ $REPLY == 'y' ]]
then
  echo "ok!"
  git clone https://github.com/tpope/vim-sensible $HOME/.vim/bundle
  git clone https://github.com/tpope/vim-commentary $HOME/.vim/bundle
  git clone https://github.com/tpope/vim-surround $HOME/.vim/bundle
  git clone https://github.com/tpope/vim-fugative $HOME/.vim/bundle
  git clone https://github.com/ferranpm/vim-autopairs $HOME/.vim/bundle
  git clone https://github.com/junegunn/fzf.vim $HOME/.vim/bundle
  git clone https://github.com/morhetz/gruvbox $HOME/.vim/bundle
  git clone https://github.com/sheerun/vim-polyglot $HOME/.vim/bundle
  git clone https://github.com/w0rp/ale $HOME/.vim/bundle
  git clone https://github.com/neoclide/coc.nvim $HOME/.vim/bundle
  git clone https://github.com/scrooloose/nerdtree $HOME/.vim/bundle
else
  echo "okay you will need to install your own plugins"
fi

function check_file () {
  if [[ -f /home/$USER/$1  ]]
  then
    echo "/home/$USER/"
    echo ""
    echo "A $1 file already exists... would you like to create a bk and replace it? (y/n)"
    read
    if [[ $REPLY == "y"  ]]
    then
      mv /home/$USER/$1 /home/$USER/$1.$date.bk
      ln -s $PWD/$1 /home/$USER/$1
      echo ""
      echo "$1 updated"
      echo ""
      echo "----------"
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
    ln -s $PWD/$1 /home/$USER/$1
  fi
}

check_file ".vimrc"
check_file ".zshrc"
check_file ".alacritty.yml"

echo "Installation Complete"
echo "Special thank you to jsbarrett, jonhoo, tpope, and all the other plugin authors and inspiration"
