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
  extensions = {
  }
    telescope.setup{
      pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
      },
      extensions = {

        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      }
    }
  telescope.load_extension("ui-select")
  end
)
