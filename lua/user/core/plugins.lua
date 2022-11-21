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
  -- make neovim faster
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }
  -- more aesthetic notifications
  use {
    'rcarriga/nvim-notify',
    config = function()
      require("user.plugins.notify")
    end
  }
  -- enhance netrw
  use {
    'tpope/vim-vinegar',
    ft = {"netrw"},
    keys = {{'n', '-'}}
  }
  -- better git integration
  use {
    'lewis6991/gitsigns.nvim',
    opt = true,
    event = {'BufReadPre'},
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
  -- conveniently run git commands from vim
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
  use {
    'rhysd/conflict-marker.vim',
    opt = true,
    event = {'BufReadPre'}
  }
  -- sensible default settings
  use 'tpope/vim-sensible'
  -- commenter
  use {
    'numToStr/Comment.nvim',
    requires = {'nvim-treesitter/nvim-treesitter'},
    keys = {{"n", "gc"}, {"n", "gb"}, {"v", "gc"}, {"v", "gb"}},
    config = function()
      require('Comment').setup()
    end
  }
  -- indent guides
  use {
  'lukas-reineke/indent-blankline.nvim',
  opt = true,
  event = {'BufReadPre'},
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
  -- easy parentheses matching
  use {
    'junegunn/rainbow_parentheses.vim',
    opt = true,
    event = {'BufReadPre'}
  }
  use {
    'romainl/vim-cool',
    -- load vim-cool when doing a search
    keys = {{"n", "/"}}
  }
  -- completion + lsp
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    opt = true,
    event = 'UIEnter',
    requires = {"neoclide/coc-sources"},
    config = function()
      require('user.plugins.coc')
    end
  }
  -- better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    opt = true,
    event = 'BufReadPre',
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
  -- automatically close pairs
  use {
    "windwp/nvim-autopairs",
    -- load when starting bracket delimiter is pressed
    keys = {
      {'i', '('},
      {'i', '{'},
      {'i', '['},
      {'i', '"'},
      {'i', "'"}
    },
    config = function()
      require("nvim-autopairs").setup()
    end
  }
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
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        -- increase telescope search speed
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      }
      -- not supported on windows
      -- use 'nvim-telescope/telescope-media-files.nvim'
    },
    config = function()
      require("user.plugins.telescope")

      -- telescope keymaps
      vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
      vim.keymap.set('n', '<C-t>', ':Telescope live_grep<CR>')
    end
  }

  -- better movement
  use {
    'ggandor/leap.nvim',
    keys = {{'n', 's'}, {'n', 'S'}},
    config = function()
      require('leap').set_default_keymaps()
    end
  }
  -- icons
  use 'ryanoasis/vim-devicons'
  -- colorscheme
  use {
  'dracula/vim',
  config = function()
    vim.cmd[[colorscheme dracula]]
  end
  }
  -- markdown preview
  use {
    'ellisonleao/glow.nvim',
    opt = true,
    cmd = {'Glow'}
  }
  -- FIXME: figure out how to lazy load toggleterm properly
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


vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')

-- FIXME: make sure that ZenMode is installed
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

