return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			modifiers = {
				dirname = ":~",
			},
			show_dirname = true,
			show_basename = true,
			show_modified = true,
		},
	},
}
