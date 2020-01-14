mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/tpope/vim-sensible
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/mattn/emmet-vim
git clone https://github.com/w0rp/ale
git clone https://github.com/mhartington/oceanic-next
