--
-- General Settings
--

vim.g.mapleader = " "
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h13"

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

	-- Try to use PowerShell 7.x
	vim.cmd(":silent !pwsh.exe --version")
	if vim.v.shell_error == 0 then
		vim.opt.shell = 'pwsh.exe'
	else
		vim.opt.shell = 'powershell.exe'
		-- fix: **error** (netrw) unable to make directory<Lua>
		-- see: %COMSPEC% is set to cmd.exe
		vim.g.netrw_localmkdir = vim.opt.shell + " mkdir"
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

require("lazy").setup('plugins')
