-- plugins
return {
  -- performance enhancements
  {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  },
  {
    'vigoux/notifier.nvim',
    lazy = true,
    event = 'UIEnter',
    config = function()
      require('notifier').setup()
    end
  },
  -- enhance netrw
  'tpope/vim-vinegar',
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
      require('user.plugins.gitsigns')
    end
  },
  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('user.plugins.lualine')
    end
  },
  -- conveniently run git commands from vim
  'tpope/vim-fugitive',
  {
    'tpope/vim-surround',
    keys = { "ds", "cs", "ys", { "S", mode = 'v' }, { "gS", mode = 'v' } }
  },
  -- git commit browser
  {
    'junegunn/gv.vim',
    lazy = true,
    cmd = { 'GV' },
    dependencies = { 'tpope/vim-fugitive' }
  },
  -- sensible default settings
  'tpope/vim-sensible',
  -- commenter
  {
    'numToStr/Comment.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { "gc", "gb", { "gc", mode = 'v' }, { "gb", mode = 'v' } },
    config = function()
      require('Comment').setup()
    end
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
    config = function()
      require('zen-mode').setup()
    end
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
      { "*", mode = 'v' },
      { "#", mode = 'v' },
      "g*",
      "g#",
    }
  },
  -- completion + lsp
  {
    'neoclide/coc.nvim',
    branch = 'release',
    lazy = true,
    -- VimEnter loads coc faster but startup time is increased by ~20ms
    event = { 'UIEnter' },
    dependencies = { 'neoclide/coc-sources', 'honza/vim-snippets' },
    config = function()
      require('user.plugins.coc')
    end
  },
  -- improved syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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
      { '(', mode = 'i' },
      { '{', mode = 'i' },
      { '[', mode = 'i' },
      { '"', mode = 'i' },
      { "'", mode = 'i' }
    },
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  -- start screen
  {
    'mhinz/vim-startify',
    config = function()
      require('user.plugins.startify')
    end
  },
  -- fuzzy finder
  -- TODO: figure out how to lazy load this properly
  {
    'nvim-telescope/telescope.nvim',
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
      require("user.plugins.telescope")

      -- telescope keymaps
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
      vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>')
    end
  },

  -- improved movement
  {
    'ggandor/leap.nvim',
    keys = { 's', 'S', { 's', mode = 'v' }, { 'S', mode = 'v' }, 'gs' },
    config = function()
      require('leap').set_default_keymaps()
    end
  },
  -- icons
  'nvim-tree/nvim-web-devicons',
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
  }
}
