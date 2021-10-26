local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { 
    "lukas-reineke/indent-blankline.nvim",
    config = function() 
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        char = "|",
        buftype_exclude = {"terminal"}
      }
    end
  }

  use 'jparise/vim-graphql'

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
    'folke/twilight.nvim',
    config = function()
      -- doesn't work with opacity lowered
      -- require("twilight").setup {}
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
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-dadbod'

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'palenight',
          section_separators = '',
          component_separators = ''
        }
      })
    end
  }

  use 'folke/tokyonight.nvim'

  use 'shaunsingh/seoul256.nvim'

  use {
    "ellisonleao/gruvbox.nvim",
    requires = { "rktjmp/lush.nvim" }
  }

  use 'drewtempelmeyer/palenight.vim'

  use 'folke/lsp-colors.nvim'
  use { 
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup {}
    end
  }

  use { 
    'glepnir/lspsaga.nvim',
    config = function()
      require('lspsaga').init_lsp_saga()
    end
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
   end
  }

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
    config = function() 
      require('mylspconfig')
    end
  } 

  use {
      'williamboman/nvim-lsp-installer',
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

  use 'ryanoasis/vim-devicons'

  use {
    'windwp/nvim-ts-autotag',
    config = function() 
      require('nvim-ts-autotag').setup {
        filetypes = {
          'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'php'
        },
      }
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() 
      require('nvim-autopairs').setup {}

      require("nvim-autopairs.completion.cmp").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = true, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = { -- modifies the function or method delimiter by filetypes
          all = '(',
          tex = '{'
        }
      })
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

