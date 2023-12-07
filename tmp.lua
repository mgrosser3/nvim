require("lazy").setup({

	-- [X] Color Scheme Rose Pine
	{
	 'rose-pine/neovim', name = 'rose-pine'
	},

	-- [X] Statusline Plugin lualine.nvim
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons', opt = true}
	},

	-- [X] Syntax Highlighting Plugin nvim-treesitter
	{
		'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
	},


	-- [X] Telescope - fuzzy finder
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Language Server Protocol (LSP) Setup
	-- VonHeikemen/lsp-zero.nvim
	
	{'williamboman/mason.nvim'}, -- [X]
  {'williamboman/mason-lspconfig.nvim'}, -- [X]
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'}, -- [X]
	{'hrsh7th/cmp-nvim-lsp'}, -- [X]
	{'hrsh7th/nvim-cmp'}, -- [X]
	{'L3MON4D3/LuaSnip'},

	-- 
	-- Debug Adapter Protocol support
	--
	--
	{'mfussenegger/nvim-dap'},
	{'rcarriga/nvim-dap-ui'},
	{'https://github.com/mfussenegger/nvim-dap-python'},
	{'theHamsta/nvim-dap-virtual-text'},

	-- Org Mode
	{
		'nvim-orgmode/orgmode',
		dependencies = {
			{ 'nvim-treesitter/nvim-treesitter', lazy = true },
		},
		event = 'VeryLazy'
	},

	-- [X] ToDo Comments
	{
		'folke/todo-comments.nvim',
		dependencies = {'nvim-lua/plenary.nvim', 'folke/trouble.nvim'},
	},
})

