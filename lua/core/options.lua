-- enter the current millennium
vim.opt.compatible = false
-- allow hidden buffers
vim.opt.hidden = true
-- show line numbers
vim.opt.number = true
-- show relative line numbers
vim.opt.relativenumber = true
-- enable cursor line
vim.opt.cursorline = true
-- disable annoying error bell
vim.opt.errorbells = false
vim.opt.visualbell = false
-- syntax highlighting
vim.cmd [[syntax on]]
vim.opt.showmode = false
-- show typed command in status bar
vim.opt.showcmd = true
-- show cursor position in status bar
vim.opt.ruler = true
-- show file in titlebar
vim.opt.title = true
-- 8 lines above or below cursor when scrolling
vim.opt.scrolloff = 8
-- don't wrap lines
vim.opt.wrap = false
vim.opt.pumheight = 10
-- basic completion
vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.list = true
vim.opt.listchars = ''
-- automatic indentation
vim.opt.autoindent = true
vim.opt.fo:append('jpor')
-- more powerful backspacing
vim.opt.backspace = 'indent,eol,start'
-- set tabs to two spaces
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
-- enable folding
vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
-- make gutter match background color
vim.cmd [[highlight clear SignColumn]]
vim.opt.path:append('.,**')

-- show whitespaces as characters in visual mode
vim.cmd [[
augroup show_whitespace
  autocmd!
  autocmd ModeChanged *:[vV\x16]* :set listchars+=space:·
  autocmd Modechanged [vV\x16]*:* :set listchars-=space:·
augroup END
]]


-- load the matchit plugin
vim.cmd [[packadd matchit]]


--globals

-- enable filetype.lua
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- set the mapleader to space
vim.g.mapleader = ' '

vim.g.netrw_keepdir = 0

-- declare before indent-blankline is loaded
vim.g.indent_blankline_filetype_exclude = {
  'help',
  'startify',
  'dashboard',
  'packer',
  'neogitstatus',
  'NvimTree',
  'Trouble',
  'WhichKey',
  'lsp-installer',
  'mason',
  'text',
  'sh'
}

vim.g['rainbow#pairs'] = { { '(', ')' }, { '[', ']' }, { '{', '}' } }


function LargeFileHandler()
  vim.notify(
    'Large file detected, disabling certain features for performance reasons',
    vim.log.levels.WARNING
  )
  if vim.fn.exists(':TSBufDisable') then
    vim.cmd [[TSBufDisable highlight]]
    vim.cmd [[TSBufDisable autotag]]
  end
  vim.opt.foldmethod = 'manual'
  vim.cmd [[syntax clear]]
  vim.cmd [[syntax off]]
  vim.cmd [[filetype off]]
  vim.opt.undofile = false
  vim.opt.swapfile = false
end

function LargeFileChecker()
  if vim.fn.getfsize(vim.fn.expand("%")) > (512 * 1024) then
    LargeFileHandler()
  else
  end
end

-- TODO: find a way to make these two autocommands one
vim.cmd [[
  augroup LargeFileDetection
    autocmd!
    autocmd BufReadPre * lua LargeFileChecker()
    autocmd FileReadPre * lua LargeFileChecker()
  augroup END
  ]]


prosed = false
function prose()
  -- make sure zen-mode.nvim is installed
  -- toggle prose mode
  if not prosed then
    -- enable spellcheck and line wrapping
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
    vim.opt_local.wrap = true

    -- normal mode mappings
    vim.keymap.set('n', 'j', 'gj')
    vim.keymap.set('n', 'k', 'gk')
    vim.keymap.set('n', '0', 'g0')
    vim.keymap.set('n', '$', 'g$')
    vim.keymap.set('n', '^', 'g^')

    -- visual mode mappings
    vim.keymap.set('v', 'j', 'gj')
    vim.keymap.set('v', 'k', 'gk')
    vim.keymap.set('v', '0', 'g0')
    vim.keymap.set('v', '$', 'g$')
    vim.keymap.set('v', '^', 'g^')
    prosed = true
    vim.cmd [[ZenMode]]
    vim.notify('Prose Mode Enabled')
  else
    -- disable spellcheck and line wrapping
    vim.opt_local.spell = false
    vim.opt_local.spelllang = nil
    vim.opt_local.wrap = false

    -- reset normal mode mappings
    vim.keymap.set('n', 'j', 'j')
    vim.keymap.set('n', 'k', 'k')
    vim.keymap.set('n', '0', '0')
    vim.keymap.set('n', '$', '$')
    vim.keymap.set('n', '^', '^')

    -- reset visual mode mappings
    vim.keymap.set('v', 'j', 'j')
    vim.keymap.set('v', 'k', 'k')
    vim.keymap.set('v', '0', '0')
    vim.keymap.set('v', '$', '$')
    vim.keymap.set('v', '^', '^')
    prosed = false
    vim.cmd [[ZenMode]]
    vim.notify('Prose Mode Disabled')
  end
end

vim.api.nvim_create_user_command('Prose', prose, {})


-- environment variables

-- $CONFIG
vim.env.CONFIG = vim.fn.stdpath('config')

-- handle os file path variations
if vim.fn.has('unix') == 1 then
  -- $OPTIONS
  vim.env.OPTIONS = vim.fn.stdpath('config') .. "/lua/core/options.lua"

  -- $LAZY
  vim.env.LAZY = vim.fn.stdpath('config') .. "/lua/core/lazy.lua"

  -- $PLUGINS
  vim.env.PLUGINS = vim.fn.stdpath('config') .. "/lua/core/plugins.lua"

  -- $KEYMAPS
  vim.env.KEYMAPS = vim.fn.stdpath('config') .. "/lua/core/keymaps.lua"
elseif vim.fn.has('win32') == 1 then

  -- $OPTIONS
  vim.env.OPTIONS = vim.fn.stdpath('config') .. "\\lua\\core\\options.lua"

  -- $LAZY
  vim.env.LAZY = vim.fn.stdpath('config') .. "\\lua\\core\\lazy.lua"

  -- $PLUGINS
  vim.env.PLUGINS = vim.fn.stdpath('config') .. "\\lua\\core\\plugins.lua"

  -- $KEYMAPS
  vim.env.KEYMAPS = vim.fn.stdpath('config') .. "\\lua\\core\\keymaps.lua"
else
end
