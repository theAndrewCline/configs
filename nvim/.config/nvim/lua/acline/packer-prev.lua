local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -----------------------------------------------------------------------------
  -- COLORS
  -----------------------------------------------------------------------------

  use { 'projekt0n/github-nvim-theme' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true, },
    config = function()
      require('github-theme').setup({ theme_style = "dark" })

      require('lualine').setup({ tabline = {
          lualine_a = { 'buffers' },
          lualine_z = { 'branch' }
        },
        options = {
          theme = "auto",
          section_separators = { right = '', left = '' },
          component_separators = { right = '', left = '' },
        }
      })
    end
  }

  use {
    'folke/lsp-colors.nvim',
    config = function()
      require'lsp-colors'.setup({})
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require 'nvim-web-devicons'.setup {
        default = true;
      }
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
      }
    end
  }

  -----------------------------------------------------------------------------
  -- FUNCTIONALITY PLUGINS
  -----------------------------------------------------------------------------

  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'christoomey/vim-tmux-navigator'

  use({
    'L3MON4D3/luasnip',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  })

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete({ }),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' }
        }
      })

    end
  }


  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-fzf-writer.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup {
        pickers = {
          file_browser = {
            initial_mode = 'normal'
          }
        }

      }
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
      require('which-key-config')
    end
  }


  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  use {
    'mhartington/formatter.nvim',
    config = function ()
      require('formatter').setup({
        filetype = {
          typescript = {
            require('formatter.filetypes.typescript').prettier
          },
          javascript = {
            require('formatter.filetypes.javascript').prettier
          },
          typescriptreact = {
            require('formatter.filetypes.typescriptreact').prettier
          },
          javascriptreact = {
            require('formatter.filetypes.javascriptreact').prettier
          },
          json = {
            require('formatter.filetypes.json').prettier
          },
          markdown = {
            require('formatter.filetypes.markdown').prettier
          },
          rust = {
            function()
              return {
                exe = "rustfmt",
                args = {"--emit=stdout"},
                stdin = true
              }
            end
          }
        }
      })
    end
  }

  use 'jose-elias-alvarez/typescript.nvim'
  use 'simrat39/rust-tools.nvim'

  use 'lewis6991/impatient.nvim'
end)
