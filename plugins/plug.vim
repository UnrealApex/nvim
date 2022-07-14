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
" NERDTree(file explorer)
Plug 'preservim/nerdtree'
" Gitsigns
Plug 'lewis6991/gitsigns.nvim'
" Lightline (status bar)
Plug 'itchyny/lightline.vim'
" Fugitive.vim(git superpowers)
Plug 'tpope/vim-fugitive'
" Sensible.vim
Plug 'tpope/vim-sensible'
" Vim Surround
Plug 'tpope/vim-surround'
" Vim Commentary
Plug 'tpope/vim-commentary'
" indent guides
Plug 'Yggdroot/indentLine'
" Goyo
Plug 'junegunn/goyo.vim'
" GitHub Copilot
Plug 'github/copilot.vim'
" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" Conquerer of Completion(code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Repeat.vim
Plug 'tpope/vim-repeat'
" Vim Startify(start screen)
Plug 'mhinz/vim-startify'
" fzf(fuzzy finder)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Leap(sneak improved, arguably the best movement plugin out there :)           )
Plug 'ggandor/leap.nvim'
" VM multi cursors
Plug 'mg979/vim-visual-multi'
" Emmet
Plug 'mattn/emmet-vim'
" Tagbar
Plug 'preservim/tagbar'
" ToggleTerm
Plug 'akinsho/toggleterm.nvim'
" color highlighting
Plug 'norcalli/nvim-colorizer.lua'
" easily change dates
Plug 'tpope/vim-speeddating'
" whichkey(keymap hints)
Plug 'folke/which-key.nvim'
" color scheme
Plug 'LunarVim/onedarker.nvim'
call plug#end()

" enable IndentLine
let g:indentLine_enabled = 1
" files for indentLine to exclude
let g:indentLine_fileTypeExclude = ['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble', 'WhichKey', 'text', 'sh']

let g:VM_maps = {}

" set ctags path
let g:tagbar_ctags_bin = "$HOME/ctags/ctags.exe"
" map F8 to toggle Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" map Leader z to toggle Goyo
nnoremap <Leader>z :Goyo<CR>

" bind Enter to accept Copilot suggestions
imap <silent><script><expr> <C-Enter> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

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
EOF

" plugin configurations
runtime plugins/startify.vim
runtime plugins/coc.vim
runtime plugins/nerdtree.vim
runtime plugins/fzf.vim
runtime plugins/lightline.vim
runtime plugins/gitsigns.vim
