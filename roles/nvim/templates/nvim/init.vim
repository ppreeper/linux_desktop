if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

" ----------
" plugins
" ----------
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'

" ui related
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

" file browser
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'preservim/nerdtree'
Plug 'mkitt/tabline.vim'

call plug#end()

" ----------
"  configurations
" ----------

filetype plugin indent on

" UI Configuration
syntax on
syntax enable

" colorscheme
let base16colorspace=256
colorscheme gruvbox
set background=dark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

if has("gui_running")
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
"set relativenumber

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" turn off backup
set nobackup
set noswapfile
set nowritebackup

" search config
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" tab indent
set expandtab
set shiftwidth=4
set tabstop=4

" file backups and undo
set path+=**
set encoding=utf-8 nobomb
set ffs=unix,dos,mac

" autoload file
set autoread

" ----------
" keymaps
" ----------
"  leader
let mapleader = ","
let g:mapleader = ","

" backspace
set backspace=eol,start,indent

" vim-autoformat
noremap <F3> :Autoformat<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>

nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>

" text spelling <leader>ss toggles spellcheck
map <leader>ss :setlocal spell!<CR>
" next word
map <leader>sn ]s
" prev word
map <leader>sp [s
" add to dictionary
map <leader>sa zg
" search replacement
map <leader>s? z=

" ----------
" commands
" ----------

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

