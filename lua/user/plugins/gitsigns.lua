local bufopts = { noremap=true, silent=true, buffer=bufnr }
-- Gitsigns mappings

-- hunk navigation
vim.keymap.set('n', '<Leader>hn', ':Gitsigns next_hunk<CR>', bufopts)
vim.keymap.set('n', '<Leader>hN', ':Gitsigns prev_hunk<CR>', bufopts)
-- stage hunk
vim.keymap.set('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', bufopts)
vim.keymap.set('v', '<Leader>hs', ':Gitsigns stage_hunk<CR>', bufopts)
-- unstage hunk
vim.keymap.set('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', bufopts)
vim.keymap.set('v', '<Leader>hr', ':Gitsigns reset_hunk<CR>', bufopts)
-- stage file
vim.keymap.set('n', '<Leader>hS', ':Gitsigns stage_buffer<CR>', bufopts)
-- unstage file
vim.keymap.set('n', '<Leader>hR', ':Gitsigns reset_buffer<CR>', bufopts)
-- view line deleted
vim.keymap.set('n', '<Leader>td', ':Gitsigns toggle_deleted<CR>', bufopts)
-- undo hunk stage
vim.keymap.set('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', bufopts)
-- preview hunk
vim.keymap.set('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', bufopts)
-- line blame
vim.keymap.set('n', '<Leader>hb', ':Gitsigns blame_line<CR>', bufopts)
vim.keymap.set('n', '<Leader>tb', ':Gitsigns toggle_current_line_blame<CR>', bufopts)


require('gitsigns').setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false
  },

})
