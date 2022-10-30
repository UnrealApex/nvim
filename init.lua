-- init.lua
-- FIXME: put core files in core/ folder, plugin stuff in plugins/
-- TODO: rewrite keymaps.vim to lua
require('user.options')
--keymap management
-- vim.cmd[[runtime keymaps.vim]]
--plugin stuff
require('user.plugins')
