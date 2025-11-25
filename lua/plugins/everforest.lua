return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		enabled = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})

			vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme kanagawa-paper]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		lazy = false,
		enabled = true,
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		"eddyekofo94/gruvbox-flat.nvim",
		priority = 1000,
		lazy = false,
		enabled = false,
		config = function()
			vim.cmd([[colorscheme gruvbox-flat]])
		end,
	},
}
