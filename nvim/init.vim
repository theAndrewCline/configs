execute pathogen#infect()

set number
set colorcolumn=80
set cursorline
set foldmethod=indent
set foldlevel=100 " all folds open by default
set inccommand=split " show a preview of the changes by norm command
set mouse=a
set encoding=utf-8
set ruler
set conceallevel=0 " so I can see ` in markdown files
set tabstop=2 " 2 spaces for tab
set updatetime=300 " faster completions
set timeoutlen=100 " faster timeout
set smarttab
set expandtab

set guifont=Dank\ Mono\:h20

"### SYNTAX AND COLOR SETTINGS ###
syntax on
set termguicolors
" let g:palenight_terminal_italics = 1
" colorscheme palenight

colorscheme ayu

let g:airline_theme='ayu'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"### FZF PATH AND COMMAND ###
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>

" use rg for grep
set grepprg=rg\ -S\ --vimgrep

"### COC SETTINGS ###

" coc prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"### CUSTOM KEY MAPPINGS ###

let g:mapleader = "\<Space>"

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nnoremap <leader>p :Files<CR>
nnoremap <leader>a :CocAction<CR>
nnoremap <leader>c :CocCommand<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>u :so $MYVIMRC<CR>
nnoremap <leader>f :Goyo<CR>

let g:which_key_map =  {}

let g:which_key_map["p"] = "Find File"
let g:which_key_map["a"] = "Coc Action"
let g:which_key_map["c"] = "Coc Command"
let g:which_key_map["g"] = {
                  \ "name": "Git actions",
                  \ "c": [":Git commit", "Git Commit"],
                  \ "s": [":G", "Git Status"],
                  \ "p": [":Git pull", "Git Pull"],
                  \ "P": [":Git push", "Git Push"],
                  \ }

let g:which_key_map["s"] = "search repository"
let g:which_key_map["u"] = "update vim config"
let g:which_key_map["f"] = "Focus Mode" " :Goyo

call which_key#register("<SPACE>", "g:which_key_map")
