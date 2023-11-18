local dap = require('dap')


require('dap-python').setup('~/Entwicklung/.venv/Scripts/python.exe')

-- dap.configurations.python = {
 
	-- Python Configuration
-- 	{
--    type = 'python';
--    request = 'launch';
--    name = "Launch file";
--    program = "${file}";
--    -- TODO Windows only
-- 		-- TODO Strong coupled to custom virtual environment.
-- 		pythonPath = function()
-- 		  return '~/Enticklung/.venv/Scripts/python.exe'
--     end;
-- 	},
--
-- }
