echo "installing apt packages"

apt install git
apt install vim
apt install tmux
apt install zsh

echo "installing oh-my-zsh"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing oh-my-tmux"

git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "installing vim pluggins"

mkdir ~/.vim/bundle
mkdir ~/.vim/autoload

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
