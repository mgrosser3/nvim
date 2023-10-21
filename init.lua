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

})

