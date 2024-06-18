return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<M-5>", "<cmd>DiffviewFileHistory %<CR>" },
			{ "<C-5>", "<Esc><cmd>'<,'>DiffviewFileHistory<CR>", mode = "v" },
		},
		config = function()
			local actions = require("diffview.actions")
			require("diffview").setup({
				enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
				view = {
					-- Configure the layout and behavior of different types of views.
					-- Available layouts:
					--  'diff1_plain'
					--    |'diff2_horizontal'
					--    |'diff2_vertical'
					--    |'diff3_horizontal'
					--    |'diff3_vertical'
					--    |'diff3_mixed'
					--    |'diff4_mixed'
					-- For more info, see |diffview-config-view.x.layout|.
					default = {
						-- Config for changed files, and staged files in diff views.
						layout = "diff2_horizontal",
					},
					merge_tool = {
						-- Config for conflicted files in diff views during a merge or rebase.
						layout = "diff3_mixed",
						disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
					},
					file_history = {
						-- Config for changed files in file history views.
						layout = "diff2_horizontal",
					},
				},
				file_panel = {
					listing_style = "list", -- One of 'list' or 'tree'
				},
				keymaps = {
					disable_defaults = false, -- Disable the default keymaps
					view = {
						-- The `view` bindings are active in the diff buffers, only when the current
						-- tabpage is a Diffview.
						{ "n", "<C-j>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
						{ "n", "<C-k>", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
						{ "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Quit" } },
					},
					file_panel = {
						{ "n", "<A-j>", actions.next_conflict, { desc = "Open next conflict" } },
						{ "n", "<A-k>", actions.prev_conflict, { desc = "Open previous conflict" } },
						{ "n", "<C-j>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
						{
							"n",
							"<C-k>",
							actions.select_prev_entry,
							{ desc = "Open the diff for the previous file" },
						},
						{ "n", "gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
						{ "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Quit" } },
						{ "n", "s", actions.toggle_stage_entry, { desc = "Stage entry" } },
						{ "n", "u", actions.toggle_stage_entry, { desc = "Unstage entry" } },
						{ "n", "cc", ":Git commit -m ", { desc = "Commit" } },
						{ "n", "ca", ":Git commit --amend -m ", { desc = "Commit Amend" } },
					},
					file_history_panel = {
						{ "n", "<C-j>", actions.select_next_entry, { desc = "Open the diff for the next file" } },
						{ "n", "<C-k>", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
						{ "n", "<A-j>", actions.next_conflict, { desc = "Open next conflict" } },
						{ "n", "<A-k>", actions.prev_conflict, { desc = "Open previous conflict" } },
						{ "n", "gf", actions.goto_file_tab, { desc = "Open the file in a new tabpage" } },
						{ "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Quit" } },
					},
				},
			})
		end,
	},
}
