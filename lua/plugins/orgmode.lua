return {

	{
		'nvim-orgmode/orgmode',
		event = 'VeryLazy',

		dependencies = {
			'nvim-treesitter/nvim-treesitter', lazy = true
		},

		config = function()
			-- Load treesitter grammer for org
			require('orgmode').setup_ts_grammar()

			-- Define default org agenda file path
			local org_default_path = os.getenv("ORG_AGENDA_FILES")
			if org_default_path == nil then
				org_default_path = '~/.org'
			end

			-- Setup orgmode
			require('orgmode').setup({
				org_agenda_files = org_default_path .. '/**/*',
				org_default_notes_file = org_default_path .. '/refile.org'
			})

			-- Setup Tree-Sitter
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { 'org' },
				},
				ensure_installed = { 'org' },
			})
		end
	}

}
