syntax enable
colorscheme desert

set background=dark

set numberwidth=4
" execute source every time vim .
filetype plugin on
filetype indent on

syntax on   

set exrc

set number
set relativenumber
set ruler
set guicursor=
set foldlevel=99
set nowrap

set wildmenu

set colorcolumn=81
"set signcolumn=yes
set foldcolumn=1
" disable errorbell
set noerrorbells
" buffer open in the background
set hidden

set splitbelow
set splitright

set incsearch
set hlsearch

set clipboard=unnamedplus
set clipboard=unnamed
if exists('+termguicolors')
  set termguicolors
endif

set completeopt=menuone,menu,longest,preview,noinsert

" remove swapfiles
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" number of spaces when using >>/<<
set shiftwidth=4
" number of spaces to insert a <Tab>
set expandtab
set tabstop=4
set softtabstop=4
set shiftround
set autoindent
set smartindent


set updatetime=50

" highlight the line where the cursor is located
set cursorline

hi CursorLine term=bold cterm=bold guibg=Grey40
" set cursorcolumn
" set scroll offset (start scrolling when cursor at line n - 10
set scrolloff=15

" ======================================
" Mappings
" ======================================
" map escape
inoremap jk <ESC>

" ======================================
" declarations
" ======================================
let mapleader = " "
let maplocalleader = "\\"

" Copy to clipboard
vnoremap <C-y> "+y
nnoremap <C-y> "+y
" Copy from clipboard
vnoremap <C-p> "+p
nnoremap <C-p> "+p
" Save
nnoremap <C-s> :w>cr>
vnoremap <C-s> :w>cr>
inoremap <C-s> :w>cr>

" normal mode mapping
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ov :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sa  gg<s-v>G<cr>
nnoremap <leader>vt :vert term<cr>
set list
set listchars=trail:�
" set listchars=tab:→\ ,space:»,trail:·,precedes:«,extends:»
" line movement
nnoremap L <esc>$
nnoremap H <esc>^
nnoremap Y <esc>y$

" helpfull commands
nnoremap <leader>bs <esc>:buffers<cr>
nnoremap <leader>rs <esc>:registers<cr>
nnoremap <leader>g :execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
nnoremap <leader>G :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader><space> :noh<cr>


" visual mode commands
"vnoremap" <leader>" <esc>`>a"<esc>`<i"


" Python file settings -------------------------{{{
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python vnoremap <localleader>ac :'<,'>:norm i# <cr>
    autocmd FileType python vnoremap <localleader>rc :'<,'>:norm 2s<cr>
    autocmd FileType python :iabbrev <buffer> for for<space>el<space>in<space>iterable:<esc>3bviw<left>
    autocmd FileType python :iabbrev <buffer> def def<space>foo(arg):<esc><s-b><esc>viw<left>
    autocmd FileType python :iabbrev <buffer> _init def<space>__init__(self):<left><left>
augroup END
" }}}


" Vimscript file settings -------------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" Haskell file settings -------------------------{{{
augroup filetype_haskell
    autocmd!
    autocmd FileType haskell setlocal foldmethod=indent 
    autocmd FileType haskell nnoremap <localleader>ac ^i-- <esc>
    autocmd FileType haskell vnoremap <localleader>ac :'<,'>:norm i-- <cr>
    autocmd FileType haskell vnoremap <localleader>ac :'<,'>:norm i-- <cr>
    autocmd FileType haskell vnoremap <localleader>rc :'<,'>:norm 3s<cr>
augroup END
" }}}

" Makefile file settings -------------------------{{{
augroup filetype_make
    autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
augroup END
" }}}
augroup filetype_lisp
    autocmd FileType lisp set expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup END
au BufRead,BufNewFile *.pl,*.PL set filetype=prolog
au BufRead,BufNewFile *.vsh,*fsh set filetype=glsl

" Status line {{{
set laststatus=2
set statusline=%f%y[%04l,%03v]
" }}}
" ctags config {{{
nnoremap <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" }}}



"augroup incsearch-highlight
"    autocmd!
"    autocmd CmdlineEnter /,\? :set hlsearch
"    autocmd CmdlineLeave /,\? :set nohlsearch
"augroup END

au FileType c setl ofu=ccomplete#CompleteCpp
