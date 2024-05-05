return {

	--
	-- Language Server Protocol (LSP) Setup
	-- Collection of functions that will help you setup Neovim's LSP client,
	-- so you can get IDE-like features with minimum effort.
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	--

	{
		"VonHeikemen/lsp-zero.nvim",
		priority = 900,

		dependencies = {

			-- lspconfig
			-- https://github.com/neovim/nvim-lspconfig
			"neovim/nvim-lspconfig",

			-- mason-lspconfig
			-- https://github.com/williamboman/mason-lspconfig.nvim
			"williamboman/mason-lspconfig.nvim",

			-- cmp
			-- https://github.com/hrsh7th/nvim-cmp
			"hrsh7th/nvim-cmp",

			-- cmp-nvim-lsp
			-- https://github.com/hrsh7th/cmp-nvim-lsp
			"hrsh7th/cmp-nvim-lsp",

			-- LuaSnip
			-- https://github.com/L3MON4D3/LuaSnip
			"L3MON4D3/LuaSnip",
		},

		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end)

			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = { "vimls", "lua_ls" },
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})

			-- Setup cmp
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
		end,
	},
}
