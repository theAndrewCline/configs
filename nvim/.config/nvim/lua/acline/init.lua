require('acline.packer')
require('acline.remap')

vim.o.nu = true
vim.opt.rnu = true

vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99 -- all folds open by default
vim.opt.inccommand = 'split' -- show a preview of the changes by norm command
vim.opt.mouse = 'a'
vim.opt.encoding = 'utf-8'
vim.opt.ruler = true
vim.opt.updatetime = 300 -- faster completions
vim.opt.timeoutlen = 500
vim.opt.wrap = false

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2 -- 2 spaces for tab
vim.opt.shiftwidth = 2

vim.opt.list = false

vim.opt.termguicolors = true

vim.opt.listchars = {
  space = '⋅'
}

vim.opt.completeopt = 'menuone,noselect'
vim.opt.rtp = vim.opt.rtp + '~/.fzf'
vim.opt.grepprg = "rg\\ -S\\ --vimgrep"

vim.opt.background = "dark"

vim.cmd('packadd cfilter')
