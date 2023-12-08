return {

	{
		'mfussenegger/nvim-dap-python',

		config = function()
			-- HACK: Hard coded python interpreter!
			-- INFO: .setup(os.getenv("VIRTUAL_ENV") .. "/bin/python")
			require('dap-python').setup('~/Entwicklung/.venv/Scripts/python.exe')
		end

	}

}
