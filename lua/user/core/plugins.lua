-- bootstrap packer
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

-- plugins
require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- make neovim faster
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }
  use {
    'dstein64/vim-startuptime',
    opt = true,
    cmd = {'StartupTime'}
  }
  -- more aesthetic notifications
  use {
    'rcarriga/nvim-notify',
    config = function()
      require("user.plugins.notify")
    end
  }
  -- vim popup api
  use 'nvim-lua/popup.nvim'
  -- file explorer
  use {
    'tpope/vim-vinegar',
    ft = {"netrw"},
    keys = {{'n', '-'}}
  }
  -- richer git integration
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("user.plugins.gitsigns")
    end
  }
  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("user.plugins.lualine")
    end
  }
  -- basic git integration
  use 'tpope/vim-fugitive'
  use {
    'tpope/vim-surround',
    keys = {{"n", "ds"}, {"n", "cs"}, {"n", "ys"}, {"v", "S"}, {"v", "gS"}}
  }
  -- git commit browser
  use {
    'junegunn/gv.vim',
    opt = true,
    cmd = {'GV'},
    requires = {'tpope/vim-fugitive'}
  }
  -- git conflict helper
  use 'rhysd/conflict-marker.vim'
  -- sensible default settings
  use 'tpope/vim-sensible'
  -- commenter
  use {
    'numToStr/Comment.nvim',
    keys = {{"n", "gc"}, {"n", "gb"}},
    config = function()
      require('Comment').setup()
    end
  }
  -- indent guides
  use {
  'lukas-reineke/indent-blankline.nvim',
  requires = {'nvim-treesitter/nvim-treesitter'},
  config = function()
    require("indent_blankline").setup {
      show_current_context = true,
      show_current_context_start = true,
    }
  end
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
  use {
    'romainl/vim-cool',
    -- load vim-cool when doing a search
    keys = {{"n", "/"}}
  }
  -- autocomplete
  use {
    -- completion and lsp
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('user.plugins.coc')
    end
  }
  use {
    'neoclide/coc-sources',
    requires = {'neoclide/coc.nvim'}
  }

  use {
    -- better syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
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
    end
  }

  use {
    "windwp/nvim-autopairs",
    opt = true,
    event = {"InsertEnter"},
    config = function()
      require("nvim-autopairs").setup()
    end
  }


-- Repeat.vim
  use 'tpope/vim-repeat'
  -- start screen
  use {
    'mhinz/vim-startify',
    config = function()
      require('user.plugins.startify')
    end
  }
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("user.plugins.telescope")

      -- telescope keymaps
      vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
      vim.keymap.set('n', '<C-t>', ':Telescope live_grep<CR>')
    end
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
  use {
    'ggandor/leap.nvim',
    keys = {{'n', 's'}, {'n', 'S'}},
    config = function()
      require('leap').set_default_keymaps()
    end
  }

  -- Emmet
  use {
    'mattn/emmet-vim',
    opt = true,
    ft = {'html', 'css', 'javascript'}
  }
  -- icons
  use 'ryanoasis/vim-devicons'
  -- easily change dates
  use {
    'tpope/vim-speeddating',
    keys = {{"n", "<C-a>"}, {"n", "<C-x>"}}
  }
  -- keymap hints
  use {
  'folke/which-key.nvim',
  config = function()
    require("which-key").setup()
  end
  }
  -- colorscheme
  use {
  'folke/tokyonight.nvim',
  config = function()
    vim.cmd[[colorscheme tokyonight-night]]
  end
  }
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
    -- terminal
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
end,
  config = {
    display = {
      open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
    }
  }
})


-- plugin related keymaps
-- lazy loaded plugin keymaps set here
-- NOTE: ensure that keymaps for plugins lazy loaded by command are here or
-- else they won't load

vim.keymap.set('n', '<leader>b', ':JABSOpen<CR>')

vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')


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

