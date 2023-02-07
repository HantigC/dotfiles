-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local noremap = { noremap = true }
vim.api.nvim_set_keymap('n', '<Leader>ee', ':NvimTreeFocus<cr>', noremap)
vim.api.nvim_set_keymap('n', '<Leader>et', ':NvimTreeToggle<cr>', noremap)
vim.api.nvim_set_keymap('n', '<Leader>ef', ':NvimTreeFindFile<cr>', noremap)
vim.api.nvim_set_keymap('n', '<Leader>ec', ':NvimTreeCollapse<cr>', noremap)
