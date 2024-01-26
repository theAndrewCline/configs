return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "simrat39/rust-tools.nvim"
    },
    config = function()
      local lsp = require("lspconfig")
      local utils = require("acline.utils")
      local rt = require("rust-tools")

      vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
      -- Diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      local diagnostic_signs = {
        { name = "DiagnosticSignError", text = "●" },
        { name = "DiagnosticSignWarn", text = "●" },
        { name = "DiagnosticSignHint", text = "●" },
        { name = "DiagnosticSignInfo", text = "●" },
      }

      for _, sign in ipairs(diagnostic_signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
      end


      local on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        vim.opt.omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

        utils.nmap('<leader>r', vim.lsp.buf.rename, '[R]ename')
        utils.nmap('<leader>a', vim.lsp.buf.code_action, 'Code [A]ction')

        utils.nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        utils.nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        utils.nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        utils.nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        utils.nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        utils.nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        utils.nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        utils.nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        utils.nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        utils.nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        utils.nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')

        utils.nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end

      lsp.lua_ls.setup {
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
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

      lsp.denols.setup {
        on_attach = on_attach,
      }

      -- local function organize_imports()
      --   local params = {
      --     command = "_typescript.organizeImports",
      --     arguments = { vim.api.nvim_buf_get_name(0) },
      --     title = ""
      --   }
      --   vim.lsp.buf.execute_command(params)
      -- end
      --
      --
      -- local on_attach_ts = function(client, bufnr)
      --   local augroup = vim.api.nvim_create_augroup("TypescriptFmt", {})
      --
      --   utils.nmap('<leader>r', vim.lsp.buf.rename, '[R]ename')
      --   utils.nmap('<leader>a', vim.lsp.buf.code_action, 'Code [A]ction')
      --
      --   utils.nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      --   utils.nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      --   utils.nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      --   utils.nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      --   utils.nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      --   utils.nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      --
      --   -- See `:help K` for why this keymap
      --   utils.nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      --   utils.nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')
      --
      --   -- Lesser used LSP functionality
      --   utils.nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      --   utils.nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      --   utils.nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      --
      --   utils.nmap('<leader>wl', function()
      --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      --   end, '[W]orkspace [L]ist Folders')
      -- end
      --
      -- lsp.tsserver.setup {
      --   on_attach = on_attach_ts,
      --   root_dir = lsp.util.root_pattern("package.json"),
      --   single_file_support = false,
      --   commands = {
      --     OrganizeImports = {
      --       organize_imports,
      --       description = "Organize Imports"
      --     },
      --   }
      -- }

      lsp.marksman.setup {
        on_attach = on_attach,
      }

      lsp.nil_ls.setup {
        on_attach = on_attach,
      }

      lsp.gopls.setup {
        on_attach = on_attach,
      }

      rt.setup({
        tools = {
          inlay_hints = {
            only_current_line = true,
          },
        },
        server = {
          on_attach = on_attach,
        },
      })

      lsp.terraformls.setup {
        on_attach = on_attach,
      }

      lsp.zls.setup {
        on_attach = on_attach,
      }
    end
  }
}
