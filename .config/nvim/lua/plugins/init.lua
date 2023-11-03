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
  use { "catppuccin/nvim", as = "catppuccin" }
  -- ############ Fuzzy finder #############
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'nvim-telescope/telescope-ui-select.nvim', requires = {"nvim-telescope/telescope.nvim"} }
  -- ######### LSP #############
  use { 'neovim/nvim-lspconfig' }
  use { 'ray-x/lsp_signature.nvim' }

  -- ######### DAP #############
  use { "mfussenegger/nvim-dap" }

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "rcarriga/cmp-dap", requires = {"rcarriga/nvim-dap-ui"} }
  use { "theHamsta/nvim-dap-virtual-text", requires = {"rcarriga/nvim-dap-ui"} }
  use {
    "nvim-telescope/telescope-dap.nvim",
    requires = {"mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim"},
    config = function () require('telescope').load_extension('dap') end,
  }

  -- ####### Completion #########
  use {'hrsh7th/nvim-cmp'}
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }

  -- ###### Markdown ###########
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- ###### Snippets ###########
  -- use { 'dcampos/nvim-snippy' }
  -- use { 'honza/vim-snippets' }
  -- use { 'dcampos/cmp-snippy' }

  use {'saadparwaiz1/cmp_luasnip'}
  use { 'rafamadriz/friendly-snippets' }
  use {
  	"L3MON4D3/LuaSnip",
  	-- follow latest release.
  	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  	-- install jsregexp (optional!:).
  	run = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  }
  use {
  	"windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

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
