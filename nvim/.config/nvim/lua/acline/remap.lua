local util = require('acline.utils')

vim.g.mapleader = ' '

util.nmap('<leader><leader>', '<C-^>', "Switch file")

-- WORK WITH BUFFERS
util.nmap('gn', ':bn<CR>', "Next buffer")
util.nmap('gp', ':bp<CR>', "Previous buffer")

-- WORK WITH SYSTEM CLIPBOARD
util.vmap('<leader>y', '"+y', "Copy to clipboard")
util.nmap('<leader>p', '"+p', "Paste from clipboard")

-- move around splits using Ctrl + {h,j,k,l}
util.nmap('<C-h>', '<C-w>h', "Move left split")
util.nmap('<C-j>', '<C-w>j', "Move down split")
util.nmap('<C-k>', '<C-w>k', "Move up split")
util.nmap('<C-l>', '<C-w>l', "Move right split")

util.nmap('<leader>o', ":OrganizeImports<CR>", "Organize imports")
