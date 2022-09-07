" my simple vimrc for remote use(no plugins)
" show line numbers
set number
" show relative line numbers
set relativenumber
" disable annoying error bell to prevent your ears from dying
set noerrorbells visualbell t_vb=
" syntax highlighting
syntax on
" omni completion
filetype plugin on
" status bar
set laststatus=2
" show how many lines are in a file
set ruler
" 2 lines above/below cursor when scrolling
set scrolloff=2
" don't wrap lines
set nowrap
set omnifunc=syntaxcomplete#Complete
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
" failed attempt to halt Vim creating those pesky .swp and .~un files
set nobackup
set noswapfile
set wildmode=longest:full,full
set wildmenu
" set updatetime to 600 milliseconds
set updatetime=600
" set the working directory as the one of the file currently being edited
autocmd BufEnter * lcd %:p:h
set bg=dark
