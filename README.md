# .dotfiles
### About
This repo just contains my Neovim configuration. Like most config files, the files in this repository include the configurations that make Neovim feel at home for me.

If you wish to use my configuration, acknowledge that there will be some work on your end to get this config working properly.

### Plugins
I have several plugins to enhance my experience using Neovim. As a side note, a majority of the plugins in this config are Lua plugins which are currently only supported by Neovim, if you're using Vim, see my [`.vimrc`](/.vimrc).
My plugins are managed using [vim-plug](https://github.com/junegunn/vim-plug).
My config contains a [script](https://github.com/UnrealApex/dotfiles/blob/main/plugins/plug.vim#L3) that automatically installs [vim-plug](https://github.com/junegunn/vim-plug) if it is not present on your system. If you do not want that to occur, you might want to remove it before executing my config.
The plugins I use are [here](https://github.com/UnrealApex/dotfiles/blob/main/plugins/plug.vim#L12).

**Notes**
This config has several dependancies. I find it convenient to install some of these dependancies via a package manager:

- [Neovim](https://github.com/neovim/neovim)
- [Git](https://git-scm.com/)
- [GNU Compiler Collection](https://gcc.gnu.org/)
- [make](https://www.gnu.org/software/make/)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [bat](https://github.com/sharkdp/bat)
- [code-minimap](https://github.com/wfxr/code-minimap)
- [Delta](https://github.com/dandavison/delta)
- Access to [GitHub Copilot](https://github.com/features/copilot)
