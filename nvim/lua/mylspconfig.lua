local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup{
  capabilities = capabilities
}
require'lspconfig'.cssls.setup{
  capabilities = capabilities
}
require'lspconfig'.tailwindcss.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').svelte.setup{}
require('lspconfig').vuels.setup{}
require('lspconfig').graphql.setup{}
require('lspconfig').vls.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.gopls.setup{}

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
    title = ""
  }

  vim.lsp.buf.execute_command(params)
end

require('lspconfig').diagnosticls.setup {
  on_attach = on_attach,
  filetypes = {
    'javascript',
    'javascriptreact',
    'json',
    'typescript',
    'typescriptreact',
    'css',
    'less',
    'scss',
    'markdown',
    'pandoc',
    'vue',
    'graphql',
    'lua',
    'html',
    'go'
    -- 'php'
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  },
  init_options = {
    formatters = {
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      },
      luafmt = {
        command = 'luafmt',
        args = {}
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      html = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
      vue = 'prettier',
      graphql = 'prettier',
      lua = 'luafmt',
      go = 'gofmt'
    }
  }
}
