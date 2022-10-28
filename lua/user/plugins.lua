local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'nvim-lua/plenary.nvim'
  -- make neovim faster
  use 'lewis6991/impatient.nvim'
  use {'dstein64/vim-startuptime', opt = true, cmd = {'StartupTime'}}
  -- more aesthetic notifications
  use 'rcarriga/nvim-notify'
  -- vim popup api
  use 'nvim-lua/popup.nvim'
  -- file explorer
  use 'tpope/vim-vinegar'
  -- richer git integration
  use 'lewis6991/gitsigns.nvim'
  -- status bar
  use 'nvim-lualine/lualine.nvim'
  -- basic git integration
  use {'tpope/vim-fugitive', opt = true, cmd = {'G'}}
  use 'tpope/vim-surround'
  -- git commit browser
  use {'junegunn/gv.vim', opt = true, cmd = {'GV'}}
  -- git conflict helper
  use 'rhysd/conflict-marker.vim'
  -- sensible default settings
  use 'tpope/vim-sensible'
  -- commenter
  use 'numToStr/Comment.nvim'
  -- indent guides
  use 'lukas-reineke/indent-blankline.nvim'
  -- zen mode
  use {'junegunn/goyo.vim', opt = true, cmd = {'Goyo'}}
  -- easy parenthesis matching
  use {
    'junegunn/rainbow_parentheses.vim',
    opt = true,
    event = 'VimEnter',
    config = vim.cmd[[RainbowParentheses]]
  }
  -- autocomplete
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }
  use {
    'neoclide/coc-sources',
    requires = {'neoclide/coc.nvim'}
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

-- Repeat.vim
  use 'tpope/vim-repeat'
  -- start screen
  use 'mhinz/vim-startify'
  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  -- sets vim.ui.select to telescope
  use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = {'nvim-telescope/telescope.nvim'}
  }
  -- increase telescope search speed
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    requires = {'nvim-telescope/telescope.nvim'}
  }
  -- not supported on windows
  -- use 'nvim-telescope/telescope-media-files.nvim'
  -- better movement
  use 'ggandor/leap.nvim'
  -- multi cursor support
  use 'mg979/vim-visual-multi'
  -- Emmet
  use {
    'mattn/emmet-vim',
    opt = true,
    ft = {'html', 'css', 'javascript'}
  }
  -- icons
  use 'ryanoasis/vim-devicons'
  -- easily change dates
  use 'tpope/vim-speeddating'
  -- keymap hints
  use 'folke/which-key.nvim'
  -- color scheme
  use 'folke/tokyonight.nvim'
  -- better buffer management
  use {
    'matbme/JABS.nvim',
    opt = true,
    cmd= 'JABSOpen',
    config = function()
      require('jabs').setup()
      require('user.jabs')
    end
  }
  -- markdown preview
  use {
    'ellisonleao/glow.nvim',
    opt = true,
    cmd = {'Glow'}
  }
  use {
    'akinsho/toggleterm.nvim',
    opt = true,
    cmd = {'ToggleTerm'},
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
      })
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-t>', ':Telescope live_grep<CR>')

vim.keymap.set('n', '<leader>b', ':JABSOpen<CR>')

vim.keymap.set('n', '<leader>z', 'Goyo<CR>')


require('impatient')

require('Comment').setup()

require("which-key").setup()

require('leap').set_default_keymaps()

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

-- treesitter stuff
local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}

-- TODO: implement prose mode function in lua

vim.cmd[[colorscheme tokyonight-moon]]

-- globals
vim.g['indentLine_fileTypeExclude'] = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'WhichKey', 'lsp-installer', 'mason', 'text', 'sh'}

-- plugin configurations
require("user.lualine")
require("user.gitsigns")
require("user.notify")
require("user.telescope")
-- require("user.jabs")

-- vimscript files
vim.cmd[[
runtime plugins/coc.vim
runtime plugins/startify.vim
]]
