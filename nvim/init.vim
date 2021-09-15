lua require('plugins')

set nu rnu
set colorcolumn=80
set cursorline
set foldmethod=indent
set foldlevel=99 " all folds open by default
set inccommand=split " show a preview of the changes by norm command
set mouse=a
set encoding=utf-8
set ruler
set conceallevel=0 " so I can see ` in markdown files
set updatetime=300 " faster completions
set timeoutlen=500
set smarttab
set expandtab
set tabstop=2 " 2 spaces for tab
set shiftwidth=2

"### SYNTAX AND COLOR SETTINGS ###
syntax on
set termguicolors
set background=dark

let g:seoul256_background = 235

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme seoul256

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"

let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:tmuxline_powerline_separators = 1
let g:tmuxline_preset = 'full'

"### FZF PATH AND COMMAND ###
set rtp+=~/.fzf
nnoremap <C-p> :Telescope find_files<CR>

" use rg for grep
set grepprg=rg\ -S\ --vimgrep

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"### CUSTOM KEY MAPPINGS ###

let g:mapleader = "\<Space>"

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menuone,noselect
nnoremap <silent> gs :Lspsaga signature_help<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <TAB>     compe#confirm('<CR>')
