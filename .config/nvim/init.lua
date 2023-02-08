function import(import_name)

  local status_ok, treesitter = pcall(require, import_name)
  if not status_ok then
    print "treesitter not ok!"
    return
  end


end
require "settings"
require "mappings"
require "statusline"
require "plugins"
require "plugins.colorscheme"
require "plugins.telescope"
require "plugins.treesitter"
require "plugins.lsp"
require "plugins.compe"
require "plugins.haskell-vim"
require "plugins.lua-tree"
require "plugins.lualine"
