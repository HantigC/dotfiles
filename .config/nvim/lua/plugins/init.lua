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
  -- Color scheme
  use { "navarasu/onedark.nvim" }
  use { 'ellisonleao/gruvbox.nvim' }
  use { "rebelot/kanagawa.nvim" }
  use { "marko-cerovac/material.nvim" }
  use { "lunarvim/darkplus.nvim" }
  -- An implementation of the Popup API from vim in Neovim
  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  -- use "nvim-telescope/telescope.nvim"
  -- use 'nvim-telescope/telescope-media-files.nvim'
  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-compe' }
  use { 'neovimhaskell/haskell-vim' }
  use { 'tpope/vim-fugitive' }

  -- Lua development
  -- use { 'tjdevries/nlua.nvim' }
  use { "nvim-treesitter/nvim-treesitter" }
  use {
    "sheerun/vim-polyglot",
    requires = {
      {
        "m-demare/hlargs.nvim",
        config = function()
          require('hlargs').setup()
        end
      }
    }

  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- use {
  --     "nvim-treesitter/nvim-treesitter",
  --     event = "BufRead",
  --     config = function()
  --         require("plugins.treesitter").config()
  --     end
  -- }

  -- Vim dispatch
  -- use { 'tpope/vim-dispatch' }
  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   event = "VimEnter",
  --   config = function()
  --     require("plugins.lualine").setup()
  --   end,
  --   requires = {'kyazdani42/nvim-web-devicons', opt = true}
  -- }

  -- Fugitive for Git
  -- use { 'tpope/vim-fugitive' }

end)
