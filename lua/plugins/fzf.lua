return {
	{
		"ibhagwan/fzf-lua",
		-- commit = "3da9ad3",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
		},
		config = function()
			require("fzf-lua").setup({
				"telescope",
				winopts = {
					-- split = "belowright new", -- open in a top split
					on_create = function()
						-- called once upon creation of the fzf main window
						-- can be used to add custom fzf-lua mappings, e.g:
						vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
						vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
					end,
				},
			})
			vim.keymap.set("n", "gt", "<cmd>:lua require('fzf-lua').lsp_typedefs({ jump_to_single_result = true })<CR>")
			vim.keymap.set(
				"n",
				"gr",
				"<cmd>:lua require('fzf-lua').lsp_references({ jump_to_single_result = true })<CR>"
			)
			vim.keymap.set(
				"n",
				"gd",
				"<cmd>:lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<CR>"
			)
		end,
	},
}
