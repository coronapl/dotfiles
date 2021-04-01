""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"     @coronapl
" File:
"     .vimrc
" Sections:
"     -> General
"     -> Plugins
"     -> Maps
"     -> UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section: General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500     " Only remember 500 lines
set nocompatible    " Make Vim more useful
set encoding=utf-8  " Set file encoding to UTF-8
set hidden          " Hide buffers instead of unloading them

" Enable filetype plugins
filetype plugin on
filetype indent on

set mouse=a " Enable the mouse

" Turn backups off
set nobackup
set nowb
set noswapfile

set expandtab " Use spaces instead of tabs

" Set tab to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Be smart with indentation
set smartindent
set autoindent

set ttyfast " Make terminal more fast

" Do not show numbers on terminal window
autocmd TerminalWinOpen,BufWinEnter * if &buftype == 'terminal'
    \ | setlocal nonumber
    \ | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section: Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Tpope essentials
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
" Colorschemes
    Plug 'altercation/vim-colors-solarized'
" Others
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'vimwiki/vimwiki'
call plug#end()

" FZF use 15 % of window
let g:fzf_layout = { 'down': '15%' }

" Change vimwiki default directory
let g:vimwiki_list = [{'path': '~/Wiki/',
                     \ 'index': 'main',
                     \ 'syntax': 'markdown',
                     \ 'ext': '.md'}]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section: Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * General
" Set space to be the leader key
let mapleader=" "
" Use jk instead of ESC
inoremap jk <ESC>
" Open .vimrc file
nnoremap <leader>ev :edit $MYVIMRC<CR>
" Move to first non-whitespace character
nnoremap 0 ^

" * Buffers
" Save current buffer
nnoremap <leader>s :w<CR>
" Close current buffer
nnoremap <leader>d :bd<CR>
" Close current buffer event if it has changes
nnoremap <leader>D :bd!<CR>
" Show all buffers
nnoremap <leader>b :ls<CR>
" Move to next buffer
nnoremap <leader>n :bn<CR>
" Move to previous buffer
nnoremap <leader>p :bp<CR>

" * Windows
" Move to the left window
nnoremap <leader>h :wincmd h<CR>
" Move to the window below
nnoremap <leader>j :wincmd j<CR>
" Move to the window above
nnoremap <leader>k :wincmd k<CR>
" Move to the right window
nnoremap <leader>l :wincmd l<CR>

" * Terminal
" Move to normal mode in terminal window
tnoremap jk <C-\><C-N>
" Open terminal in next buffer
nnoremap <leader>tn :terminal ++curwin<CR>
" Open terminal window to the right
nnoremap <leader>tv :vertical botright terminal<CR>

" * Editing
" Move line down
nnoremap - ddp
" Move line above
nnoremap _ dd<up><S-p>
" Autoclose
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

" * File searching
" Open file explorer
nnoremap <C-b> :Explore<CR>

" * Searching
" Normal search
nnoremap <C-f> :/

" Remove highlighting
nnoremap <leader>o :noh<CR>

" * Plugins
" ** FZF
" Open fuzzy Finder
noremap <C-p> :FZF<CR>

" ** Fugitive
" Open Git window
nnoremap <leader>g :G<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section: UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable   " Enable syntax highlighting
set nowrap      " Do not wrap lines

colorscheme pablo

set scrolloff=8     " Show 8 lines from cursor
set number          " Show line numbers
set laststatus=2    " Always show status line
set ruler           " Show current position
set wildmenu        " Enhance command-line completion

" * Searching
set ignorecase      " Ignore case when searching
set smartcase       " Do not ignore case if search has case
set incsearch       " Show incremental matching
set hlsearch        " Highlight match

" * Explorer settings
let g:netrw_banner=0 " Hide giant banner

" Show some invisible characters
set listchars=tab:>-,trail:~,extends:>,precedes:<,
" Only show invisible characters when I want
nnoremap <leader>z :set list!<CR>

" Hightlight column 81
highlight ColorColumn ctermbg=237
call matchadd('ColorColumn', '\%81v', 100)

