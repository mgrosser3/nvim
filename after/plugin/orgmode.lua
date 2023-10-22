-- Load treesitter grammer for org
require('orgmode').setup_ts_grammar()

-- Setup orgmode
require('orgmode').setup({
	org_agenda_files = '~/.org/**/*',
	org_default_notes_files = '~/.org/refile.org'
})
