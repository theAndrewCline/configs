" TODO: add binding for jumping to definition
"
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'jparise/vim-graphql'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'liuchengxu/vim-which-key'
" TESTING Native LSP
" Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install --frozen-lockfile' }
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim'

" TESTING
Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/nvim-compe' 
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

set number
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
set timeoutlen=100 " faster timeout
set expandtab
set tabstop=2 " 2 spaces for tab
set shiftwidth=2

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
nnoremap <C-p> :Telescope file_browser<CR>

" use rg for grep
set grepprg=rg\ -S\ --vimgrep

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
        \ 'p': [':Telescope file_browser', 'Search Files'],
        \ 'a': [':Telescope lsp_code_actions', 'Code Action'],
        \ 's': [':Rg', 'Search'],
        \ 'd': [":Telescope lsp_workspace_diagnostics", "Code Diagnostics"],
        \ 'g': {
                  \ "name": "Git actions",
                  \ "c": [":Git commit", "Git Commit"],
                  \ "s": [":G", "Git Status"],
                  \ "p": [":Git pull", "Git Pull"],
                  \ "P": [":Git push", "Git Push"],
          \ },
        \ 'u': [ ":so $MYVIMRC", "Refresh vimrc" ],
        \ "f": [":Goyo", "Focus Mode"],
        \ ";": [":Telescope buffers", "List Buffers"] 
        \ }

call which_key#register("<SPACE>", "g:which_key_map")

"##############################
"###     TESTING CONFIG     ###
"##############################
lua require('lspconfig').tsserver.setup{}
lua require('lspconfig').svelte.setup{}
lua require('lspconfig').vuels.setup{}
lua require('lspconfig').graphql.setup{}

lua require('lspsaga').init_lsp_saga()

lua << EOF
require('gitsigns').setup {
  current_line_blame = false,
}
EOF


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua << EOF
require'nvim-web-devicons'.setup {
 default = true;
}
EOF

lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
