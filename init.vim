" disable vi-compatability mode and enables useful vim functionality
set nocompatible
set hidden
" set the font to Ubuntu Mono and the font size to 14 pixels
set guifont=UbuntuMono\ NF:h14
" show line numbers
set number
" show relative line numbers
set relativenumber
" disable annoying error bell to prevent your ears from dying
set noerrorbells visualbell t_vb=
" syntax highlighting
syntax on
" enable filetype detection
filetype on
" omni completion
filetype plugin on
" better indentation
filetype indent on
" show mode in status bar (insert/replace/...)
set showmode
" show typed command in status bar
set showcmd
" show cursor position in status bar
set ruler
" show file in titlebar
set title
" 8 lines above or below cursor when scrolling
set scrolloff=8
" don't wrap lines
set nowrap
" basic completion
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,noselect
" automatic indentation
set autoindent
set fo+=jpor
" more powerful backspacing
set backspace=indent,eol,start
" set tabs to two spaces
set tabstop=2
set shiftwidth=2
" indents to next multiple of 'shiftwidth'.
set shiftround
set expandtab
" incremental search
set incsearch
set magic
set ignorecase
set smartcase
set autoread
" save yourself some memory
" you are never gonna undo 1000 steps which is the default value for undolevels
" 50 is the default value for history which is relatively low to be useful.
set undolevels=500 history=500
" store all swap files in one directory
set dir=$HOME/.vim/swap//
" store all backup files in one directory
set backupdir=$HOME/.vim/swap//
" persistent undo tree
set undofile undodir=$HOME/.vim/undo//
set wildmode=longest:full,full
set wildmenu
" auto close html tags
set matchpairs+=<:>
" set updatetime to 200 milliseconds
set updatetime=200
" set window background to dark
set background=dark
set termguicolors
set lazyredraw
" set gutter color to match background color
highlight clear SignColumn
" set path
set path=.,**

autocmd BufEnter * call ChangeWorkingDirectory()
" set the working directory as the one of the file currently being edited
function ChangeWorkingDirectory()
  if (bufname() != "" && &buftype == "" && &filetype != "" && &readonly == 0)
    lcd %:p:h
  " don't change the working directory for buffers that aren't files
  else
  endif
endfunction

" built in debugger(requires gdb)
packadd termdebug

" change map leader to space
let mapleader=" "

" remap this so that using Ctrl + C doesn't have a delay
let g:ftplugin_sql_omni_key = '<C-;>'

" plugins
let $PLUGINS = stdpath("config") . "\\plugins/plug.vim"
" keymaps
let $KEYMAPS =  stdpath("config") . "\\keymaps.vim"

" auto save file when it is modified
augroup auto_save
  autocmd!
  " call save function
  autocmd BufModifiedSet * call AutoSave()
augroup end

" save function that is called when buffer is modified
function AutoSave()
  if (bufname() != "" && &buftype == "" && &filetype != "" && &readonly == 0)
    silent write
  " prevent empty, readonly, etc... buffers from being saved
  else
  endif
endfunction


command Prose call ProseMode()

" prose mode(for writing)
" requires goyo
function ProseMode()
  if (!exists('t:goyo_master'))
  " enable word processor mode
  " set spell checking
  setlocal spell spelllang=en_us
  " set line wrapping
  setlocal wrap
  " map j and k to navigate visual lines instead of actual lines
  " normal mode mappings
  nnoremap j gj
  nnoremap k gk
  nnoremap 0 g0
  nnoremap $ g$
  nnoremap ^ g^
  " visual mode mappings
  vnoremap j gj
  vnoremap k gk
  vnoremap 0 g0
  vnoremap $ g$
  vnoremap ^ g^
  Goyo
  echo "Prose Mode Enabled"
else
  " disable word processor mode
  setlocal nospell spelllang=
  setlocal nowrap
  " hack to return keys back to their original functionalities
  " normal mode unmappings
  nnoremap j j
  nnoremap k k
  nnoremap 0 0
  nnoremap $ $
  nnoremap ^ ^
  " visual mode unmappings
  vnoremap j j
  vnoremap k k
  vnoremap 0 0
  vnoremap $ $
  vnoremap ^ ^
  Goyo!
  echo "Prose Mode Disabled"
endif
endfunction

" keymap management
runtime keymaps.vim
" plugin management
runtime plugins/plug.vim
