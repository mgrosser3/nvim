return {
	-- {
	--   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	--   config = function()
	--     require("lsp_lines").setup()
	--   end,
	-- },
	-- {
	--   "m4xshen/hardtime.nvim",
	--   opts = {
	--     disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "NeogitStatus" },
	--     disabled_keys = {
	--       ["<RIGHT>"] = {},
	--       ["<LEFT>"] = {},
	--     },
	--   },
	-- },
	-- {
	--   "ggandor/leap.nvim",
	--   config = function()
	--     require("leap").set_default_keymaps()
	--   end,
	-- },
	-- {
	--   "ggandor/leap-ast.nvim",
	--   dependencies = {
	--     "ggandor/leap.nvim",
	--   },
	--   config = function()
	--     vim.keymap.set({ 'n', 'x', 'o' }, 'ö', function() require 'leap-ast'.leap() end, {})
	--   end
	-- },
	{ "rebelot/kanagawa.nvim" },
	-- {
	--   -- "mfussenegger/nvim-treehopper"
	--   "davidatsurge/nvim-treehopper",

	--   config = function()
	--     require("tsht").config.hint_keys = {
	--       "h", "j", "f", "d", "k", "n", "v", "s", "l", "a", "ö",
	--       "H", "J", "F", "D", "K", "N", "V", "S", "L", "A", "Ö"
	--     }

	--     require("tsht").config.ft_to_parser.typescriptreact = "tsx"

	--     vim.cmd "omap <silent> <Space> :<C-U>lua require('tsht').nodes()<CR>"
	--     vim.cmd "vnoremap <silent> <Space> :lua require('tsht').nodes()<CR>"
	--   end
	-- },
	-- {
	--   "ggandor/flit.nvim",
	--   config = function()
	--     require('flit').setup({
	--       labeled_modes = "vo",
	--     })
	--   end
	-- },
	{ "catppuccin/nvim" },
	-- {
	--   "kevinhwang91/nvim-hlslens",
	--   config = function()
	--     require('hlslens').setup({
	--       calm_down = true,
	--       nearest_only = true,
	--       nearest_float_when = 'always'
	--     })
	--   end
	-- },
	-- {
	--   "petertriho/nvim-scrollbar",
	--   config = function()
	--     require("scrollbar").setup({
	--       -- handle = {
	--       --   color = colors.sumiInk2,
	--       -- },
	--     })
	--   end
	-- },
	{
		"s1n7ax/nvim-window-picker",
		version = "v1.*",
		config = function()
			require("window-picker").setup()

			vim.keymap.set("n", "<C-w><C-j>", function()
				local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
				vim.api.nvim_set_current_win(picked_window_id)
			end, { desc = "Pick a window" })
		end,
	},
	-- {
	--   "nvim-treesitter/nvim-treesitter-textobjects",
	--   dependencies = {
	--     "nvim-treesitter/nvim-treesitter",
	--   },
	--   config = function()
	--     require("nvim-treesitter.configs").setup({
	--       textobjects = {
	--         move = {
	--           enable = true,
	--           set_jumps = true, -- whether to set jumps in the jumplist
	--           goto_next_start = {
	--             ["(f"] = "@function.outer",
	--           },
	--           goto_next_end = {
	--             ["gE"] = "@function.outer",
	--           },
	--           goto_previous_start = {
	--             ["gA"] = "@function.outer",
	--           },
	--           -- goto_previous_end = {
	--           --   -- ["]"] = "@function.outer",
	--           -- },
	--         },
	--         select = {
	--           enable = true,
	--           -- Automatically jump forward to textobj, similar to targets.vim
	--           lookahead = true,
	--           keymaps = {
	--             -- You can use the capture groups defined in textobjects.scm
	--             ["af"] = "@function.outer",
	--             ["if"] = "@function.inner",
	--             ["ac"] = "@class.outer",
	--             -- You can optionally set descriptions to the mappings (used in the desc parameter of
	--             -- nvim_buf_set_keymap) which plugins like which-key display
	--             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
	--           },
	--           -- You can choose the select mode (default is charwise 'v')
	--           --
	--           -- Can also be a function which gets passed a table with the keys
	--           -- * query_string: eg '@function.inner'
	--           -- * method: eg 'v' or 'o'
	--           -- and should return the mode ('v', 'V', or '<c-v>') or a table
	--           -- mapping query_strings to modes.
	--           selection_modes = {
	--             ["@parameter.outer"] = "v", -- charwise
	--             ["@function.outer"] = "V",  -- linewise
	--             ["@class.outer"] = "<c-v>", -- blockwise
	--           },
	--           -- If you set this to `true` (default is `false`) then any textobject is
	--           -- extended to include preceding or succeeding whitespace. Succeeding
	--           -- whitespace has priority in order to act similarly to eg the built-in
	--           -- `ap`.
	--           --
	--           -- Can also be a function which gets passed a table with the keys
	--           -- * query_string: eg '@function.inner'
	--           -- * selection_mode: eg 'v'
	--           -- and should return true of false
	--           include_surrounding_whitespace = true,
	--         },
	--       },
	--     })
	--   end,
	-- },
	-- {
	--   "github/copilot.vim",
	--   config = function()
	--     vim.cmd([[imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")]])
	--     vim.cmd([[let g:copilot_no_tab_map = v:true ]])
	--   end,
	-- },
	{
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
			vim.keymap.set("n", "<leader>tp", ":TSPlaygroundToggle<CR>")
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		config = function()
			-- vim.api.nvim_create_user_command(
			--   "DiffCommitLine",
			--   "lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
			--   { range = true }
			-- )

			-- vim.api.nvim_set_keymap("v", "<leader>dcl", ":DiffCommitLine<CR>", { noremap = true })

			-- require("telescope").load_extension("advanced_git_search")
			require("advanced_git_search.fzf").setup({
				diff_plugin = "diffview",
			})
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
		},
	},
	{
		"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker").setup()
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"Bryley/neoai.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		cmd = {
			"NeoAI",
			"NeoAIOpen",
			"NeoAIClose",
			"NeoAIToggle",
			"NeoAIContext",
			"NeoAIContextOpen",
			"NeoAIContextClose",
			"NeoAIInject",
			"NeoAIInjectCode",
			"NeoAIInjectContext",
			"NeoAIInjectContextCode",
		},
		keys = {
			{ "<leader>as", desc = "summarize text" },
			{ "<leader>ag", desc = "generate git message" },
		},
		config = function()
			require("neoai").setup({
				-- Options go here
			})
		end,
	},
	{
		"cseickel/diagnostic-window.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"David-Kunz/jester",
		config = function()
			require("jester").setup({
				cmd = "npx jest -t '$result' -- $file",
			})
		end,
	},
	-- {
	--   "nvim-neotest/neotest",
	--   dependencies = {
	--     "nvim-lua/plenary.nvim",
	--     "nvim-treesitter/nvim-treesitter",
	--     "antoinemadec/FixCursorHold.nvim",
	--     "haydenmeade/neotest-jest",
	--     "mfussenegger/nvim-dap",
	--   },
	--   config = function()
	--     require("neotest").setup({
	--       adapters = {
	--         require("neotest-jest")({
	--           jestCommand = "npx jest --",
	--           -- jestConfigFile = "custom.jest.config.ts",
	--           env = { CI = true },
	--           cwd = function(path)
	--             return vim.fn.getcwd()
	--           end,
	--         }),
	--       },
	--     })
	--   end,
	-- },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup()

			vim.api.nvim_set_keymap(
				"v",
				"<leader>rr",
				":lua require('refactoring').select_refactor()<CR>",
				{ noremap = true, silent = true, expr = false }
			)

			-- You can also use below = true here to to change the position of the printf
			-- statement (or set two remaps for either one). This remap must be made in normal mode.
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rp",
				":lua require('refactoring').debug.printf({below = false})<CR>",
				{ noremap = true }
			)

			-- Print var

			-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rv",
				":lua require('refactoring').debug.print_var({ normal = true })<CR>",
				{ noremap = true }
			)
			-- Remap in visual mode will print whatever is in the visual selection
			vim.api.nvim_set_keymap(
				"v",
				"<leader>rv",
				":lua require('refactoring').debug.print_var({})<CR>",
				{ noremap = true }
			)

			-- Cleanup function: this remap should be made in normal mode
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rc",
				":lua require('refactoring').debug.cleanup({})<CR>",
				{ noremap = true }
			)
		end,
	},
	{
		"nvim-orgmode/orgmode",
		config = function()
			-- vim.opt.conceallevel = 2
			vim.opt.concealcursor = "nc"

			require("orgmode").setup_ts_grammar()

			-- Treesitter configuration
			require("nvim-treesitter.configs").setup({
				-- If TS highlights are not enabled at all, or disabled via `disable` prop,
				-- highlighting will fallback to default Vim syntax highlighting
				highlight = {
					enable = true,
					-- Required for spellcheck, some LaTex highlights and
					-- code block highlights that do not have ts grammar
					additional_vim_regex_highlighting = { "org" },
				},
				ensure_installed = { "org" }, -- Or run :TSUpdate org
			})

			require("orgmode").setup({})
		end,
	},
	{
		"mcchrish/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = { { "rktjmp/lush.nvim" } },
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup()
		end,
	},
	{ "savq/melange-nvim" },
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{ "Everblush/nvim", name = "everblush" },
	{
		"gsuuon/tshjkl.nvim",
		opts = {
			-- false to highlight only. Note that enabling this will hide the highlighting of child nodes
			select_current_node = true,
			keymaps = {
				toggle = "<leader>h",
			},
			marks = {
				parent = {
					virt_text = { { "h", "ModeMsg" } },
					virt_text_pos = "overlay",
				},
				child = {
					virt_text = { { "l", "ModeMsg" } },
					virt_text_pos = "overlay",
				},
				prev = {
					virt_text = { { "k", "ModeMsg" } },
					virt_text_pos = "overlay",
				},
				next = {
					virt_text = { { "j", "ModeMsg" } },
					virt_text_pos = "overlay",
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		branch = "dev", -- IMPORTANT!
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		opts = {}, -- for default options, refer to the configuration section for custom setup.
	},
}
