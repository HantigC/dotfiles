local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local execute = vim.api.nvim_command

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[packadd packer.nvim]]
-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  -- ########### Color scheme ############
  use { "navarasu/onedark.nvim" }
  use { 'ellisonleao/gruvbox.nvim' }
  use { "rebelot/kanagawa.nvim" }
  use { 'folke/tokyonight.nvim' }
  use { 'sainnhe/sonokai' }
  use { 'marko-cerovac/material.nvim' }
  use { "lunarvim/darkplus.nvim" }
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }
  -- ############ Fuzzy finder #############
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- ######### LSP #############
  use { 'neovim/nvim-lspconfig' }

  -- ####### Completion #########
  use {'hrsh7th/nvim-cmp'}
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }

  -- ###### Snippets ###########
  use { 'dcampos/nvim-snippy' }
  use { 'honza/vim-snippets' }
  use { 'dcampos/cmp-snippy' }

  -- ##### Git ################
  use { 'tpope/vim-fugitive' }

  -- ###### Treesitter ############
  use { "nvim-treesitter/nvim-treesitter" }
  use ({
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  -- ######## File Explorere ##########
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- ########## Status Line #########
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
