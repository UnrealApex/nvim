" my vimrc for remote use(no plugins)
" vim -Nu <(curl https://raw.githubusercontent.com/UnrealApex/dotfiles/main/remote_use.vim)


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

augroup show_whitespace
  autocmd!
  autocmd ModeChanged *:[vV\x16]* :set listchars+=space:·
  autocmd Modechanged [vV\x16]*:* :set listchars-=space:·
augroup END

" change map leader to space
let mapleader=" "

let g:ftplugin_sql_omni_key = '<C-;>'

" keymaps

" map ctrl + c to escape
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
cnoremap <C-c> <Esc>
xnoremap <C-c> <Esc>

" efficient editing in insert mode
" map ctrl + backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
" map shift + tab to unindent
inoremap <S-Tab> <C-d>

" saner CTRL-L
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" switch buffers easily
nnoremap <leader>b :set nomore <Bar> echo ":buffers" <Bar> :ls <Bar> :set more <CR>:b<Space>

" line/selection movement binds
" alt + k to move a line or selection up,
" alt + j to move a line or selection down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" tab stuff
" leader 1 - 9 to jump to tab 1 - 9
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>6 6gt<CR>
nnoremap <Leader>7 7gt<CR>
nnoremap <Leader>8 8gt<CR>
nnoremap <Leader>9 9gt<CR>
" go to the last tab
nnoremap <Leader>0 :tablast<CR>
" leader n to create a new tab
nnoremap <Leader>n :tabnew<CR>
" leader x to close a new tab
nnoremap <Leader>x :tabclose<CR>

" search
" center search
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Resize splits with alt + arrows
nnoremap <A-Up> :resize +2<CR>
nnoremap <A-Down> :resize -2<CR>
nnoremap <A-Left> :vertical resize -2<CR>
nnoremap <A-Right> :vertical resize +2<CR>

"  w wq q   --  Quick Save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>Q :q!<CR>

"  y d p P   --  Quick copy paste into system clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" don't lose selection when shifting text
xnoremap < <gv
xnoremap > >gv
