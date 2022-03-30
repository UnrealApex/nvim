" configs fully enhanced Vim added
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" configurations I have added in myself
set guifont=Consolas:h14
" show line numbers
set nu
" turn off annoying error bell
set noerrorbells visualbell t_vb=
" syntax highlighting
syntax on
set showmatch
set noswapfile
set smartindent
set smartcase
" failed attempt to halt Vim creating those pesky .swp and .~un files
set nobackup
set wildmode=longest:full,full
set wildmenu
" Show current line number
set number
" Show relative line numbers
set relativenumber

" plugins (make sure you have VimPlug installed)
call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'
" ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" Vim GitGutter
Plug 'airblade/vim-gitgutter'
" Vim Airline
Plug 'vim-airline/vim-airline'
" Fugitive Vim
Plug 'tpope/vim-fugitive'
" Vim Surround
Plug 'tpope/vim-surround'
" Vim Commentary
Plug 'tpope/vim-commentary'
call plug#end()

" map the hypen key (-) to toggle NERDTree
nmap - :NERDTreeToggle<CR>
