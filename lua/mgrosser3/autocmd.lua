-- https://neovim.io/doc/user/lua-guide.html#_autocommands
--
-- :help autocmd-events
-- :help events

local group = vim.api.nvim_create_augroup("mgrosser3", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight the text you want to yank.",
	group = group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 350, visual = true })
	end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	desc = "Show cursor line on active window.",
	group = group,
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	desc = "Disable cursor line on inactive window.",
	group = group,
	callback = function()
		vim.opt_local.cursorline = false
	end,
})
