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
