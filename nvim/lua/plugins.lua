local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'Yggdroot/indentLine'
  use 'edkolev/tmuxline.vim'
  use 'jparise/vim-graphql'
  use 'junegunn/goyo.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'

  use 'vim-airline/vim-airline-themes'
  use 'vim-airline/vim-airline'

  use 'ghifarit53/tokyonight-vim'
  use 'junegunn/seoul256.vim'

  use 'folke/lsp-colors.nvim'
  use 'folke/trouble.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe' 
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'neovim/nvim-lspconfig' 
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-fzf-writer.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'projekt0n/circles.nvim'
  use 'ryanoasis/vim-devicons'
  use 'windwp/nvim-autopairs'
  use { 'yardnsm/vim-import-cost',  run = 'yarn install' }
  use 'ThePrimeagen/vim-be-good' 
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end
  }
end)
