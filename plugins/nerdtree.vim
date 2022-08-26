" NERDTree configurations

" keybinds
" refresh NerdTree when it is focused
autocmd BufEnter NERD_tree_* | execute 'normal R'

" map <C-\> to toggle NERDTree
nmap <silent> <C-\> :NERDTreeToggle %<CR>
