-- startify stuff

-- custom startify headers
-- https://github.com/goolord/alpha-nvim/blob/20ecf5c5af6d6b830f1dc08ae7f3325cd518f0be/doc/alpha.txt#L176

vim.g['neovim_custom_ascii_header'] = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

vim.g['vim_custom_ascii_header'] = {
  [[         __                ]],
  [[ __  __ /\_\    ___ ___    ]],
  [[/\ \/\ \\/\ \  / __` __`\  ]],
  [[\ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[ \ \___/  \ \_\ \_\ \_\ \_\]],
  [[  \/__/    \/_/\/_/\/_/\/_/]],
}

if vim.fn.has('nvim') == 1 then
  vim.g['startify_custom_header'] = 'startify#pad(g:neovim_custom_ascii_header)'
-- NOTE: this condition is probably useless because vim doesn't have lua support
elseif vim.fn.has('vim') == 1 then
  vim.g['startify_custom_header'] = 'startify#pad(g:neovim_custom_ascii_header)'
else
end

vim.g['startify_bookmarks'] = {'$MYVIMRC', '$HOME/src', '$PLUGINS', '$KEYMAPS'}
