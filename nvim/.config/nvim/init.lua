require('plugins')
require('mylspconfig')
require('mappings')

require("trouble").setup {}

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


require("luasnip/loaders/from_vscode").load({ paths = { "~/configs/nvim/snips" } })
require("luasnip/loaders/from_vscode").lazy_load()

vim.cmd('packadd cfilter')
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight Normal ctermbg=none]])
vim.cmd([[highlight NonText ctermbg=none]])

local lsp = {
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
  },
  diagnostic = {
    -- virtual_text = true,
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
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
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
