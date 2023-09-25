vim.g.mapleader = ' '

local function nmap(key, cmd, desc)
  vim.keymap.set('n', key, cmd, { desc = desc, noremap = true, silent = true })
end

local function vmap(key, cmd, desc)
  vim.keymap.set('v', key, cmd, { desc = desc, noremap = true, silent = true })
end


nmap('<leader><leader>', '<C-^>', "Switch file")

-- WORK WITH BUFFERS
nmap('gn', ':bn<CR>', "Next buffer")
nmap('gp', ':bp<CR>', "Previous buffer")

-- WORK WITH SYSTEM CLIPBOARD
vmap('<leader>y', '"+y', "Copy to clipboard")
nmap('<leader>p', '"+p', "Paste from clipboard")

-- move around splits using Ctrl + {h,j,k,l}
nmap('<C-h>', '<C-w>h', "Move left split")
nmap('<C-j>', '<C-w>j', "Move down split")
nmap('<C-k>', '<C-w>k', "Move up split")
nmap('<C-l>', '<C-w>l', "Move right split")
