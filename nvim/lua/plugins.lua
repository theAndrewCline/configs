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

  -- use 'junegunn/goyo.vim'

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }

  use 'tpope/vim-commentary'

  use 'tpope/vim-fugitive'

  use 'tpope/vim-repeat'

  use 'tpope/vim-surround'

  use 'tpope/vim-vinegar'


  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        options = {
          theme = 'tokyonight'
        }
      })
    end
  }

  use 'folke/tokyonight.nvim'

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

  use {
    'L3MON4D3/LuaSnip',
  }

  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('compe').setup { 
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        resolve_timeout = 800,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = {
          border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
          winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
        },

        source = {
          path = true,
          buffer = true,
          calc = true,
          nvim_lsp = true,
          nvim_lua = true,
          lua_snip = true,
        },
      }
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

  use 'nvim-lua/plenary.nvim'

  use 'nvim-telescope/telescope-fzf-writer.nvim'

  use 'nvim-telescope/telescope.nvim'

  use { 
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true
        }
      }
    end
 
  }

  use 'ryanoasis/vim-devicons'

  use {
    'windwp/nvim-autopairs',
    config = function() 
      require('nvim-autopairs').setup {}

      require("nvim-autopairs.completion.compe").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` after select function or method item
        auto_select = false,  -- auto select first item
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
end)

