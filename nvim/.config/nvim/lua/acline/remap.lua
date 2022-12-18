local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader><leader>', '<C-^>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
vim.keymap.set('n', '<C-h>', '<C-w>h', default_opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', default_opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', default_opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', default_opts)
