--
-- Rose Pine Colors
-- https://rosepinetheme.com/palette/ingredients/
--

local use_transparent_bg = false -- enable transparent background

--
-- Custom Rose Pine Theme for lualine.nvim
--

local colors = {
	base = "#191724",
	surface = "#1f1d2e",
	overlay = "#26233a",
	muted = "#6e6a86",
	subtle = "#908caa",
	text = "#e0def4",
	love = "#eb6f92",
	gold = "#f6c177",
	rose = "#ebbcba",
	pine = "#31748f",
	foam = "#9ccfd8",
	iris = "#c4a7e7",
	highlight_low = "#21202e",
	highlight_med = "#403d52",
	highlight_high = "#524f67",
	none = "NONE",
}

local rose_pine_theme = {
	normal = {
		a = {
			fg = (use_transparent_bg and colors.rose) or colors.base,
			bg = (use_transparent_bg and colors.none) or colors.rose,
		},
		b = {
			fg = colors.rose,
			bg = (use_transparent_bg and colors.none) or colors.highlight_low,
		},
		c = {
			fg = colors.text,
			bg = (use_transparent_bg and colors.none) or colors.highlight_low,
		},
		x = {
			fg = colors.text,
			bg = (use_transparent_bg and colors.none) or colors.highlight_low,
		},
		y = {
			fg = colors.rose,
			bg = (use_transparent_bg and colors.none) or colors.highlight_low,
		},
		z = {
			fg = (use_transparent_bg and colors.rose) or colors.base,
			bg = (use_transparent_bg and colors.none) or colors.rose,
		},
	},

	insert = { a = { fg = colors.base, bg = colors.love } },
	visual = { a = { fg = colors.base, bg = colors.gold } },
	replace = { a = { fg = colors.base, bg = colors.pine } },

	inactive = {},
}

-- Shows LSP label if a language server is attached to this buffer
local function lsp_attached()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	return next(clients) and "LSP" or ""
end

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
					theme = rose_pine_theme,
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
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
					lualine_c = { "filename", { lsp_attached } },
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
		end, -- config
	},
}
