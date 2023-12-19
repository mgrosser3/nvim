--
-- My most basic configuration
--

-- The Leader Key!
vim.g.mapleader = " "

-- Add keymap to open netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Activate relative numbers
vim.wo.relativenumber = true

-- Tabstop settings
vim.opt.tabstop = 2      -- width of tab character
vim.opt.softtabstop = 2  -- amount of white space to be added
vim.opt.shiftwidth = 2   -- amount of white space to add in normal mode
vim.opt.expandtab = true -- use spaces instead of tabs

-- Remap ctrl-c to ESC
vim.keymap.set("i", "<C-c>", "<ESC>")

-- Move highlighted parts
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--
-- Windows specific configuration
--

if vim.fn.has('win32') then
  require('windows')
end

--
-- GUI specific configuration
--

require('gui')

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
  { import = "plugins" },
})
