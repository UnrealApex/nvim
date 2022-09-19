" keymaps

" delete previous word in insert mode
imap <C-BS> <C-W>
" unindent in insert mode
inoremap <S-Tab> <C-d>

" saner CTRL-L
nnoremap <C-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" nnoremap <leader>b :set nomore <Bar> echo ":buffers" <Bar> :ls <Bar> :set more <CR>:b<Space>

" move lines up or down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

" buffer stuff
nnoremap <Leader>n :enew<CR>
" leader x to close a new tab
" nnoremap <Leader>x :tabclose<CR>
nnoremap <Leader>x :bd<CR>

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
