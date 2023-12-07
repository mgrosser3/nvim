return {

	--
	-- Collection of functions that will help you setup Neovim's LSP client,
	-- so you can get IDE-like features with minimum effort.
	-- https://github.com/VonHeikemen/lsp-zero.nvim
	--

	{
		'VonHeikemen/lsp-zero.nvim',

		dependencies = {

			-- lspconfig
			-- https://github.com/neovim/nvim-lspconfig
			'neovim/nvim-lspconfig',

			-- mason-lspconfig
			-- https://github.com/williamboman/mason-lspconfig.nvim
			'williamboman/mason-lspconfig.nvim',

			-- cmp
			-- https://github.com/hrsh7th/nvim-cmp
			'hrsh7th/nvim-cmp',

			-- cmp-nvim-lsp
			-- https://github.com/hrsh7th/cmp-nvim-lsp
			'hrsh7th/cmp-nvim-lsp',
		},

		config = function()
			local lsp_zero = require('lsp-zero')
		
			-- Setup mason-lspconfig
			require('mason-lspconfig').setup({			
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			}) 

			-- Setup cmp
			local cmp = require('cmp')
			local cmp_select = {behavior = cmp.SelectBehavior.Select}
			cmp.setup({
				sources = {
					{name = 'path'},
					{name = 'nvim_lsp'},
					{name = 'nvim_lua'},
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
			    ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
			    ['<C-Space>'] = cmp.mapping.complete(),
				})
			})
			
		end
	},

}
