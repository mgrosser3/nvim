local M = {}

-- Ensures that a list of Mason packages are installed.
-- @param tools table<string> list of tool names
function M.ensure_installed(tools)
	local ok, registry = pcall(require, "mason-registry")

	if not ok then
		vim.notify("Mason is not installed or could not be found!", vim.log.levels.ERROR)
		return
	end

	for _, tool in ipairs(tools) do
		local ok, pkg = pcall(registry.get_package, tool)
		if ok then
			if not pkg:is_installed() then
				vim.notify("Installing " .. tool .. " via Mason...", vim.log.levels.INFO)

				pkg:install()

				pkg:on("install:success", function()
					vim.schedule(function()
						vim.notify(tool .. " installed successfully.", vim.log.levels.INFO)
					end)
				end)

				pkg:on("install:failed", function()
					vim.schedule(function()
						vim.notify("Failed to isntall " .. tool .. "!", vim.log.WARN)
					end)
				end)
			end
		else
			vim.notify("Tool '" .. tool .. "' not found in Mason registry!", vim.log.levels.WARN)
		end
	end
end

return M
