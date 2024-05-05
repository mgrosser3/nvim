return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = true,
		opts = {
			indent = { char = "┊" },
			scope = {
				enabled = true,
				show_start = true,
				show_end = false,
				show_exact_scope = true,
				injected_languages = false,
				highlight = { "Function", "Label" },
				priority = 500,
			},
		},
	},
}
