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
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe' 
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'prettier/vim-prettier', { 'do': 'yarn install',  }
Plug 'ryanoasis/vim-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'yardnsm/vim-import-cost'

call plug#end()

set number
" set colorcolumn=80
" set cursorline
set foldmethod=indent
set foldlevel=99 " all folds open by default
set inccommand=split " show a preview of the changes by norm command
set mouse=a
set encoding=utf-8
set ruler
set conceallevel=0 " so I can see ` in markdown files
set updatetime=300 " faster completions
set timeoutlen=100 " faster timeout
set smarttab
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

" nnoremap - :Telescope file_browser<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {
        \ 'p': [':Telescope find_files', 'Search Files'],
        \ 'a': [':Lspsaga code_action', 'Code Action'],
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

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menuone,noselect
nnoremap <silent> gs :Lspsaga signature_help<CR>

let g:prettier#autoformat = 1
" let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0

" LUA STUFF "

lua << EOF
require('lspconfig').tsserver.setup{}
require('lspconfig').svelte.setup{}
require('lspconfig').vuels.setup{}
require('lspconfig').graphql.setup{}

require("trouble").setup {}

require('lspsaga').init_lsp_saga()

require('compe').setup { 
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
    -- ultisnips = true;
    -- luasnip = true;
  };
}

require('nvim-autopairs').setup {}

require('gitsigns').setup {
  current_line_blame = true,
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'nvim-web-devicons'.setup {
 default = true;
}
EOF




