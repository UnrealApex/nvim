" disable vi-compatability mode and enables useful vim functionality
set nocompatible
" allow hidden buffers
set hidden
" set the font to Jetbrains Mono and the font size to 14 pixels
set guifont=JetbrainsMono\ NF:h13
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
" don't show mode in status bar (insert/replace/...)
set noshowmode
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
set list
set listchars=
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
" ignore case unless explicitly stated
set ignorecase
set smartcase
" reread file if it has been modified outside of Vim
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
set foldmethod=indent
set nofoldenable
" set gutter color to match background color
highlight clear SignColumn
" set path
set path+=.,**

augroup show_whitespace
  autocmd!
  autocmd ModeChanged *:[vV\x16]* :set listchars+=space:·
  autocmd Modechanged [vV\x16]*:* :set listchars-=space:·
augroup END

autocmd BufEnter * call ChangeWorkingDirectory()
" set the working directory as the one of the file currently being edited
function ChangeWorkingDirectory()
  if (bufname() != "" && &buftype == "" && &filetype != "" && &readonly == 0)
    lcd %:p:h
  " don't change the working directory for buffers that aren't files
  else
  endif
endfunction

" matchit plugin
packadd matchit

" change map leader to space
let mapleader=" "

" remap this so that using Ctrl + C doesn't have a delay
let g:ftplugin_sql_omni_key = '<C-;>'

" plugins
let $PLUGINS = stdpath("config") . "\\plugins/plug.vim"
" keymaps
let $KEYMAPS =  stdpath("config") . "\\keymaps.vim"

" keymap management
runtime keymaps.vim
" plugin stuff
lua require('user.plugins')
