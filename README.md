# .dotfiles
### About
This is my `init.vim`. Like all other configuration files, these contain the configurations that make Neovim feel at home for me.
That being said, my preferences are not be the same as yours, so if you wish to use my config, feel free to delete or comment out parts of my config that you do not wish to use and keep the parts you like.
### Plugins
I have several plugins to enhance my experience using Neovim. As a side note, this config and its plugins are not all compatible with Vim, if you're using Vim, see my [`.vimrc`](/.vimrc)
My plugins are managed using [vim-plug](https://github.com/junegunn/vim-plug).
If you use my config and [vim-plug](https://github.com/junegunn/vim-plug) is not present on your system, it will automatically install it so be aware of that.
The plugins I use are [here](https://github.com/UnrealApex/dotfiles/blob/main/plugins/plug.vim#L12).

**Notes**
My config has several dependancies and when installing each, there are some special instructions that should be followed. I find it easier to install some of these dependancies via a package manager such as [Scoop](https://scoop.sh/), [Chocolatey](https://chocolatey.org/), etc... The list of dependancies is below:

- Fugitive requires [Git](https://git-scm.com/) to be installed
- Tagbar requires [Universal Ctags](https://github.com/universal-ctags/ctags), and it should be installed under `$HOME/ctags/`.
- Vim Devicons requires a [patched Nerd Font](https://github.com/ryanoasis/nerd-fonts#patched-fonts)(if you're just using the Nerd Font for icons, which font you choose does not matter) to be installed.
- FZF requires [bat](https://github.com/sharkdp/bat) for file preview, [Ripgrep(rg)](https://github.com/BurntSushi/ripgrep) for search, and [Delta](https://github.com/dandavison/delta) for formatted Git output.
- Finally, if you are not in the [GitHub Copilot beta](https://github.com/features/copilot/signup), [GitHub Copilot](https://github.com/features/copilot) will not work.
