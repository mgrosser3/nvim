return {
	{
		"jellydn/typecheck.nvim",
		dependencies = { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
		ft = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
		opts = {
			debug = true,
			mode = "trouble", -- "quickfix" | "trouble"
		},
		keys = {
			{
				"<leader>ck",
				"<cmd>Typecheck<cr>",
				desc = "Run Type Check",
			},
		},
	},
}
