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
  use 'junegunn/rainbow_parentheses.vim'
  -- autocomplete
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'neoclide/coc-sources'

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

-- Repeat.vim
  use 'tpope/vim-repeat'
  -- start screen
  use 'mhinz/vim-startify'
  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  -- sets vim.ui.select to telescope
  use 'nvim-telescope/telescope-ui-select.nvim'
  -- increase telescope search speed
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- not supported on windows
  -- use 'nvim-telescope/telescope-media-files.nvim'
  -- better movement
  use 'ggandor/leap.nvim'
  -- multi cursor support
  use 'mg979/vim-visual-multi'
  -- Emmet
  use {'mattn/emmet-vim', ft = {'html', 'css'}}
  -- icons
  use 'ryanoasis/vim-devicons'
  -- easily change dates
  use 'tpope/vim-speeddating'
  -- keymap hints
  use 'folke/which-key.nvim'
  -- color scheme
  use 'folke/tokyonight.nvim'
  -- better buffer management
  use 'matbme/JABS.nvim'
  -- markdown preview
  use 'ellisonleao/glow.nvim'
  use 'akinsho/toggleterm.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- plugin configurations
require("user.lualine")
require("user.gitsigns")
require("user.notify")
require("user.telescope")
require("user.jabs")

-- vimscript files
vim.cmd[[
runtime plugins/coc.vim
runtime plugins/startify.vim
]]
