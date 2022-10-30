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

-- declare before indent-blankline is loaded
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'WhichKey', 'lsp-installer', 'mason', 'text', 'sh'}

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- make neovim faster
  use 'lewis6991/impatient.nvim'
  use {
    'dstein64/vim-startuptime',
    opt = true,
    cmd = {'StartupTime'}
  }
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
  use {
    'tpope/vim-fugitive',
    opt = true,
    cmd = {'G'}
  }
  use 'tpope/vim-surround'
  -- git commit browser
  use {
    'junegunn/gv.vim',
    opt = true,
    cmd = {'GV'}
  }
  -- git conflict helper
  use 'rhysd/conflict-marker.vim'
  -- sensible default settings
  use 'tpope/vim-sensible'
  -- commenter
  use 'numToStr/Comment.nvim'
  -- indent guides
  use {
  'lukas-reineke/indent-blankline.nvim',
  requires = {'nvim-treesitter/nvim-treesitter'}
  }
  -- zen mode
  use {
    'folke/zen-mode.nvim',
    opt = true,
    cmd = {'ZenMode'},
    config = function()
      require('zen-mode').setup()
    end,
    ft = {'markdown'}
  }
  -- easy parenthesis matching
  use 'junegunn/rainbow_parentheses.vim'
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
  use {
  'nvim-telescope/telescope.nvim',
  requires = {'nvim-lua/plenary.nvim'}
  }
  -- sets vim.ui.select to telescope
  use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = {'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-fzf-native.nvim'}
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
  use 'justinmk/vim-sneak'
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
      require('user.plugins.jabs')
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

vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')


require('impatient')

require('Comment').setup()

require("which-key").setup()

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

prosed = false
function prose()
 if not prosed then
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
    vim.opt_local.wrap = true

    -- normal mode mappings
    vim.keymap.set('n', 'j', 'gj')
    vim.keymap.set('n', 'k', 'gk')
    vim.keymap.set('n', '0', 'g0')
    vim.keymap.set('n', '$', 'g$')
    vim.keymap.set('n', '^', 'g^')

    vim.keymap.set('v', 'j', 'gj')
    vim.keymap.set('v', 'k', 'gk')
    vim.keymap.set('v', '0', 'g0')
    vim.keymap.set('v', '$', 'g$')
    vim.keymap.set('v', '^', 'g^')
    prosed = true
    vim.cmd[[ZenMode]]
    print('Prose Mode Enabled')
  else
    vim.opt_local.spell = false
    vim.opt_local.spelllang = nil
    vim.opt_local.wrap = false

    -- normal mode mappings
    vim.keymap.set('n', 'j', 'j')
    vim.keymap.set('n', 'k', 'k')
    vim.keymap.set('n', '0', '0')
    vim.keymap.set('n', '$', '$')
    vim.keymap.set('n', '^', '^')

    vim.keymap.set('v', 'j', 'j')
    vim.keymap.set('v', 'k', 'k')
    vim.keymap.set('v', '0', '0')
    vim.keymap.set('v', '$', '$')
    vim.keymap.set('v', '^', '^')
    prosed = false
    vim.cmd[[ZenMode]]
    print('Prose Mode Disabled')
  end
end

vim.api.nvim_create_user_command('Prose', prose, {})

vim.cmd[[colorscheme tokyonight-moon]]

-- plugin configurations
require("user.plugins.lualine")
require("user.plugins.gitsigns")
require("user.plugins.notify")
require("user.plugins.telescope")
require('user.plugins.coc')
require('user.plugins.startify')
