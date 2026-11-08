-- Colorscheme
vim.cmd.colorscheme("habamax")

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

-- Line wrapping
--
-- By default, line wrapping is disabled to keep
-- relative line numbers clear and avoids confusion.
vim.opt.wrap = false -- disable line wrapping
vim.opt.linebreak = true -- prevent line breaks in words
vim.opt.showbreak = "↪ " -- character to indicate wrapped lines
vim.opt.wrapmargin = 0 -- chars from the right border where wrapping starts

-- Indentation
vim.opt.smartindent = true -- autoindenting when starting a new line
vim.opt.tabstop = 2 -- width of tab character
vim.opt.softtabstop = 2 -- amount of white space to be added
vim.opt.shiftwidth = 2 -- amount of white space to add in normal mode
vim.opt.expandtab = true -- use spaces instead of tabs

-- Folding
vim.o.foldmethod = "syntax" -- use syntax fold method
vim.o.foldlevelstart = 99 -- open all folds by default

-- Search
vim.opt.incsearch = true -- enable incremental search
vim.opt.ignorecase = true -- ignore case in search pattern
vim.opt.smartcase = true -- case sensitive search
vim.opt.hlsearch = false -- disable highlighting

-- Appearance
vim.opt.number = true -- show real line number for current line
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.colorcolumn = "80" -- highlighted line length
vim.opt.signcolumn = "yes:2" -- draw the signcolumn (default = "auto")
vim.opt.cmdheight = 1 -- number of lines to use for the command-line
vim.opt.scrolloff = 3 -- number of lines to keep above and below the cursor
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cursorline = true

-- Behaviour
vim.opt.autochdir = false -- don't change the working directory automatically
vim.opt.errorbells = false -- switch off noise in case of errors
vim.opt.swapfile = false -- disable swapfiles for buffers
vim.opt.backup = false -- disable backup file
vim.opt.undofile = true -- enable undo files
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse:append("a") -- enable mouse support for all modes
vim.opt.iskeyword:append("-")

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

-- Make <C-c> behave exactly like <Esc> in insert mode
-- (also triggers InsertLeave autocommands)
vim.keymap.set("i", "<C-c>", "<ESC>")

-- Diagnostics
-- Disabled by default in Neovim 0.11.
vim.diagnostic.config({ virtual_text = true })

-- Toggle line wrapping 
vim.keymap.set("n", "<leader>w", function()
	vim.opt.wrap = not vim.opt.wrap:get()
	if vim.opt.wrap:get() then
		print("vim.opt.wrap enabled")
	else
		print("vim.opt.wrap disabled")
	end
end, { desc = "Toggle line wrap" })

-- Function loads additional modules
local function load_module(module)
  local path = package.searchpath(module, package.path)

  -- nothing to load
  if not path then
    return false
  end

  -- load module
  local ok, err = pcall(require, module)

  if not ok then
    vim.notify("Failed to laod module '"..module.."':\n"..err,
      vim.log.levels.ERROR)
    return false
  end

  return true
end

--
-- Additional custom options 
-- ./lua/options.lua
--
load_module("options")

--
-- Additional custom keymaps
-- ./lua/keymaps.lua
--
load_module("keymaps")

--
-- Custom auto-commands
-- ./lua/autocmd.lua
--
load_module("autocmd")

--
-- GUI specific configuration
-- ./lua/gui.lua
--
load_module("gui")

--
-- OS specific configuration
-- ./lua/windows.lua
--
if vim.uv.os_uname().sysname == "Windows_NT" then
	load_module("windows")
elseif vim.uv.os_uname().release:find("WSL") then
	load_module("wsl")
elseif vim.uv.os_uname().sysname == "Linux" then
	load_module("linux")
end

--
-- Plugin Package-Manager
-- ./lua/plugins
--
-- Configure your custom plugin management using either
-- Neovim's built-in package manager or Lazy.nvim.
-- 
load_module("plugins")

-- Must be set after OS-specific config to
-- use the correct clipboard provider!
vim.opt.clipboard:append("unnamedplus")
