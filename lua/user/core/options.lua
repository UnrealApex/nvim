-- enter the current millennium
vim.opt.compatible = false
-- allow hidden buffers
vim.opt.hidden = true
-- set the guifont to Jetbrains Mono and the font size to 15 pixels
vim.opt.guifont='JetbrainsMono NF:h15'
-- show line numbers
vim.opt.number = true
-- show relative line numbers
vim.opt.relativenumber = true
-- enable cursor line
vim.opt.cursorline = true
-- disable annoying error bell to prevent your ears from dying
vim.opt.errorbells = false
vim.opt.visualbell = false
-- syntax highlighting
vim.cmd[[syntax on]]
vim.opt.showmode = false
-- show typed command in status bar
vim.opt.showcmd = true
-- show cursor position in status bar
vim.opt.ruler = true
-- show file in titlebar
vim.opt.title = true
-- 8 lines above or below cursor when scrolling
vim.opt.scrolloff=8
-- don't wrap lines
vim.opt.wrap = false
-- basic completion
vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.list = true
vim.opt.listchars = ''
-- automatic indentation
vim.opt.autoindent = true
vim.opt.fo:append('jpor')
-- more powerful backspacing
vim.opt.backspace='indent,eol,start'
-- vim.opt.tabs to two spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- indents to next multiple of 'shiftwidth'.
vim.opt.shiftround = true

vim.opt.expandtab = true
-- incremental search
vim.opt.incsearch = true
vim.opt.magic = true
-- ignore case unless explicitly stated
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- reread file if it has been modified outside of Vim
vim.opt.autoread = true
--[[
save yourself some memory
you are never gonna undo 1000 steps which is the default value for undolevels
50 is the default value for history which is relatively low to be useful.
--]]
vim.opt.undolevels = 500
vim.opt.history = 500
-- store all swap files in one directory
vim.opt.dir = vim.fn.stdpath('config') .. '/swap'
-- store all backup files in one directory
vim.opt.backupdir = vim.fn.stdpath('config') .. '/swap'
-- persistent undo tree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildmenu = true
-- set updatetime to 200 milliseconds
vim.opt.updatetime = 200
-- set window background to dark
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.lazyredraw = true
-- enable folding
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
-- make gutter match background color
vim.cmd[[highlight clear SignColumn]]
vim.opt.path:append('.,**')

-- show whitespaces as characters in visual mode
vim.cmd[[
augroup show_whitespace
  autocmd!
  autocmd ModeChanged *:[vV\x16]* :set listchars+=space:·
  autocmd Modechanged [vV\x16]*:* :set listchars-=space:·
augroup END
]]


-- load the matchit plugin
vim.cmd[[packadd matchit]]

-- enable filetype.lua
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

-- set the mapleader to space
vim.g.mapleader = ' '

-- remap this so that using Ctrl + C doesn't have a delay
vim.g.ftplugin_sql_omni_key = '<C-;>'

-- environment variables

-- $CONFIG
vim.env.CONFIG = vim.fn.stdpath('config')

-- $OPTIONS
vim.env.OPTIONS = vim.fn.stdpath('config') .."\\lua\\user\\core\\options.lua"

-- $PLUGINS
vim.env.PLUGINS = vim.fn.stdpath('config') .."\\lua\\user\\core\\plugins.lua"

-- $KEYMAPS
vim.env.KEYMAPS = vim.fn.stdpath('config') .."\\lua\\user\\core\\keymaps.lua"

