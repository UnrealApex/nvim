" CoC configurations

" CoC Extensions
let g:coc_global_extensions = [
\ 'coc-vimlsp',
\ 'coc-pyright',
\ 'coc-clangd',
\ 'coc-java',
\ 'coc-lua',
\ 'coc-sql',
\ 'coc-html',
\ 'coc-html-css-support',
\ 'coc-tsserver',
\ 'coc-css',
\ 'coc-json',
\ 'coc-highlight',
\ 'coc-snippets',
\ 'coc-lightbulb',
\ 'coc-symbol-line'
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

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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
nmap <leader>f  <Plug>(coc-format-selected)<CR>
vmap <leader>f  <Plug>(coc-format-selected)<CR>

" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>ca  <Plug>(coc-codeaction-selected)<CR>

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
