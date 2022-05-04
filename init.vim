" set the font to Consolas and the font size to 14 pixels
set guifont=Consolas:h14
" show line numbers
set number
" Show relative line numbers
set relativenumber
" turn off annoying error bell
set noerrorbells visualbell t_vb=
" syntax highlighting
syntax on
set noswapfile
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smartcase
" failed attempt to halt Vim creating those pesky .swp and .~un files
set nobackup
set wildmode=longest:full,full
set wildmenu
" set updatetime to 700 milliseconds
set updatetime=700
" plugins (make sure you have VimPlug installed, run :PlugInstall to install them)
call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'
" ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" Vim GitGutter
Plug 'airblade/vim-gitgutter'
" Vim Airline
Plug 'vim-airline/vim-airline'
" Fugitive.vim
Plug 'tpope/vim-fugitive'
" Sensible.vim
Plug 'tpope/vim-sensible'
" Vim Surround
Plug 'tpope/vim-surround'
" Vim Commentary
Plug 'tpope/vim-commentary'
" indent guides
Plug 'yggdroot/indentline'
" Goyo
Plug 'junegunn/goyo.vim'
" GitHub Copilot
Plug 'github/copilot.vim'
call plug#end()

set bg=dark

" map the hypen key (-) to toggle NERDTree
nmap - :NERDTreeToggle<CR>
" map ctrl +  backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
