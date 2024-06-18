return {
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
