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
        defaults = {
          formatter = "path.filename_first",
        },
        files = {
          formatter = "path.filename_first",
        },
				winopts = {
					-- split = "belowright new", -- open in a top split
					on_create = function()
						-- called once upon creation of the fzf main window
						-- can be used to add custom fzf-lua mappings, e.g:
						vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
						vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
						vim.keymap.set("t", "<A-j>", "<Down>", { silent = true, buffer = true })
						vim.keymap.set("t", "<A-k>", "<Up>", { silent = true, buffer = true })
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
			vim.keymap.set(
				"n",
				"ð",
				"<cmd>:lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<CR>"
			)

			vim.keymap.set(
				"n",
				"ſ",
				"<cmd>:lua require('fzf-lua').lsp_live_workspace_symbols({ jump_to_single_result = true })<CR>"
			)

			vim.keymap.set("n", "<M-C-S-F>", ":lua require'fzf-lua'.live_grep({ cwd=\"~/Software\" })<CR>")
			vim.keymap.set("n", "<M-F>", "<cmd>FzfLua files cwd=~/<CR>")
			vim.keymap.set("n", "<M-f>", "<cmd>FzfLua files cwd=~/Software/<CR>")
			vim.keymap.set("n", "<M-C-F>", "<cmd>FzfLua blines<CR>")
			vim.keymap.set("n", "<C-4>", "<cmd>FzfLua live_grep_native<CR>")
			vim.keymap.set("n", "đ", "<cmd>FzfLua live_grep_native<CR>")
			vim.keymap.set("n", "<C-7>", "<cmd>FzfLua oldfiles<CR>")
			vim.keymap.set("n", "<C-8>", "<cmd>FzfLua buffers<CR>")
			vim.keymap.set("n", "<C-9>", "<cmd>FzfLua git_files<CR>")
			vim.keymap.set("n", "<C-ß>", "<cmd>FzfLua lsp_live_workspace_symbols<CR>")
			vim.keymap.set("n", "<M-o>", "<cmd>FzfLua jumplist<CR>")
		end,
	},
}
