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
" more powerful backspacing
set backspace=indent,eol,start
" set tabs to two spaces
set tabstop=2
set shiftwidth=2
set expandtab
" incremental search
set incsearch
set magic
set ignorecase
set smartcase
" prevent backup files from being created
set nobackup
set noswapfile
set wildmode=longest:full,full
set wildmenu
" auto close html tags
set matchpairs+=<:>
" set updatetime to 25 milliseconds
set updatetime=25
" set window background to dark
set background=dark
set termguicolors
set lazyredraw
" set gutter color to match background color
highlight clear SignColumn
" set path
set path=.,**
" set the working directory as the one of the file currently being edited
autocmd BufEnter * lcd %:p:h

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


" prose mode(for writing)
" FIXME: fix binding g + motion for visible lines
" FIXME: fix unmapping of j and k mappings
command Prose call ToggleProseMode()

function ToggleProseMode()
  let w:prose_mode_enabled = 0
  if w:prose_mode_enabled == 1
    " disable word processor mode if it is enabled
    let w:prose_mode_enabled = 0
    set nospell
    set nowrap
    " hack to map j and k to their original functionalities
    nnoremap j j
    nnoremap k k
    vnoremap j j
    vnoremap k k
    Goyo!
    echo "Prose Mode Disabled"
  else
    " enable word processor mode if it is disabled
    let w:prose_mode_enabled = 1
    " set spell checking
    setlocal spell spelllang=en_us
    " set line wrapping
    setlocal wrap
    " map j and k to navigate visual lines instead of actual lines
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
    Goyo
    echo "Prose Mode Enabled"
  endif
endfunction

" keymap management
runtime keymaps.vim
" plugin management
runtime plugins/plug.vim
