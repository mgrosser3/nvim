--
-- Global Variables
-- :help global-variables
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--
-- Neovim Options
-- :help options
--

-- Tabstop
vim.opt.tabstop = 2      -- width of tab character
vim.opt.softtabstop = 2  -- amount of white space to be added
vim.opt.shiftwidth = 2   -- amount of white space to add in normal mode
vim.opt.expandtab = true -- use spaces instead of tabs

-- Line wrapping
vim.opt.wrap = true -- enable line wrapping
vim.opt.linebreak = true -- prevent line breaks in words
vim.opt.showbreak = "↪ " -- character to indicate wrapped lines
vim.opt.wrapmargin = 0 -- chars from the right border where wrapping starts

-- Indentation
vim.opt.smartindent = true -- autoindenting when starting a new line

-- Folding
vim.o.foldmethod = "syntax" -- use syntax fold method
vim.o.foldlevelstart = 99   -- open all folds by default

-- Search
vim.opt.incsearch = true  -- enable incremental search
vim.opt.ignorecase = true -- ignore case in search pattern
vim.opt.smartcase = true  -- case sensitive search
vim.opt.hlsearch = false  -- disable highlighting

-- Appearance
vim.opt.number = true         -- show real line number for current line
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.colorcolumn = "80"    -- highlighted line length
vim.opt.signcolumn = "yes"    -- draw the signcolumn (default = "auto")
vim.opt.cmdheight = 1         -- number of lines to use for the command-line
vim.opt.scrolloff = 10        -- number of lines to keep above and below the cursor
vim.opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
vim.opt.errorbells = false -- switch off noise in case of errors
vim.opt.swapfile = false   -- disable swapfiles for buffers
vim.opt.backup = false     -- disable backup file
vim.opt.undofile = true    -- enable undo files
vim.opt.undodir = vim.fn.expand("~/.nvim/undo")
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.autochdir = false -- don't change the working directory automatically
vim.opt.iskeyword:append("-")
vim.opt.mouse:append("a") -- enable mouse support for all modes
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true -- buffers per default modifiable
vim.opt.encoding = "UTF-8"

--
-- Key Bindings
--

-- Open file browser netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "netrw" })

-- Move highlighted parts
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move down

-- Add new line in normal mode
vim.keymap.set("n", "<S-CR>", "o<ESC>")

-- Exit from insert mode by Esc in Terminal
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])

-- Remaps
vim.keymap.set("i", "<C-c>", "<ESC>") -- CTRL-C -> ESC

-- Diagnostics
vim.diagnostic.config({ virtual_text = true })
--vim.diagnostic.config({
--  virtual_text = { current_line = true }
--})

--
--
-- Windows specific configuration
-- ./lua/windows.lua
--

if vim.loop.os_uname().sysname == "Windows_NT" then
  pcall(require, "windows")
elseif vim.loop.os_uname().sysname == "Linux" then
  pcall(require, "linux")
end

--
-- GUI specific configuration
-- ./lua/gui.lua
--
if vim.fn.has("gui_running") then
  pcall(require, "gui")
end

--
-- Package Manager lazy.vim
-- https://github.com/folke/lazy.nvim
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "plugins" } })
