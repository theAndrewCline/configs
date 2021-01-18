execute pathogen#infect()

set number
set colorcolumn=80
set cursorline
set foldmethod=indent
set foldlevel=100

let g:mapleader = "\<Space>"

" syntax
syntax on
set termguicolors
let ayucolor="dark"
colorscheme ayu

" fzf path and command
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>

" use rg for grep
set grepprg=rg\ -S\ --vimgrep

" COC 

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" KEY MAPPINGS

map - :Ex <CR>
