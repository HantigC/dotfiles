vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.colorcolumn = '80,100,110'

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

vim.o.cursorline = true
vim.o.termguicolors = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wildmode = 'full'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.scrolloff = 8
vim.o.pumheight = 10

vim.cmd('set noswapfile')
vim.o.hidden = true
vim.o.lazyredraw = true
vim.o.history = 500
vim.wo.wrap = false

vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]
vim.cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

vim.cmd [[
  augroup setting_filetype
      autocmd!
      autocmd BufRead,BufNewFile *.pl,*.PL set filetype=prolog
      autocmd BufRead,BufNewFile *.vsh,*fsh set filetype=glsl
  augroup END
]]

vim.o.completeopt = 'menuone,noselect'

