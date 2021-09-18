ln -s ~/configs/.alacritty.yml ~/.alacritty.yml

if [ $? == 0 ]; then
  printf 'linked alacritty config \n'
fi

ln -s ~/configs/.tmux.conf ~/.tmux.conf

if [ $? == 0 ]; then
  printf 'linked tmux config \n'
fi

ln -s ~/configs/nvim ~/.config/nvim

if [ $? == 0 ]; then
  printf 'linked nvim config \n'
fi
