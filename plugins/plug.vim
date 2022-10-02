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
" lua libary
Plug 'nvim-lua/plenary.nvim'
" make neovim faster
Plug 'lewis6991/impatient.nvim'
Plug 'dstein64/vim-startuptime', {'on': 'StartupTime'}
" vim popup api
Plug 'nvim-lua/popup.nvim'
" more aesthetic notifications
Plug 'rcarriga/nvim-notify'
" aesthetic code actions
Plug 'CosmicNvim/cosmic-ui'
Plug 'MunifTanjim/nui.nvim'
" file explorer
Plug 'preservim/nerdtree'
" allow nerdtree operations on multiple file nodes
Plug 'PhilRunninger/nerdtree-visual-selection', {'on': 'NERDTree'}
" show git signs in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTree'}
" richer git integration
Plug 'lewis6991/gitsigns.nvim'
" status bar
Plug 'nvim-lualine/lualine.nvim'
" basic git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" git conflict helper
Plug 'rhysd/conflict-marker.vim'
" sensible default settings
Plug 'tpope/vim-sensible'
" commenter
Plug 'numToStr/Comment.nvim'
" indent guides
Plug 'Yggdroot/indentLine'
" zen mode
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
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
" spelling suggestions
Plug 'f3fora/cmp-spell'
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
" lspsaga
Plug 'glepnir/lspsaga.nvim'
" simple to use package manager
Plug 'williamboman/mason.nvim', {'on': 'Mason'}
Plug 'williamboman/mason-lspconfig.nvim', {'on': 'Mason'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Repeat.vim
Plug 'tpope/vim-repeat'
" start screen
Plug 'mhinz/vim-startify'
" fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
" sets vim.ui.select to telescope
Plug 'nvim-telescope/telescope-ui-select.nvim'
" not supported on windows
" Plug 'nvim-telescope/telescope-media-files.nvim'
" TODO: get Telescope fzf working
" TODO: figure out why this extension is not being found
" increase telescope search speed
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" better movement
Plug 'ggandor/leap.nvim'
" multi cursor support
Plug 'mg979/vim-visual-multi'
" Emmet
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
" icons
Plug 'ryanoasis/vim-devicons'
" easily change dates
Plug 'tpope/vim-speeddating'
" keymap hints
Plug 'folke/which-key.nvim'
Plug 'folke/trouble.nvim', {'on': 'Trouble'}
" color scheme
Plug 'folke/tokyonight.nvim'
" better buffer management
Plug 'matbme/JABS.nvim'
" markdown preview
Plug 'ellisonleao/glow.nvim'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

" enable IndentLine
let g:indentLine_enabled = 1
" prevent indentLine from setting conceallevel for markdown files
let g:markdown_syntax_conceal=0
" prevent indentLine from setting conceallevel for json files
let g:vim_json_conceal=0
" files for indentLine to exclude
let g:indentLine_fileTypeExclude = ['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'WhichKey', 'lsp-installer', 'mason', 'text', 'sh']
" use nerdfont icons for nerdtree git status indicators
let g:NERDTreeGitStatusUseNerdFonts = 1

" don't confirm opening, copying, or moving of files in nerdtree visual
" selection mode
let g:nerdtree_vis_confirm_open = 0
let g:nerdtree_vis_confirm_copy = 0
let g:nerdtree_vis_confirm_move = 0

let g:VM_maps = {}

" map Leader z to toggle Goyo
nnoremap <Leader>z :Goyo<CR>

" prose mode
" does not work without goyo
function ProseMode()
  if (!exists('t:goyo_master'))
  " enable prose mode
  " set spell checking
  setlocal spell spelllang=en_us
  " set line wrapping
  setlocal wrap
  " map j and k to navigate visual lines instead of actual lines
  " normal mode mappings
  nnoremap j gj
  nnoremap k gk
  nnoremap 0 g0
  nnoremap $ g$
  nnoremap ^ g^
  " visual mode mappings
  vnoremap j gj
  vnoremap k gk
  vnoremap 0 g0
  vnoremap $ g$
  vnoremap ^ g^
  Goyo
  echo "Prose Mode Enabled"
else
  " disable prose mode
  setlocal nospell spelllang=
  setlocal nowrap
  " hack to return keys back to their original functionalities
  " normal mode unmappings
  nnoremap j j
  nnoremap k k
  nnoremap 0 0
  nnoremap $ $
  nnoremap ^ ^
  " visual mode unmappings
  vnoremap j j
  vnoremap k k
  vnoremap 0 0
  vnoremap $ $
  vnoremap ^ ^
  Goyo!
  echo "Prose Mode Disabled"
endif
endfunction

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-t> :Telescope live_grep<CR>

nnoremap <C-m> :TroubleToggle<CR>

nnoremap <leader>b :JABSOpen<CR>

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
-- set the colorscheme to tokyonight
vim.cmd("colorscheme tokyonight")

-- make neovim faster
require('impatient')

require('Comment').setup()

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

require("which-key").setup()

require('leap').set_default_keymaps()

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

-- require('telescope').load_extension('media_files')

-- todo get toggleterm to start in insert mode
require("toggleterm").setup({
  open_mapping = [[<leader>\]],
})
EOF

" plugin configurations
runtime plugins/startify.vim
runtime plugins/nerdtree.vim
" lua files
lua require("user.lualine")
lua require("user.cmp")
lua require("user.gitsigns")
lua require("user.lsp")
lua require("user.notify")
lua require("user.telescope")
lua require("user.jabs")
