" plugins
" automatically install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  :echo "Installing Vim Plug"
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  :echo "Vim Plug installed"
endif

" plugins (make sure you have vim plug installed, run :PlugInstall to install them)
call plug#begin('~/.vim/plugged')
" file explorer
Plug 'preservim/nerdtree'
" richer git integration
Plug 'lewis6991/gitsigns.nvim'
" status bar
Plug 'itchyny/lightline.vim'
" basic git integration
Plug 'tpope/vim-fugitive'
" sensible default settings
Plug 'tpope/vim-sensible'
" Vim Surround
Plug 'tpope/vim-surround'
" commenter
Plug 'tpope/vim-commentary'
" indent guides
Plug 'Yggdroot/indentLine'
" zen mode
Plug 'junegunn/goyo.vim'
" ai code suggestions
" Plug 'github/copilot.vim'
" easy parenthesis matching
Plug 'junegunn/rainbow_parentheses.vim'

" autocomplete
Plug 'hrsh7th/nvim-cmp'
" buffer completions
Plug 'hrsh7th/cmp-buffer'
" path completions
Plug 'hrsh7th/cmp-path'
" cmdline completions
Plug 'hrsh7th/cmp-cmdline'
" lsp completions
Plug 'hrsh7th/cmp-nvim-lsp'
" parameter hints
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
" lua completions
Plug 'hrsh7th/cmp-nvim-lua'
" calculation completions
Plug 'hrsh7th/cmp-calc'
" emoji completions 😄
Plug 'hrsh7th/cmp-emoji'

" snippet completions
Plug 'saadparwaiz1/cmp_luasnip'
"  snippets
" snippet engine
Plug 'L3MON4D3/LuaSnip'
" snippets library
Plug 'rafamadriz/friendly-snippets' 

" enable LSP
Plug 'neovim/nvim-lspconfig'
" simple to use language server installer
Plug 'williamboman/nvim-lsp-installer'

" Repeat.vim
Plug 'tpope/vim-repeat'
" start screen
Plug 'mhinz/vim-startify'
" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" better movement
Plug 'ggandor/leap.nvim'
" multi cursor support
Plug 'mg979/vim-visual-multi'
" Emmet
Plug 'mattn/emmet-vim'
" icons
Plug 'ryanoasis/vim-devicons'
" ctags
Plug 'preservim/tagbar'
" integrated terminal
Plug 'akinsho/toggleterm.nvim'
" color highlighting
Plug 'norcalli/nvim-colorizer.lua'
" easily change dates
Plug 'tpope/vim-speeddating'
" keymap hints
Plug 'folke/which-key.nvim'
" color scheme
Plug 'LunarVim/onedarker.nvim'
call plug#end()

" enable IndentLine
let g:indentLine_enabled = 1
" files for indentLine to exclude
let g:indentLine_fileTypeExclude = ['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'WhichKey', 'lsp-installer', 'text', 'sh']

let g:VM_maps = {}

" set ctags path
let g:tagbar_ctags_bin = "$HOME/ctags/ctags.exe"
" map F8 to toggle Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" map Leader z to toggle Goyo
nnoremap <Leader>z :Goyo<CR>

" bind Enter to accept Copilot suggestions
" imap <silent><script><expr> <C-Enter> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" enable RainbowParentheses
augroup rainbow_parens
  autocmd!
  autocmd VimEnter * RainbowParentheses
augroup end

" lua stuff
lua <<EOF
-- set the colorscheme to onedarker
vim.cmd("colorscheme onedarker")

require('gitsigns').setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false
  },

})

require("toggleterm").setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  start_in_insert = true,
  insert_mappings = true,
  close_on_exit = true,
  shell = vim.o.shell
})

require('colorizer').setup(
  {'*';},
  {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = true;        -- CSS rgb() and rgba() functions
	hsl_fn   = true;        -- CSS hsl() and hsla() functions
	css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

require("which-key").setup()

require('leap').set_default_keymaps()

require("nvim-lsp-installer").setup {}

require('cmp')
require('luasnip')

require("luasnip/loaders/from_vscode").lazy_load()
-- Setup nvim-cmp.
local cmp = require('cmp')

-- cmp icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
    { name = "calc" },
    { name = "emoji" },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})


-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

require('lspconfig')['vimls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['clangd'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['jdtls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['sumneko_lua'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['jsonls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['sqlls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['marksman'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['html'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
require('lspconfig')['cssls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
EOF

" plugin configurations
runtime plugins/startify.vim
" runtime plugins/coc.vim
runtime plugins/nerdtree.vim
runtime plugins/fzf.vim
runtime plugins/lightline.vim
runtime plugins/gitsigns.vim
