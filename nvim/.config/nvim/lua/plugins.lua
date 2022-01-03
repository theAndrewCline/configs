local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'jparise/vim-graphql'

  use {
    'goolord/alpha-nvim',
    config = function () 
      require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        plugins = {
          tmux = { enabled = false }
        }
      }
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use 'tpope/vim-commentary'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require'nvim-treesitter.configs'.setup {
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

  use {
    'nvim-lualine/lualine.nvim',
    -- requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        tabline = {
          lualine_a = {'buffers'},
          lualine_z = {'branch'}
        },
        options = {
          theme = "rose-pine",
          -- section_separators = { right = '', left = ''},
          section_separators = { right = '', left = ''},
          component_separators = { right = '', left = ''},
        }
      })
    end
  }

  use({
    'sainnhe/everforest',
    config = function ()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.cmd('colorscheme everforest')
    end
  })

  -- use({
  --     'rose-pine/neovim',
  --     as = 'rose-pine',
  --     tag = 'v0.1.0', -- Optional tag release
  --     config = function()
  --       vim.cmd('colorscheme rose-pine')
  --     end
  -- })

  use { 
    'folke/lsp-colors.nvim'
  }

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
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<TAB>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path'}
      }
    })

    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

   end
  }

  use 'ryanoasis/vim-devicons'
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-web-devicons'.setup {
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

  use { 
    'neovim/nvim-lspconfig',
    config = function() require('mylspconfig') end 
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
      require'nvim-treesitter.configs'.setup {
        autopairs = { enable = true },
        indent = { enable = true },
        highlight = { enable = true }
      }
    end
  }

  use { 
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  }
  
  use { 'yardnsm/vim-import-cost',  run = 'yarn install' }

  use 'ThePrimeagen/vim-be-good' 

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
      require('which-key-config')
    end
  }

  use 'christoomey/vim-tmux-navigator'
end)
