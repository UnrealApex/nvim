" FZF config
" open FZF file search when ctrl + p is pressed
nnoremap <C-p> :Files<CR>

" list all the commands when ctrl + shift + p is pressed
nnoremap <C-S-p> :Commands<CR>

" fzf preview 
" syntax highlighting is dependant on bat(https://github.com/sharkdp/bat)
" so check if it is installed before trying to use it or don't use syntax
" highlighting
if executable("bat")
  command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': [
      \ '--info=inline', '--preview',
      \'bat --color=always --style=numbers --line-range=:500 {}']}, <bang>0)
else
  " notify the user bat is not installed because fzf preview doesn't seem to
  " function without bat
  :echo "Bat is not installed, make sure it is installed for FZF's preview to work properly\
        \nhttps://github.com/sharkdp/bat"
endif

" configuration for fzf preview window
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
