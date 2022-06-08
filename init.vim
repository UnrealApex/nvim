" set the font to Consolas and the font size to 14 pixels
set guifont=Consolas:h14
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
" show mode in status bar (insert/replace/...)
set showmode
" show typed command in status bar
set showcmd
" show cursor position in status bar
set ruler
" show file in titlebar
set title
" 8 lines above/below cursor when scrolling
set scrolloff=8
" don't wrap lines
set nowrap
" basic completion
set omnifunc=syntaxcomplete#Complete
" automatic indentation
set autoindent
set smartindent
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
" set updatetime to 50 milliseconds
set updatetime=50
" set window background to dark
set bg=dark
" set the working directory as the one of the file currently being edited
autocmd BufEnter * lcd %:p:h

" built in debugger(requires gdb)
packadd termdebug


" refresh minimap.vim on file change
" augroup minimap_refresh
"   autocmd!
"   autocmd TextChanged * MinimapRefresh
"   autocmd BufModifiedSet * MinimapRefresh
" augroup end

" keybindings

" line/selection movement binds
" alt + k to move a line or selection up,
" alt + j to move a line or selection down
" amazing vim hack taken from the wiki:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down#:~:text=In%20normal%20mode%20or%20in,to%20move%20the%20block%20up.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" efficient editing in insert mode
" map ctrl + backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
" map shift + tab to unindent
inoremap <S-Tab> <C-d>
" auto save file when it is modified
augroup auto_save
  autocmd!
  " call save function
  autocmd BufModifiedSet * call AutoSave()
augroup end

" save function that is called when buffer is modified
function AutoSave()
  if (bufname() != "" && &buftype == "" && &filetype != "")
    silent write
  " prevent empty, readonly, etc... buffers from being saved
  else
  endif
endfunction

runtime plugins/plugins.vim
