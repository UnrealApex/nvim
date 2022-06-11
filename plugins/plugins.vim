" plugins
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
" NERDTree(file explorer)
Plug 'scrooloose/nerdtree'
" Vim GitGutter
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
" GitHub Copilot
Plug 'github/copilot.vim'
" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" Conquerer of Completion(code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Repeat.vim
Plug 'tpope/vim-repeat'
" Vim Startify(start screen)
Plug 'mhinz/vim-startify'
" fzf(fuzzy finder)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Vim Sneak(better horizontal movement)
Plug 'justinmk/vim-sneak'
" minimap.vim
" Plug 'wfxr/minimap.vim'
" VM multi cursors
Plug 'mg979/vim-visual-multi'
" Emmet
Plug 'mattn/emmet-vim'
call plug#end()

" enable IndentLine
let g:indentLine_enabled = 1

" refresh minimap.vim on file change
" augroup minimap_refresh
"   autocmd!
"   autocmd TextChanged * MinimapRefresh
"   autocmd BufModifiedSet * MinimapRefresh
" augroup end

" open minimap on startup
" let g:minimap_auto_start = 1

" highlight git stuff in minimap
" let g:minimap_git_colors = 1


" bind Enter to accept Copilot suggestions
imap <silent><script><expr> <Enter> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" enable RainbowParentheses
augroup rainbow_parens
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup end

" plugin configurations
runtime plugins/config/startify.vim
runtime plugins/config/coc.vim
runtime plugins/config/nerdtree.vim
runtime plugins/config/fzf.vim
runtime plugins/config/lightline.vim
