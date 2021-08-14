call plug#begin('~/.vim/plugged')

" Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install --frozen-lockfile' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim'

" TESTING
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

call plug#end()

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
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set termguicolors
set background=dark

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

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

let g:which_key_map =  {
        \ 'p': [':Files', 'Search Files'],
        \ 'a': [':CocAction', 'Code Action'],
        \ 'A':  ["<Plug>(coc-codeaction-selected)", "Coc Action Selected"],
        \ 'c': [':CocCommand', 'Code Command'],
        \ 's': [':Rg', 'Search'],
        \ 'd': [":CocDiagnostics", "Code Diagnostics"],
        \ 'g': {
                  \ "name": "Git actions",
                  \ "c": [":Git commit", "Git Commit"],
                  \ "s": [":G", "Git Status"],
                  \ "p": [":Git pull", "Git Pull"],
                  \ "P": [":Git push", "Git Push"],
          \ },
        \ 'u': [ ":so $MYVIMRC", "Refresh vimrc" ],
        \ "f": [":Goyo", "Focus Mode"],
        \ ";": [":Buffers", "List Buffers"] 
        \ }

call which_key#register("<SPACE>", "g:which_key_map")

"##############################
"###     TESTING CONFIG     ###
"##############################

lua require("trouble").setup{}
