execute pathogen#infect()
set number
set colorcolumn=80
set cursorline
set incsearch
set hlsearch
set mouse=a 
set wildmenu 
set list
set tabstop=2 shiftwidth=2 smarttab expandtab
set autoindent
set breakindent
set smartindent
set foldmethod=indent " allows one to fold the code based on indentation
set foldlevel=100 " all folds are open by default

syntax on
colorscheme OceanicNext

let g:airline_theme='oceanicnext'

map <C-e> :NERDTreeToggle<CR>

" mappings for vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript' : ['tsserver','tslint', 'eslint'],
      \ 'vue' : ['eslint']
      \ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'eslint']
\}

let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_fix_on_save = 1

let g:ctrlp_custom_ignore = 'node_modules'
