" NERDTree configurations

" keybinds
" refresh NerdTree when it is focused
autocmd BufEnter NERD_tree_* | execute 'normal R'

" map the hypen key (-) to toggle NERDTree
nmap <silent> - :NERDTreeToggle<CR>

" autocommands that call SyncNerdTree() when the buffer is changed or written
" to
augroup nerd_tree_sync_current_dir
  autocmd!
  autocmd BufEnter * call SyncNERDTree()
  autocmd BufWrite * call SyncNERDTree()
augroup end

" sync NERDTree with the current file open
function SyncNERDTree()
  " make sure the buffer isn't a NERDTree buffer, it is not empty, and also
  " make sure the buffer contains a file
  " file
  if stridx(bufname('%'), 'NERD_tree_') == -1 && bufname() != "" && &buftype == "" && &filetype != "" 
    cd %:p:h
    " open a new NERDTree buffer and close it
    NERDTree
    NERDTreeClose
  endif
endfunction
