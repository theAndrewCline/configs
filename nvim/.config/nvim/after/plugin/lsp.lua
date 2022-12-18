local lsp = require('lsp-zero')

vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

lsp.preset('recommended')

lsp.nvim_workspace()

lsp.configure('lua', {
	diagnostics = { globals = { 'vim' } }
})

lsp.setup()
