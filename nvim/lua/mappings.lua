local luasnip = require('luasnip')
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

map('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true })

-- lua snip magic
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

map("i", "<C-E>", "<Plug>luasnip-next-choice", {})
map("s", "<C-E>", "<Plug>luasnip-next-choice", {})
-- lua snip magic

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
