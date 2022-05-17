" Install vim-plug if is not present on the system the init.vim is being used on
" Note that this will not work unless you have Git installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  :echo "Installing Vim Plug"
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  :echo "Vim Plug installed"
endif

" set the font to Consolas and the font size to 14 pixels
set guifont=Consolas:h14
" show line numbers
set number
" Show relative line numbers
set relativenumber
" disable annoying error bell to prevent your ears from dying
set noerrorbells visualbell t_vb=
" syntax highlighting
syntax on
" Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set smartcase
" failed attempt to halt Vim creating those pesky .swp and .~un files
set nobackup
set noswapfile
set wildmode=longest:full,full
set wildmenu
" set updatetime to 700 milliseconds
set updatetime=700
" set the working directory as the one of the file currently being edited
set autochdir
autocmd BufEnter * lcd %:p:h

" plugins (make sure you have VimPlug installed, run :PlugInstall to install them)
call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'
" ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" Vim GitGutter
Plug 'airblade/vim-gitgutter'
" Lightline(status bar)
Plug 'itchyny/lightline.vim'
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
" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" Conquerer of Completion(code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Make sure that IndentLine is enabled
let g:indentLine_enabled = 1
" Activate RainbowParentheses
augroup rainbow_parens
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup end

set bg=dark

" Refresh NerdTree when it is focused
autocmd BufEnter NERD_tree_* | execute 'normal R'

" CoC Extensions
let g:coc_global_extensions = [
\ 'coc-git',
\ 'coc-pyright',
\ 'coc-markdownlint',
\ 'coc-clangd',
\ 'coc-html',
\ 'coc-tsserver',
\ 'coc-css',
\ 'coc-json'
\ ]

" map the hypen key (-) to toggle NERDTree
nmap - :NERDTreeToggle<CR>
" map ctrl +  backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
" map shift + tab to unindent
inoremap <S-Tab> <C-d>
