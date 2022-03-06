local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', noremap)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', noremap)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', noremap)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', noremap)
