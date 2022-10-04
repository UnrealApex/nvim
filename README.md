# .dotfiles
### About
This repo just contains my Neovim configuration. Like most config files, the files in this repository include the configurations that make Neovim feel at home for me.

If you wish to use my configuration understand that **you** might need to make appropriate modifications to make this config work properly on your system. I have tailored my configuration specifically to my preferences but I am open to any suggestions.

### Plugins
I have several plugins to enhance my experience using Neovim. As a side note, a majority of the plugins in this config are Lua plugins which are currently only supported by Neovim, if you're using Vim, see my [`.vimrc`](/.vimrc).
My plugins are managed using [vim-plug](https://github.com/junegunn/vim-plug).
My config contains a [script](https://github.com/UnrealApex/dotfiles/blob/main/plugins/plug.vim#L3) that automatically installs [vim-plug](https://github.com/junegunn/vim-plug) if it is not present on your system. If you do not want that to occur, you might want to remove it before executing my config.
The plugins I use are [here](https://github.com/UnrealApex/dotfiles/blob/main/plugins/plug.vim#L12).

**Notes**
This config has several dependencies. I find it convenient to install them via a package manager:

- [Neovim](https://github.com/neovim/neovim)
- [Git](https://git-scm.com/)
- [Nodejs](https://nodejs.org/en/)
- [GNU Compiler Collection](https://gcc.gnu.org/)
- [make](https://www.gnu.org/software/make/)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Ctags](https://github.com/universal-ctags/ctags)
- [Glow](https://github.com/charmbracelet/glow)
