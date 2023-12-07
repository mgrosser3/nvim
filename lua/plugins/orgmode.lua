return {

	{
		'nvim-orgmode/orgmode',
		
		event = 'VeryLazy',

		config = function()
			-- Load treesitter grammer for org
			require('orgmode').setup_ts_grammar()

			-- Define default org agenda file path
			org_default_path = os.getenv("ORG_AGENDA_FILES")
			if org_default_path == nil then
				org_default_path = '~/.org'
			end

			-- Setup orgmode
			require('orgmode').setup({
				org_agenda_files = org_default_path .. '/**/*',
				org_default_notes_file = org_default_path .. '/refile.org'
			})
		end
	}

}
