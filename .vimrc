set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()

set number " show line numbers on the left
set list " displays list characters (tabs, spaces, etc)
set listchars=tab:>- " changes tabs to be >--- visually
set colorcolumn=80
set incsearch " while typing search start highlighting matches
set hlsearch " highlight all the matches when searching
set mouse=a " screw the purists, I like the option of using my mouse
set cursorline " highlights the line the cursor is on slightly
set foldmethod=indent " allows one to fold the code based on indentation
set foldlevel=100 " all folds are open by default
set wildmenu " command-line completion shows other options
set wildignore+=node_modules/* " when searching files ignore node_modules
set nocp " no one cares about being compatible with vi
set whichwrap+=<,>,h,l,[,] " allow keys to wrap to prev/next line when navigating
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 smarttab expandtab " spaces > tabs
set autoindent " new line will match previous line
set breakindent " wrapped lines are indented visually
set smartindent " syntax cued indenting

" colors
syntax enable
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set termguicolors     " enable true colors support

" this setting works in alacrity
" set term=xterm-256color

" this setting deals with slowness on escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" NerdTree stuff
let g:NERDTreeWinSize = 35
nnoremap <C-e> :NERDTreeToggle<CR>

" ale stuff
let g:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'typescript' : ['tsserver','tslint', 'eslint'],
        \ 'vue' : ['eslint'],
        \ 'rust': ['cargo', 'rls', 'clippy'],
        \ 'haskell': ['hlint']
      \ }

let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'javascript': ['prettier'],
        \   'typescript': ['prettier'],
        \   'vue': ['prettier'],
        \   'html': ['prettier'],
        \   'haskell' : ['floskell'],
        \   'rust': ['rustfmt'],
        \   'elm': ['elm-format'],
        \   'scss': ['prettier'],
        \   'css': ['prettier'],
        \   'sass': ['prettier']
        \}

let g:ale_fix_on_save = 1
let g:ctrlp_custom_ignore = 'node_modules'

" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --no-semi'

" use rg for grep
set grepprg=rg\ -S\ --vimgrep
packadd cfilter

" fzf path and command
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=500

let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" the following mapping is a shortcut for a reasonable default grepping method in vim
nnoremap <leader>f :grep! "" \| cwindow<S-left><S-left><left><left>
nnoremap <leader>p :FZF<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>b :Buffers<CR>

let g:which_key_map = {}
let g:which_key_map["f"] = "grep"
let g:which_key_map["p"] = "find file"
let g:which_key_map["e"] = "explorer"
let g:which_key_map["b"] = "switch buffer"

let g:which_key_map["*"] = "which_key_ignore"
let g:which_key_map["h"] = { "name": "which_key_ignore" }

set inccommand=nosplit

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming.
let g:which_key_map["r"] = "rename symbol"
nmap <leader>r <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
