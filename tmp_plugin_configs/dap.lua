local dap = require('dap')
local dapui = require("dapui")

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
--
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
