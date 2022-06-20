" startify configurations

" custom startify headers
" https://github.com/goolord/alpha-nvim/blob/20ecf5c5af6d6b830f1dc08ae7f3325cd518f0be/doc/alpha.txt#L176

let g:neovim_custom_ascii_header = [
              \  '                               __                ',
              \  '  ___     ___    ___   __  __ /\_\    ___ ___    ',
              \  ' / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ',
              \  '/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
              \  '\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
              \  ' \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
              \  ]

let g:vim_custom_ascii_header = [
              \  '         __                ',
              \  ' __  __ /\_\    ___ ___    ',
              \  '/\ \/\ \\/\ \  / __` __`\  ',
              \  '\ \ \_/ |\ \ \/\ \/\ \/\ \ ',
              \  ' \ \___/  \ \_\ \_\ \_\ \_\',
              \  '  \/__/    \/_/\/_/\/_/\/_/',
              \  ]

" set a different ASCII custom header depending on if you are using NeoVim,
" Vim, or a Vim-like editor
if has("nvim")
  let g:startify_custom_header =
        \ 'startify#pad(g:neovim_custom_ascii_header)'
        " custom header with random quote in box
        " \ 'startify#pad(g:neovim_custom_ascii_header + startify#fortune#boxed())'
elseif has("vim")
  let g:startify_custom_header =
        \ 'startify#pad(g:vim_custom_ascii_header)'
        " custom header with random quote in box
        " \ 'startify#pad(g:ascii + startify#fortune#boxed())'
else
endif

" startify bookmarks
let g:startify_bookmarks = ["$MYVIMRC", "$HOME/src", "$PLUGINS"]
