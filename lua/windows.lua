-- All Windows-specific configurations can be found in this file.
--
--		It is recommended to use the lua script only
--		if it is a Windows system.
--
--			if vim.fn.has('win32') then
--				require("windows")
--			end

-- We want to use Powershell 7.x (pwsh.exe)
-- if it is available!
vim.cmd(":silent !pwsh.exe --version")
if vim.v.shell_error == 0 then
	vim.opt.shell = 'pwsh.exe'

-- Our fallback on windows is the default
-- powershell (powershell.exe).
else
	vim.opt.shell = 'powershell.exe'
	-- fix: **error** (netrw) unable to make directory<Lua>
	-- see: %COMSPEC% is set to cmd.exe
	vim.g.netrw_localmkdir = vim.opt.shell + " mkdir"
end

vim.o.shellxquote = ''
vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.o.shellquote = ''
vim.o.shellpipe = '| Out-File -Encoding UTF8 %s'
vim.o.shellredir = '| Out-File -Encoding UTF8 %s'
