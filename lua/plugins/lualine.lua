--
-- Lazy plugin: lualine.nvim
-- https://github.com/nvim-lualine/lualine.nvim
--

return {

	{
		"nvim-lualine/lualine.nvim",

		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },

		config = function()
			require("lualine").setup({
				options = {

					icons_enabled = false,

					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },

					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},

					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				}, -- options

				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				}, -- sections

				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				}, -- interactive_sections

				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
