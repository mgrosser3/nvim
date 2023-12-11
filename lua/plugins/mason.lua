return {

	--
	-- mason
	-- https://github.com/williamboman/mason.nvim
	--
	{
		'williamboman/mason.nvim', name='mason',

		priority = 100, -- make sure to load this before dependent plugins

		config = function()
			require('mason').setup({
				ui = {
					icons = {
						package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
					}
				}
			})
		end
	}

}
