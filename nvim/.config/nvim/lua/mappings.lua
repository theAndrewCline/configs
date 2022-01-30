local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = ' '

map('n', '<leader><leader>', '<C-^>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- lsp mappings
map('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<CR>', default_opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', default_opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', 'vrr', '<cmd>lua vim.lsp.buf.references()<CR>', default_opts)

map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',default_opts)
map('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opts)
map('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opts)
