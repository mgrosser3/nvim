return {
	{
		"voldikss/vim-floaterm",
		config = function()
			vim.g.floaterm_width = 0.95
			vim.g.floaterm_height = 0.6
			vim.g.floaterm_position = "bottom"
			vim.keymap.set("n", "<leader>tt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle Float Terminal" })
			vim.keymap.set("t", "<leader>tt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle Float Terminal" })
		end,
	},
}
