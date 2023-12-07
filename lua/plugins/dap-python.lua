return {

	{
		'mfussenegger/nvim-dap-python',

		config = function()
			-- HACK: Hard coded python interpreter!
			require('dap-python').setup('~/Entwicklung/.venv/Scripts/python.exe')
		end

	}

}
