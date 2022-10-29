-- init.lua
--disable vi-compatability mode and enables useful vim functionality
vim.opt.compatible = false
--allow hidden buffers
vim.opt.hidden = true
--vim.opt.the font to Jetbrains Mono and the font size to 14 pixels
vim.opt.guifont='JetbrainsMono NF:h13'
--show line numbers
vim.opt.number = true
--show relative line numbers
vim.opt.relativenumber = true
--disable annoying error bell to prevent your ears from dying
vim.opt.errorbells = false
vim.opt.visualbell = false
-- TODO: figure out if there is a lua way to do this
--syntax highlighting
vim.cmd[[syntax on]]
--enable filetype detection
vim.cmd[[filetype on]]
--omni completion
vim.cmd[[filetype plugin on]]
--better indentation
vim.cmd[[filetype indent on]]
--don't show mode in status bar (insert/replace/...)
vim.opt.showmode = false
--show typed command in status bar
vim.opt.showcmd = true
--show cursor position in status bar
vim.opt.ruler = true
--show file in titlebar
vim.opt.title = true
--8 lines above or below cursor when scrolling
vim.opt.scrolloff=8
--don't wrap lines
vim.opt.wrap = false
--basic completion
-- TODO: make sure this works
vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.list = true
vim.opt.listchars = ''
--automatic indentation
vim.opt.autoindent = true
vim.opt.fo:append('jpor')
--more powerful backspacing
vim.opt.backspace='indent,eol,start'
--vim.opt.tabs to two spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
--indents to next multiple of 'shiftwidth'.
vim.opt.shiftround = true

vim.opt.expandtab = true
--incremental search
vim.opt.incsearch = true
vim.opt.magic = true
--ignore case unless explicitly stated
vim.opt.ignorecase = true
vim.opt.smartcase = true
--reread file if it has been modified outside of Vim
vim.opt.autoread = true
--save yourself some memory
--you are never gonna undo 1000 steps which is the default value for undolevels
--50 is the default value for history which is relatively low to be useful.
vim.opt.undolevels = 500
vim.opt.history = 500
--store all swap files in one directory
vim.opt.dir = vim.fn.stdpath('config') .. '/swap'
--store all backup files in one directory
vim.opt.backupdir = vim.fn.stdpath('config') .. '/swap'
--persistent undo tree
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildmenu = true
--vim.opt.updatetime to 200 milliseconds
vim.opt.updatetime = 200
--vim.opt.window background to dark
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.lazyredraw = true
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
--vim.opt.gutter color to match background color
-- TODO: do this in lua
vim.cmd[[highlight clear SignColumn]]
--vim.opt.path
vim.opt.path:append('.,**')

-- TODO: do this in lua
vim.cmd[[
augroup show_whitespace
  autocmd!
  autocmd ModeChanged *:[vV\x16]* :set listchars+=space:·
  autocmd Modechanged [vV\x16]*:* :set listchars-=space:·
augroup END


" autocmd BufEnter * call ChangeWorkingDirectory()
]]
--set the working directory as the one of the file currently being edited
-- TODO: rewrite this to lua
--[[ vim.cmd[[
function ChangeWorkingDirectory()
  if (bufname() != "--&& &buftype == "--&& &filetype != "--&& &readonly == 0)
    lcd %:p:h
  --don't change the working directory for buffers that aren't files
  else
  endif
endfunction
]]
-- ]]
--matchit plugin
vim.cmd[[packadd matchit]]

--change map leader to space
vim.g['mapleader'] = ' '

--remap this so that using Ctrl + C doesn't have a delay
vim.g['ftplugin_sql_omni_key '] = '<C-;>'


--plugins
vim.env.PLUGINS = vim.fn.stdpath('config') .."\\lua\\user\\plugins.lua"

--keymaps
-- TODO: change this path after keymaps.vim rewrite
vim.env.KEYMAPS = vim.fn.stdpath('config') .."\\keymaps.vim"

-- TODO: rewrite keymaps.vim to lua
--keymap management
vim.cmd[[runtime keymaps.vim]]
-- require('user.keymaps')

--plugin stuff
require('user.plugins')
