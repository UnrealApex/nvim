" set the font to Consolas and the font size to 14 pixels
set guifont=Jetbrains\ Mono:h14
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
set bg=dark
" set path
set path=.,**
" set the working directory as the one of the file currently being edited
autocmd BufEnter * lcd %:p:h

" built in debugger(requires gdb)
packadd termdebug

" keybindings

" change map leader to space
let mapleader=" "

" line/selection movement binds
" alt + k to move a line or selection up,
" alt + j to move a line or selection down
" amazing vim hack taken from the wiki:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down#:~:text=In%20normal%20mode%20or%20in,to%20move%20the%20block%20up.
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
nnoremap <Leader>x :bd<CR>

" efficient editing in insert mode
" map ctrl + backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
" map shift + tab to unindent
inoremap <S-Tab> <C-d>

" plugin management
" automatically install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  :echo "Installing Vim Plug"
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  :echo "Vim Plug installed"
endif

" plugins (make sure you have vim plug installed, run :PlugInstall to install them)
call plug#begin('~/.vim/plugged')
" file explorer
Plug 'tpope/vim-vinegar'
" Use vim gitgutter instead of gitsigns for git gutter indicators
Plug 'airblade/vim-gitgutter'
" Lightline (status bar)
Plug 'itchyny/lightline.vim'
" Fugitive.vim(git superpowers)
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
" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" Conquerer of Completion(code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-sources'
" Repeat.vim
Plug 'tpope/vim-repeat'
" Vim Startify(start screen)
Plug 'mhinz/vim-startify'
" fzf(fuzzy finder)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Vim Sneak(better horizontal movement)
Plug 'justinmk/vim-sneak'
" VM multi cursors
Plug 'mg979/vim-visual-multi'
" Emmet
Plug 'mattn/emmet-vim'
" Vim dev icons
Plug 'ryanoasis/vim-devicons'
call plug#end()

" enable IndentLine
let g:indentLine_enabled = 1

" enable sneak label mode
let g:sneak#label = 1

augroup show_whitespace
  autocmd!
  autocmd ModeChanged *:[vV\x16]* :set listchars+=space:·
  autocmd Modechanged [vV\x16]*:* :set listchars-=space:·
augroup END

" bind Enter to accept Copilot suggestions
" imap <silent><script><expr> <C-Enter> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" enable RainbowParentheses
augroup rainbow_parens
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup end

" plugins

" CoC configurations

" CoC Extensions
let g:coc_global_extensions = [
\ 'coc-vimlsp',
\ 'coc-pyright',
\ 'coc-clangd',
\ 'coc-java',
\ 'coc-sumneko-lua',
\ 'coc-sql',
\ 'coc-html',
\ 'coc-html-css-support',
\ 'coc-tsserver',
\ 'coc-css',
\ 'coc-json',
\ 'coc-highlight',
\ 'coc-snippets',
\ 'coc-lightbulb',
\ 'coc-symbol-line',
\ 'coc-calc'
\ ]

" CoC keybindings

" map ctrl + j and ctrl + k to traverse up and down the coc completion list
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"

" map tab to accept completion
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)<CR>
nmap <silent> gy <Plug>(coc-type-definition)<CR>

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)<CR>

" gr - find references
nmap <silent> gr <Plug>(coc-references)<CR>

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

" list errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>rn  <Plug>(coc-rename)<CR>
nmap <F2> <Plug>(coc-rename)<CR>
nmap <leader>cf  <Plug>(coc-format-selected)<CR>
vmap <leader>cf  <Plug>(coc-format-selected)<CR>

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>ca  <Plug>(coc-codeaction-selected)<CR>


" FZF configurations

" open FZF file search when ctrl + p is pressed
nnoremap <C-p> :FZF<CR>
" open FZF ripgrep search when ctrl + t is pressed
nnoremap <C-t> :Rg<CR>

" startify configurations

" custom startify headers
" https://github.com/goolord/alpha-nvim/blob/20ecf5c5af6d6b830f1dc08ae7f3325cd518f0be/doc/alpha.txt#L176

let g:neovim_custom_ascii_header = [
              \  '                               __                ',
              \  '  ___     ___    ___   __  __ /\_\    ___ ___    ',
              \  ' / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ',
              \  '/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
              \  '\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
              \  ' \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
              \  ]

let g:vim_custom_ascii_header = [
              \  '         __                ',
              \  ' __  __ /\_\    ___ ___    ',
              \  '/\ \/\ \\/\ \  / __` __`\  ',
              \  '\ \ \_/ |\ \ \/\ \/\ \/\ \ ',
              \  ' \ \___/  \ \_\ \_\ \_\ \_\',
              \  '  \/__/    \/_/\/_/\/_/\/_/',
              \  ]

" set a different ASCII custom header depending on if you are using NeoVim,
" Vim, or a Vim-like editor
if has("nvim")
  let g:startify_custom_header =
        \ 'startify#pad(g:neovim_custom_ascii_header)'
        " custom header with random quote in box
        " \ 'startify#pad(g:neovim_custom_ascii_header + startify#fortune#boxed())'
elseif has("vim")
  let g:startify_custom_header =
        \ 'startify#pad(g:vim_custom_ascii_header)'
        " custom header with random quote in box
        " \ 'startify#pad(g:ascii + startify#fortune#boxed())'
else
endif

" startify bookmarks
let g:startify_bookmarks = ["$MYVIMRC", "$HOME/src", "$PLUGINS", "$KEYMAPS"]
