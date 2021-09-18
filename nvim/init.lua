require('plugins')
require('mappings')

local opts = vim.o

opts.nu = true
opts.rnu = true

opts.colorcolumn = '80'
opts.cursorline = true
opts.foldmethod = 'indent'
opts.foldlevel = 99 -- all folds open by default
opts.inccommand = 'split' -- show a preview of the changes by norm command
opts.mouse = 'a'
opts.encoding = 'utf-8'
opts.ruler = true
opts.conceallevel = 0 --  so I can see ` in markdown files
opts.updatetime = 300 -- faster completions
opts.timeoutlen = 500
opts.smarttab = true
opts.expandtab = true
opts.tabstop = 2 -- 2 spaces for tab
opts.shiftwidth = 2
opts.list = false

opts.termguicolors = true
opts.background = 'dark'

vim.opt.listchars = {
  space = '⋅'
}

vim.opt.completeopt='menuone,noselect'
vim.opt.rtp = vim.opt.rtp + '~/.fzf'
vim.opt.grepprg="rg\\ -S\\ --vimgrep"

vim.cmd[[colorscheme tokyonight]]
