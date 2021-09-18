# My Configs

This repo contains my configurations for my development environment

My goal is that anyone could fork this repository and have a resonable starting place for their own setup.

## Setup

I decided to no provide a script for installing these core things because it is different on each OS that I use.

you will need to install

- Tmux
- Neovim
- Alacritty
- ripgrep
- fzf
- oh-my-zsh
- zsh autosuggestions and syntax-highlighting [link to gist](https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95)
- git

the setup script included will simply link config files and folders to the appropriate places

1.) - Install the above dependancies
2.) - Clone the repo to your home folder
3.) - run `cd configs && ./setup.sh`
4.) - open neovim (should be `nvim`) and run `:PackerSync` this will install all neovim plugins - Packer is bootstrapped inside the neovim config so the first time you open neovim it should download and install Packer for you

## Using

This part of the documentation will be a WIP for a bit.

## Help

Please submit an issue if you need help, I would love to help.
