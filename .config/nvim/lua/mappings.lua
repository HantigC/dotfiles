local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
local noremap = { noremap = true }
-- Buffer Commands
map('i', 'jk', '<esc>', noremap)
-- Selecting all text
-- redo

-- Clear search mark
map('n', '<Leader><space>', ':noh<cr>', noremap)

-- Copy to clipboard
map('v', '<C-y>', '"+y',    noremap)
map('n', '<C-y>', '"+y',    noremap)
-- Copy to clipboard
map('n', '<C-p>', '"+p',    noremap)
map('v', '<C-p>', '"+p',    noremap)
map('n', '<C-s>', ':w<cr>', noremap)
map('v', '<C-s>', ':w<cr>', noremap)
map('i', '<C-s>', ':w<cr>', noremap)


-- autoreloading config file
map('n', '<Leader>vo', ':e $MYVIMRC<cr>',  noremap)
map('n', '<Leader>ve', ':vs $MYVIMRC<cr>', noremap)
map('n', '<Leader>vs', ':so $MYVIMRC<cr>', noremap)


-- terminal mode moving
map('t', '<c-w><c-w>', [[<C-\><C-N><c-w><c-w>]], noremap)
map('t', '<c-space>', [[<C-\><C-N>]], noremap)
-- Resizing-splits
map('n', '<A-k>', ':resize +5<CR>', noremap)
map('n', '<A-j>', ':resize -5<CR>', noremap)
map('n', '<A-l>', ':vertical resize +5<CR>', noremap)
map('n', '<A-h>', ':vertical resize -5<CR>', noremap)

map('v', '<c-j>', [[:move '>+1<CR>gv-gv]], noremap)
map('v', '<c-k>', [[:move '<-2<CR>gv-gv]], noremap)
map('n', '<c-j>', [[v:move '>+1<CR>gv-gv<esc>]], noremap)
map('n', '<c-k>', [[v:move '<-2<CR>gv-gv<esc>]], noremap)


map('n', '<Leader>s', 'ggVG',            noremap)
map('n', '<Leader>x', ':bd<CR>',         noremap)
map('n', '<Leader>p', ':bprev<CR>',      noremap)
map('n', '<Leader>q', ':q<CR>',          noremap)
map('n', '<Leader>a', '<C-^>',           noremap)
map('n', '<Leader>l', ':ls<cr>:b ', noremap)
map('n', '<Leader>b', ':b <C-d>',        noremap)
map('n', '<Leader>n', ':bnext<CR>',      noremap)
map('n', '<Leader>t', ':tabnew<CR>',     noremap)
map('n', '<Leader>c', ':tabclose<CR>',   noremap)
map('n', '<Leader>r', ':vsplit<CR>:terminal<CR>',   noremap)
map('n', '<Leader>g', ':registers<CR>',  noremap)
