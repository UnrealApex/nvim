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

" emulate vim vinegar
" disable annoying banner
let g:netrw_banner=0
" open in prior window
let g:netrw_browse_split=4
" open splits to the right
let g:netrw_altv=1
" tree view
let g:netrw_liststyle=3  
" hide files that are ignored by gitignore
let g:netrw_list_hide=netrw_gitignore#Hide()
" hide dotfiles by default
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
nnoremap - :Explore %:h<CR>


" line/selection movement binds
" alt + k to move a line or selection up,
" alt + j to move a line or selection down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" buffer stuff
" switch buffers easily
nnoremap <leader>b :set nomore <Bar> echo ":buffers" <Bar> :ls <Bar> :set more <CR>:b<Space>
nnoremap <Leader>n :enew<CR>
nnoremap <Leader>q :bd<CR>

" Resize splits with alt + arrows
nnoremap <A-Up> :resize +2<CR>
nnoremap <A-Down> :resize -2<CR>
nnoremap <A-Left> :vertical resize -2<CR>
nnoremap <A-Right> :vertical resize +2<CR>

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
