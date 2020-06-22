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
set term=xterm-256color

" NerdTree stuff
let g:NERDTreeWinSize = 20
nnoremap <C-e> :NERDTreeToggle<CR>

" ale stuff
let g:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'typescript' : ['tsserver','tslint', 'eslint'],
        \ 'vue' : ['eslint'],
        \ 'rust': ['cargo', 'rls', 'rustc']
      \ }
let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint', 'eslint'],
        \   'rust': ['rustfmt' ]
        \}
let g:ale_fix_on_save = 1
let g:ctrlp_custom_ignore = 'node_modules'

" use rg for grep
set grepprg=rg\ -S\ --vimgrep

packadd cfilter

" fzf path and command
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :Files<CR>
