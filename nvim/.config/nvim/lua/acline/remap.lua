vim.g.mapleader = ' '

local function nmap(key, cmd, desc)
  vim.keymap.set('n', key, cmd, { desc = desc, noremap = true, silent = true})
end

nmap('<leader><leader>', '<C-^>', "Switch file")

nmap('<leader>n', ':bn<CR>', "Next buffer")
nmap('<leader>p', ':bp<CR>', "Next buffer")

-- move around splits using Ctrl + {h,j,k,l}
nmap('<C-h>', '<C-w>h', "Move left split")
nmap('<C-j>', '<C-w>j', "Move down split")
nmap('<C-k>', '<C-w>k', "Move up split")
nmap('<C-l>', '<C-w>l', "Move right split")
