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
opts.updatetime = 300 -- faster completions
opts.timeoutlen = 500

opts.guifont = "FiraCode Nerd Font:h18"

opts.smarttab = true
opts.expandtab = true
opts.tabstop = 2 -- 2 spaces for tab
opts.shiftwidth = 2

opts.list = false

opts.termguicolors = true

vim.opt.listchars = {
  space = '⋅'
}

vim.opt.completeopt='menuone,noselect'
vim.opt.rtp = vim.opt.rtp + '~/.fzf'
vim.opt.grepprg="rg\\ -S\\ --vimgrep"

vim.o.background = "dark"
vim.cmd[[syntax on]]

require("luasnip/loaders/from_vscode").load({ paths = { "~/configs/nvim/snips" } })
require("luasnip/loaders/from_vscode").lazy_load()

vim.cmd('packadd cfilter')
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight Normal ctermbg=none]])
vim.cmd([[highlight NonText ctermbg=none]])
