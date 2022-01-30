local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup{
  capabilities = capabilities
}
require'lspconfig'.cssls.setup{
  capabilities = capabilities
}
require'lspconfig'.tailwindcss.setup{}
require('lspconfig').tsserver.setup{
  capabilities = capabilities
}
require('lspconfig').svelte.setup{}
-- require('lspconfig').vuels.setup{}
require('lspconfig').volar.setup{}
-- require('lspconfig').graphql.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ["rust_analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
}
require'lspconfig'.dockerls.setup{}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

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
    'go',
    'rust'
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
      markdown = 'prettier',
      vue = 'prettier',
      graphql = 'prettier',
      lua = 'luafmt',
      go = 'gofmt',
      rust = 'rustfmt'
    }
  }
}
