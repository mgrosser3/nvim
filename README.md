# Neovim Configuration

<a href="/LICENSE">![License](https://img.shields.io/github/license/mgrosser3/nvim)</a>

Welcome to my personal Neovim configuration. There are already great configurations like
[LunarVim](https://www.lunarvim.org/) or [LazyVim](https://www.lazyvim.org/) that allow
a quick start into Neovim for developers. I decided to create my own configuration from
scratch because I liked to learn more about ways to customize Neovim. Also, I felt the
need to decide for myself which feature I need and which one I don't. So I see this as a
way to question my own needs for an IDE.

I will also recommend [neovimcraft.com](https://neovimcraft.com/) by Eric Bower, where
you can find a lot of interesting things and inspirations.

## Quick Start

### Install Neovim

If you have not yet installed Neovim, this is the first step. You can find more information
about this at https://github.com/neovim/neovim/blob/master/INSTALL.md.

### Clone the Repository

You have to clone the repository to a specific location, because Neovim expects the
configuration in the following directories:

- Linux: `~/.config/nvim`
- Windows: `~/AppData/Local/nvim`

To use the configuration, the repository only needs to be cloned into the configuration folder.

#### Clone on Linux

```shell
git clone https://github.com/mgrosser3/nvim.git ~/.config/nvim
```

#### Clone on Windows

```shell
git clone https://github.com/mgrosser3/nvim.git ~/AppData/Local/nvim
```

> [!TIP]
> You can also set the environment variable `XDG_CONFIG_HOME` to specify the storage location
> for your configuration (`$XDG_CONFIG_HOME/nvim`).
>
> I personally prefer a config folder in my home directory on Windows
> (`XDG_CONFIG_HOME = $env:USERPROFILE\.config`). Because I don't like looking for things in
> Windows' AppData folder. I would like to have a similar experience as on Linux.

## Requires

### Font JetBrains Mono

https://www.jetbrains.com/de-de/lp/mono/

#### Nerd Font Variant

https://www.nerdfonts.com/

### Node Package Manager

You need it to install vim-language-server, see therefore :healthcheck mason.

## Setup on Windows

Since a few additional tools are needed from time to time, it makes
sense to install a package manager like [scoop](https://scoop.sh/).
For example Treesitter requires a C++ compiler, which we can easily
install using `scoop install gcc`.
