-- init.lua
-- FIXME: put core files in core/ folder, plugin stuff in plugins/
-- TODO: rewrite keymaps.vim to lua
--keymap management
vim.cmd[[runtime keymaps.vim]]
-- require('user.keymaps')

require('user.options')
--plugin stuff
require('user.plugins')
