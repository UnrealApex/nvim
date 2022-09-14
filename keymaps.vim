" keymaps

" efficient editing in insert mode
" map ctrl + backspace to delete the previous word in insert mode
imap <C-BS> <C-W>
" map shift + tab to unindent
inoremap <S-Tab> <C-d>

" saner CTRL-L
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

nnoremap <leader>b :set nomore <Bar> echo "switch buffer" <Bar> :ls <Bar> :set more <CR>:b<Space>
" nnoremap <leader>b :Telescope buffers<CR>

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
" nnoremap <Leader>1 1gt<CR>
" nnoremap <Leader>2 2gt<CR>
" nnoremap <Leader>3 3gt<CR>
" nnoremap <Leader>4 4gt<CR>
" nnoremap <Leader>5 5gt<CR>
" nnoremap <Leader>6 6gt<CR>
" nnoremap <Leader>7 7gt<CR>
" nnoremap <Leader>8 8gt<CR>
" nnoremap <Leader>9 9gt<CR>
" go to the last tab
" nnoremap <Leader>0 :tablast<CR>
" leader n to create a new tab
" nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>n :enew<CR>
" leader x to close a new tab
" nnoremap <Leader>x :tabclose<CR>
nnoremap <Leader>x :bd<CR>

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
