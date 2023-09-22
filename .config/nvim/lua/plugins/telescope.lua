require("utils").safe_import(
  "telescope",
  function (telescope)

    local map = vim.api.nvim_set_keymap
    local noremap = { noremap = true }

    map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', noremap)
    map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', noremap)
    map('n', '<leader>fz', '<cmd>lua require"telescope.builtin".grep_string{ shorten_path = true, word_match = "-w", only_sort_text = true, search = "" }<CR>', noremap)
    map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', noremap)
    map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', noremap)
    map('n', '<leader>fc', '<cmd>Telescope command_history<cr>', noremap)
  end
)
