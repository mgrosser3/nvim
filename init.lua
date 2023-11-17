--
-- General Settings
--

vim.g.mapleader = " "

--
-- General Key Bindings
--

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

--
-- General Options
--

vim.wo.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Windows specific options
if vim.fn.has('win32') then

	vim.opt.shell = 'powershell.exe'
	
	-- Try to use PowerShell 7.x
	vim.cmd(":silent !pwsh.exe --version")
	if vim.v.shell_error == 0 then
		vim.opt.shell = 'pwsh.exe'
	end

	vim.o.shellxquote = ''
	vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
	vim.o.shellquote = ''
	vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
	vim.o.shellredir = '| Out-File -Encoding UTF8 %s'
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

require("lazy").setup({

	-- Color Scheme Rose Pine
	{
	 'rose-pine/neovim', name = 'rose-pine'
	},

	-- Statusline Plugin lualine.nvim
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons', opt = true}
	},

	-- Syntax Highlighting Plugin nvim-treesitter
	{
		'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
	},

	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Language Server Protocol (LSP) Setup
	-- VonHeikemen/lsp-zero.nvim
	{'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	-- Debug Adapter Protocol support
	{'mfussenegger/nvim-dap'},
	{'rcarriga/nvim-dap-ui'},

	-- Org Mode
	{
		'nvim-orgmode/orgmode',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		},
		event = 'VeryLazy'
	},

})

