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

	-----------------------------------------------------
	-- Language Server Protocol (LSP) Setup
	-- see VonHeikemen/lsp-zero.nvim
	-----------------------------------------------------
	
	-- Mason Package Manager
	{'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	-----------------------------------------------------

	-- Org Mode
	{
		'nvim-orgmode/orgmode',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		},
		event = 'VeryLazy'
	},

})


--
-- Experimental Custom CMake Support
-- Tested on Windows only!
-- 
-- Build directory is hard coded to './bulid'.
-- Only debug build is supported.
--

-- CMake performs a debug build.
function cmake_build()
	vim.cmd(":!cmake --build build/ --config Debug")
end

-- CMake creates a NMake Makefile project and use the
-- build direcotry './build'.
function cmake_config()
	vim.cmd(":!cmake -G \"NMake Makefiles\" -B build")
end

vim.keymap.set('n', '<leader>cb', cmake_build)
vim.keymap.set('n', '<leader>cc', cmake_config)

vim.api.nvim_create_user_command('CMakeConfig', cmake_config, {})
vim.api.nvim_create_user_command('CMakeBuild', cmake_build, {})
