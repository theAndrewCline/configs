execute pathogen#infect()

set number
set colorcolumn=80
set cursorline
set foldmethod=indent
set foldlevel=100
" the following line shows a preview of changes by norm and other commands
set inccommand=split 
set mouse=a

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

" nnoremap - :Ex <CR>

" Which Key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nnoremap <leader>p :Files<CR>
nnoremap <leader>a :CocAction<CR>
nnoremap <leader>c :CocCommand<CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>u :so $MYVIMRC<CR>

let g:which_key_map =  {}
let g:which_key_map["p"] = "find file"
let g:which_key_map["a"] = "Coc Action"
let g:which_key_map["c"] = "Coc Command"
let g:which_key_map["g"] = "Git Status"
let g:which_key_map["s"] = "search repository"
let g:which_key_map["u"] = "update vim config"

call which_key#register("<SPACE>", "g:which_key_map")
