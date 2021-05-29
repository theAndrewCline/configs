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

set guifont=Dank\ Mono\:h24

"### SYNTAX AND COLOR SETTINGS ###
syntax on
set termguicolors
" let g:palenight_terminal_italics = 1
" colorscheme palenight

let ayucolor="dark" " for mirage version of theme
colorscheme ayu

" let g:everforest_background = 'medium'
" colorscheme everforest


" let g:airline_theme=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"### FZF PATH AND COMMAND ###
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>

" use rg for grep
set grepprg=rg\ -S\ --vimgrep

"### COC SETTINGS ###

" coc prettier

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"### CUSTOM KEY MAPPINGS ###

let g:mapleader = "\<Space>"

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

nnoremap <leader>p :Files<CR>
nnoremap <leader>a :CocAction<CR>
nnoremap <leader>c :CocCommand<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>u <CR>

let g:which_key_map =  {}

let g:which_key_map["p"] = "Find File"
let g:which_key_map["a"] = "Coc Action"
let g:which_key_map["A"] = ["<Plug>(coc-codeaction-selected)", "Coc Action Selected"]
let g:which_key_map["c"] = "Coc Command"
let g:which_key_map["d"] = [":CocDiagnostics", "Code Diagnostics"]
let g:which_key_map["g"] = {
                  \ "name": "Git actions",
                  \ "c": [":Git commit", "Git Commit"],
                  \ "s": [":G", "Git Status"],
                  \ "p": [":Git pull", "Git Pull"],
                  \ "P": [":Git push", "Git Push"],
                  \ }

let g:which_key_map["s"] = "search repository"
let g:which_key_map["u"] = [ "update vim config", ":so $MYVIMRC" ]
let g:which_key_map["f"] = [ "Focus Mode", ":Goyo"] 

call which_key#register("<SPACE>", "g:which_key_map")
