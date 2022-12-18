-- bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  " automatically compile plugins when this file is written
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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

vim.g['rainbow#pairs'] = {{'(', ')'}, {'[', ']'}, {'{', '}'}}

-- plugins
require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim'
  -- performance enhancements
  use {
    'lewis6991/impatient.nvim',
    config = "require('impatient')"
  }
  -- more aesthetic notifications
  use {
    'rcarriga/nvim-notify',
    config = "require('user.plugins.notify')"
  }
  -- enhance netrw
  use 'tpope/vim-vinegar'
  use {
    'tpope/vim-unimpaired',
    keys = {
      { 'n', '[' },
      { 'n', ']' }
    }
  }
  -- better git integration
  use {
    'lewis6991/gitsigns.nvim',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = "require('user.plugins.gitsigns')"
  }
  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
      config = "require('user.plugins.lualine')"
  }
  -- conveniently run git commands from vim
  use 'tpope/vim-fugitive'
  use {
    'tpope/vim-surround',
    keys = { { "n", "ds" }, { "n", "cs" }, { "n", "ys" }, { "v", "S" }, { "v", "gS" } }
  }
  -- git commit browser
  use {
    'junegunn/gv.vim',
    opt = true,
    cmd = { 'GV' },
    requires = { 'tpope/vim-fugitive' }
  }
  -- sensible default settings
  use 'tpope/vim-sensible'
  -- commenter
  use {
    'numToStr/Comment.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    keys = { { "n", "gc" }, { "n", "gb" }, { "v", "gc" }, { "v", "gb" } },
    config = "require('Comment').setup()"
  }
  -- indent guides
  use {
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    requires = { 'nvim-treesitter/nvim-treesitter' },
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
    cmd = { 'ZenMode' },
    config = "require('zen-mode').setup()"
  }
  -- parentheses colorizer
  use {
    'junegunn/rainbow_parentheses.vim',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = 'vim.cmd [[RainbowParentheses]]'
  }
  -- turn off search highlighting automatically
  use {
    'romainl/vim-cool',
    -- load vim-cool when doing a search
    keys = {
      { "n", "/" },
      { "n", "?" },
      { "n", "n" },
      { "n", "N" },
      { "n", "*" },
      { "n", "#" },
      { "v", "*" },
      { "v", "#" },
      { "n", "g*" },
      { "n", "g#" },
    }
  }


  use {
    'neovim/nvim-lspconfig',
    config = "require('user.plugins.lsp')"
  }
  use {
    'williamboman/mason.nvim',
    opt = true,
    cmd = {'Mason'},
    config = "require('mason').setup()",
    requires = {
      {
          'williamboman/mason-lspconfig.nvim',
          config = function()
            require("mason-lspconfig").setup({
              automatic_installation = true,
            })
          end
      }
    }
  }
  use {
    'glepnir/lspsaga.nvim',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = "require('user.plugins.lsp')"
  }

  use {
    'CosmicNvim/cosmic-ui',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = "require('user.plugins.lsp')",
    requires = {'MunifTanjim/nui.nvim'}
  }

  use {
    'hrsh7th/nvim-cmp',
    opt = true,
    event = {'InsertEnter', 'CmdlineEnter'},
    config = function()
      require('user.plugins.cmp')
      require('user.plugins.lsp')
    end,
    requires = {
       'hrsh7th/cmp-cmdline',
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/cmp-nvim-lsp-signature-help',
       'hrsh7th/cmp-nvim-lua',
       'hrsh7th/cmp-calc',
       'hrsh7th/cmp-emoji',
       'saadparwaiz1/cmp_luasnip',
       'L3MON4D3/LuaSnip',
       'rafamadriz/friendly-snippets',
      }
    }

  use {
    'folke/trouble.nvim',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = "require('trouble').setup()"
  }

  -- improved syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    opt = true,
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = {
      'TSBufDisable',
      'TSBufEnable',
      'TSBufToggle',
      'TSConfigInfo',
      'TSDisable',
      'TSEditQuery',
      'TSEditQueryUserAfter',
      'TSEnable',
      'TSInstall',
      'TSInstallFromGrammar',
      'TSInstallInfo',
      'TSInstallSync',
      'TSModuleInfo',
      'TSToggle',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
    },
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
        },
        indent = { enable = true, disable = { "yaml" } },
      }
      -- hack to make rainbow_parentheses work with treesitter
      vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })
    end
  }
  -- automatically close pairs
  use {
    "windwp/nvim-autopairs",
    -- load when starting bracket delimiter is pressed
    keys = {
      { 'i', '(' },
      { 'i', '{' },
      { 'i', '[' },
      { 'i', '"' },
      { 'i', "'" }
    },
    config = "require('nvim-autopairs').setup()"
  }
  -- start screen
  use {
    'mhinz/vim-startify',
    config = "require('user.plugins.startify')"
  }
  -- fuzzy finder
  -- TODO: figure out how to lazy load this properly
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
    },
    config = function()
      require("user.plugins.telescope")

      -- telescope keymaps
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
      vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
    end
  }

  -- improved movement
  use {
    'ggandor/leap.nvim',
    keys = { { 'n', 's' }, { 'n', 'S' } },
    config = "require('leap').set_default_keymaps()"
  }
  -- icons
  use 'nvim-tree/nvim-web-devicons'
  -- colorscheme
  use {
    "rebelot/kanagawa.nvim",
    config = 'vim.cmd [[colorscheme kanagawa]]'
  }
  -- markdown preview
  use {
    'ellisonleao/glow.nvim',
    opt = true,
    ft = 'markdown'
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

vim.keymap.set('n', '<C-\\>', ':ToggleTerm<CR>')


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
  if packer_plugins["zen-mode.nvim"] then
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
  else
    vim.notify(
      "error: zen-mode.nvim is not installed!" ..
      "\n" ..
      "prose mode will not function without it!",
      vim.log.levels.ERROR
    )
  end
end

vim.api.nvim_create_user_command('Prose', prose, {})
