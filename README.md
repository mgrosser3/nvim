# Neovim Configuration

Welcome to my personal Neovim configuration! 🎉 There are already fantastic configurations like [LunarVim](https://www.lunarvim.org/) or [LazyVim](https://www.lazyvim.org/) that make it easy to get started with Neovim. However, I wanted to build my own setup from scratch—to truly understand how Neovim works and to tailor it exactly to my needs. This way, I can decide for myself which features I need and which ones I don't. Plus, it's a great learning experience! 🚀

If you're looking for more inspiration, I highly recommend checking out [neovimcraft.com](https://neovimcraft.com/) by Eric Bower. It's full of useful plugins and ideas!

## Features
⚡ Fast startup using lazy-loaded plugins
🎨 Beautiful UI with a clean color scheme and status line
🔍 Powerful fuzzy finder with Telescope
🛠️ Built-in LSP & autocompletion with Mason & LSP Zero
📜 Syntax highlighting & code parsing with Treesitter
⌨️ Helpful keybindings with which-key.nvim

## Installation

### Neovim

If you haven’t installed Neovim yet, that’s your first step! Check out the official [installation guide](https://github.com/neovim/neovim/blob/master/INSTALL.md) for the latest instructions.

### Nerd Font 

For the best experience, I **strongly recommend** using a [Nerd Font variant of JetBrains Mono](https://www.nerdfonts.com/). This ensures that all icons in Neovim display correctly! 😃

### Node.js & npm

You'll need Node.js and npm for installing `vim-language-server`. To check if everything is set up correctly, simply run `:checkhealth mason` inside Neovim. ✅

### Clone the Repository

Neovim looks for configuration files in specific locations:

- **Linux**: `~/.config/nvim`
- **Windows**: `~/AppData/Local/nvim`

To get started, just clone this repository into the appropriate directory:

#### Clone on Linux

```shell
git clone https://github.com/mgrosser3/nvim.git ~/.config/nvim
```

#### Clone on Windows

```shell
git clone https://github.com/mgrosser3/nvim.git ~/AppData/Local/nvim
```

> **Tip:** You can also set the `XDG_CONFIG_HOME` environment variable to choose a custom config location (`$XDG_CONFIG_HOME/nvim`).
>
> Personally, I prefer storing my config in my home directory on Windows (`XDG_CONFIG_HOME = $env:USERPROFILE\.config`), because digging through the AppData folder is no fun. 😅

## Plugins

This setup includes some amazing plugins to enhance your Neovim experience! ✨

| Plugin                                                                | Description                                 |
| --------------------------------------------------------------------- | ------------------------------------------- |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                       | A fast and lightweight plugin manager       |
| [rose-pine](https://github.com/rose-pine/neovim)                      | A beautiful color scheme                    |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)          | A sleek and customizable status line        |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)    | A powerful fuzzy finder                     |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Enhanced syntax highlighting and parsing    |
| [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)         | A streamlined LSP setup                     |
| [which-key.nvim](https://github.com/folke/which-key.nvim)             | Helps you remember keybindings effortlessly |

## Setup on Windows

Windows users, don't worry—I've got you covered! 😊 Since some tools are required for full functionality, I recommend installing a package manager like [scoop](https://scoop.sh/). For example, Treesitter needs a C++ compiler, which you can install easily with:

```shell
scoop install gcc
```

### PowerShell 7.x

Neovim's Mason plugin works best with PowerShell 7.x (`pwsh.exe`). If you’re still using the older version, it’s time for an upgrade! 🚀

To check for the latest version:

```shell
winget search Microsoft.PowerShell
```

Example output:

```
Name               Id                           Version Source
--------------------------------------------------------------
PowerShell         Microsoft.PowerShell         7.3.8.0 winget
PowerShell Preview Microsoft.PowerShell.Preview 7.4.0.6 winget
```

To install PowerShell 7.x:

```shell
winget install --id Microsoft.PowerShell --source winget
```

## Setup on Linux

Linux users, you’re probably already pros at this! 🐧 Just a quick tip: instead of using `apt-get install`, which often provides outdated versions, grab the latest **tar-file** from the [official Neovim releases](https://github.com/neovim/neovim/releases) page.

---

This README is here to make your setup experience as smooth as possible! If you have any questions, suggestions, or just want to share your experience, feel free to open an issue on GitHub. Happy coding! 🎉
