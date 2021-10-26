local luasnip = require('luasnip')
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local default_opts = {noremap = true, silent = true}

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- lsp mappings
map('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<CR>', { silent = true, noremap = true })
map('n', 'gD', 'gD <cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true, noremap = true })
map('n', '<silent> gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true })
map('n', '<silent> K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
map('n', 'vrr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)

map('n', '<silent>', '<C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true })
map('n', '<silent>', '<C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true })
map('n', '<silent>', '<C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })

map('n', '<silent> gs :Lspsaga signature_help', '<CR>', { noremap = true })
