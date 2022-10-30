-- keymaps

-- map <C-c> to <Esc>
vim.keymap.set('n', '<C-c>', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('v', '<C-c>', '<Esc>')
vim.keymap.set('c', '<C-c>', '<Esc>')
vim.keymap.set('x', '<C-c>', '<Esc>')

-- delete previous word in insert mode
vim.keymap.set('i', '<C-BS>', '<C-W>')
-- unindent in insert mode
vim.keymap.set('i', '<S-Tab>', '<C-d>')

-- saner CTRL-L
vim.keymap.set('n', '<C-l>', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>')

-- vanilla buffer switcher
-- nnoremap <leader>b :set nomore <Bar> echo ":buffers" <Bar> :ls <Bar> :set more <CR>:b<Space>
-- lua implementation
-- vim.keymap.set('n', '<leader>b', ':set nomore <Bar> echo ":buffers" <Bar> :ls <Bar> :set more <CR>:b<Space>')

-- move lines up or down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', {silent = true})
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', {silent = true})
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {silent = true})
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {silent = true})
vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv', {silent = true})
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv', {silent = true})

-- buffer stuff
-- create a new buffer
vim.keymap.set('n', '<leader>n', ':enew<CR>')
-- delete a buffer
vim.keymap.set('n', '<leader>q', ':bd<CR>')

-- Resize splits with alt + arrows
vim.keymap.set('n', '<A-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>')

-- faster copying and pasteing into system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>d', '"+d')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>d', '"+d')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>P', '"+P')

-- don't lose selection when shifting text
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

