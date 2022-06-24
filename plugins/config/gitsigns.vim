" Gitsigns mappings

" hunk navigation
nnoremap <Leader>hn :Gitsigns next_hunk<CR>
nnoremap <Leader>hN :Gitsigns prev_hunk<CR>
" stage hunk
nnoremap <Leader>hs :Gitsigns stage_hunk<CR>
vnoremap <Leader>hs :Gitsigns stage_hunk<CR>
" unstage hunk
nnoremap <Leader>hr :Gitsigns reset_hunk<CR>
vnoremap <Leader>hr :Gitsigns reset_hunk<CR>
" stage file
nnoremap <Leader>hS :Gitsigns stage_buffer<CR>
" unstage file
nnoremap <Leader>hR :Gitsigns reset_buffer<CR>
" view line deleted
nnoremap <Leader>td :Gitsigns toggle_deleted<CR>
" undo hunk stage
nnoremap <Leader>hu :Gitsigns undo_stage_hunk<CR>
" preview hunk
nnoremap <Leader>hp :Gitsigns preview_hunk<CR>
" line blame
nnoremap <Leader>hb :Gitsigns blame_line<CR>
nnoremap <Leader>tb :Gitsigns toggle_current_line_blame<CR>
