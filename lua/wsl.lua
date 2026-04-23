if vim.fn.executable("clip.exe") == 0 or vim.fn.executable("powershell.exe") == 0 then
	vim.notify("WslClipboard: clip.exe or powershell.exe not found", vim.log.levels.WARN)
	return
end

vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw))",
		["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw))",
	},
	cache_enabled = 0,
}
