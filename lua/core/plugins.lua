{
  -- enhance netrw
  'justinmk/vim-dirvish',
  {
    'tpope/vim-eunuch',
    lazy = true,
    cmd = {
      'Remove',
      'Unlink',
      'Delete',
      'Copy',
      'Duplicate',
      'Move',
      'Rename',
      'Chmod',
      'Mkdir',
      'Cfind',
      'Lfind',
      'Clocate',
      'Llocate',
      'SudoEdit',
      'SudoWrite',
      'Wall',
      'W',
    }
  },
  {
    'tpope/vim-rsi',
    lazy = true,
    event = {'InsertEnter', 'CmdlineEnter'}
  },
  {
    'echasnovski/mini.move',
    keys = {
      '<A-h>',
      '<A-j>',
      '<A-k>',
      '<A-l>',
      { '<A-h>', mode = 'v' },
      { '<A-j>', mode = 'v' },
      { '<A-k>', mode = 'v' },
      { '<A-l>', mode = 'v' }
    },
    config = function()
      require('mini.move').setup()
    end
  },
  {
    'tpope/vim-unimpaired',
    keys = { '[', ']' }
  },
  -- better git integration
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugins.gitsigns')
    end
  },
  -- status bar
  {
    'nvim-lualine/lualine.nvim',
      config = function()
        require('plugins.lualine')
      end
  },
  -- conveniently run git commands from vim
  'tpope/vim-fugitive',
  {
    'tpope/vim-surround',
    keys = {  "ds",  "cs",  "ys", { "S", mode="v" }, { "gS", mode="v" } }
  },
  -- git commit browser
  {
    'junegunn/gv.vim',
    lazy = true,
    cmd = { 'GV' },
    dependencies = { 'tpope/vim-fugitive' }
  },
  -- commenter
  {
    'numToStr/Comment.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {  "gc",  "gb", { "gc", mode="v" }, { "gb", mode="v" } },
    config = true
  },
  -- indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
  -- zen mode
  {
    'folke/zen-mode.nvim',
    lazy = true,
    cmd = { 'ZenMode' },
    config = true
  },
  -- parentheses colorizer
  {
    'junegunn/rainbow_parentheses.vim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.cmd [[RainbowParentheses]]
    end
  },
  -- turn off search highlighting automatically
  {
    'romainl/vim-cool',
    -- load vim-cool when doing a search
    keys = {
       "/",
       "?",
       "n",
       "N",
       "*",
       "#",
      { "*", mode="v" },
      { "#", mode="v" },
       "g*",
       "g#",
    }
  },


  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp')
    end
  },
  {
    'williamboman/mason.nvim',
    lazy = true,
    cmd = {'Mason'},
    config = true,
    dependencies = {
      {
          'williamboman/mason-lspconfig.nvim',
          config = function()
            require("mason-lspconfig").setup({
              automatic_installation = true,
            })
          end
      }
    }
  },
  {
    'glepnir/lspsaga.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugins.lsp')
    end
  },

  {
    'CosmicNvim/cosmic-ui',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugins.lsp')
    end,
    dependencies = {'MunifTanjim/nui.nvim'}
  },

  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = {'InsertEnter', 'CmdlineEnter'},
    config = function()
      require('plugins.cmp')
      require('plugins.lsp')
    end,
    dependencies = {
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
  },

  {
    'folke/trouble.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = true
  },

  -- improved syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
     ':TSUpdate',
    lazy = true,
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
  },
  -- automatically close pairs
  {
    "windwp/nvim-autopairs",
    -- load when starting bracket delimiter is pressed
    keys = {
      { '(', mode="i" },
      { '{', mode="i"},
      { '[', mode="i"},
      { '"', mode="i"},
      { "'", mode="i"}
    },
    config = true
  },
  -- start screen
  {
    'mhinz/vim-startify',
    config = function()
      require('plugins.startify')
    end
  },
  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        -- increase telescope search speed
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      }
    },
    config = function()
      require("plugins.telescope")

    end
  },

  -- improved movement
  {
    'ggandor/leap.nvim',
    keys = { 's', 'S' },
    config = function()
      require('leap').set_default_keymaps()
    end
  },
  -- icons
  'nvim-tree/nvim-web-devicons'
  -- colorscheme
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd [[colorscheme kanagawa]]
    end
  },
  -- markdown preview
  {
    'ellisonleao/glow.nvim',
    lazy = true,
    ft = 'markdown'
  },
}

