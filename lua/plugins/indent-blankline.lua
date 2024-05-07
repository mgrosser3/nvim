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
				show_end = true,
				show_exact_scope = true,
				injected_languages = false,
				highlight = { "Function", "Label" },
				priority = 500,
				include = {
					node_type = {
						tsx = {
							"jsx_element",
							"jsx_self_closing_element",
							"jsx_fragment",
							"jsx_opening_element",
							"jsx_closing_element",
							"jsx_attribute",
						},
					},
				},
			},
		},
	},
}
