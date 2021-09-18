local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

map('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })
map('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<CR>', { silent = true, noremap = true })
map('n', 'gD', 'gD <cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true, noremap = true })
map('n', 'gr', 'gD <cmd>lua vim.lsp.buf.declaration()<CR>', { silent = true, noremap = true })

map('n', '<silent> gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true })
map('n', '<silent> K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true })
map('n', '<silent>', '<C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true })
map('n', '<silent>', '<C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true })
map('n', '<silent>', '<C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true })

map('n', '<silent> gs :Lspsaga signature_hel', '<CR>', { noremap = true })

map('i', '<silent><expr> <C-Space>', 'compe#complete()', { noremap = true }) 
map('i', '<silent><expr> <TAB>', "compe#confirm('<CR>')", { noremap = true })
