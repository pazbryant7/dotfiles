"basic
syntax on
set number
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set clipboard=unnamedplus
set ignorecase
set smartcase
set showmatch
set noshowmode
set cmdheight=1

"Map leader
let mapleader = " "
set timeoutlen=500

"icons
set encoding=UTF-8

"fzf
source /usr/share/doc/fzf/examples/fzf.vim

"Theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


