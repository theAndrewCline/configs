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
    requires = { 'kyazdani42/nvim-web-devicons', opt = true, 'projekt0n/github-nvim-theme' },
    config = function()
      require('github-theme').setup {
        theme_style = 'dark',
        dark_float = true
      }

      require('lualine').setup({
        tabline = {
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

  use { 'folke/lsp-colors.nvim' }

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
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        context_commentstring = {
          enable = true
        }
      }
    end
  }
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

  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

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

  use 'neovim/nvim-lspconfig'

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

  -----------------------------------------------------------------------------
  -- TYPESCRIPT PLUGINS
  -----------------------------------------------------------------------------

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'

end)
