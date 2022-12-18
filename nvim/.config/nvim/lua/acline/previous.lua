require('plugins')
require('impatient')
require("mason").setup()
require("mason-lspconfig").setup()
require('mylspconfig')
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

vim.opt.completeopt = 'menuone,noselect'
vim.opt.rtp = vim.opt.rtp + '~/.fzf'
vim.opt.grepprg = "rg\\ -S\\ --vimgrep"

vim.o.background = "dark"
vim.cmd [[syntax on]]

vim.cmd('packadd cfilter')

local lsp = {
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
  },
  diagnostic = {
    virtual_text = { spacing = 4, prefix = "●" },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
  },
}

-- Diagnostic signs
local diagnostic_signs = {
  { name = "DiagnosticSignError", text = "●" },
  { name = "DiagnosticSignWarn", text = "●" },
  { name = "DiagnosticSignHint", text = "●" },
  { name = "DiagnosticSignInfo", text = "●" },
}
for _, sign in ipairs(diagnostic_signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- Diagnostic configuration
vim.diagnostic.config(lsp.diagnostic)

-- Hover configuration
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)

-- Signature help configuration
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)

require 'nvim-treesitter.configs'.setup {
  indent = { enable = true },
  highlight = { enable = true },
}


-- FORMATTING

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*" },
  command = "FormatWrite"
})
