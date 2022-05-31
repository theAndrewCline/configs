fish_vi_key_bindings

set EDITOR nvim

fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin

fish_add_path ~/.local/flutter/bin
fish_add_path ~/.scripts
fish_add_path ~/go/bin
fish_add_path /usr/local/opt/php@7.4/bin
fish_add_path /usr/local/opt/php@7.4/sbin

set FZF_DEFAULT_COMMAND "rg --files"

alias luamake=/home/andrewcline/.config/nvim/lua-language-server/3rd/luamake/luamake

fish_add_path ~/.yarn/bin
fish_add_path ~/.config/yarn/global/node_modules/.bin

abbr -a -g ef $EDITOR ~/.config/fish/config.fish
abbr -a -g sf source ~/.config/fish/config.fish
