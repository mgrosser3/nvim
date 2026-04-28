-- lua module jdtls is provided by mfussenegger/nvim-jdtls (see lsp.lua)
local status, jdtls = pcall(require, "jdtls")

if not status then
	return
end

local is_windows = vim.fn.has("win32") == 1

local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
local java_test_path = mason_path .. "/java-test"
local java_debug_path = mason_path .. "/java-debug-adapter"

-- assumption: jdtls was installed via Mason
local jdtls_launcher = vim.fn.glob(mason_path .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true, true)

if type(jdtls_launcher) == "table" and #jdtls_launcher > 0 then
	jdtls_launcher = jdtls_launcher[1]
else
	vim.notify("JDTLS Launcher JAR could not be found!", vim.log.levels.ERROR)
	return
end

-- location to the config.ini of jdtls
local jdtls_config = mason_path .. "/jdtls/config_" .. (is_windows and "win" or "linux")

-- Debug Adapter JAR
local java_debug_bundle = vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")

-- Test Runner JARs
local java_test_bundles =
	vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", true), "\n", { trimempty = true })

-- Collect all necessary bundles into bundles (see init_options)
local bundles = {}
if java_debug_bundle ~= "" then
	vim.list_extend(bundles, { java_debug_bundle })
end
vim.list_extend(bundles, java_test_bundles)

-- JDTLS requires a dedicated workspace directory per project to store metadata,
-- caches, and project configurations. The workspace is placed centrally under
-- ~/.eclipse/jdtls-workspace/<project>, where <project> is derived from the
-- root directory name. If no root marker (.git, gradlew, etc.) is found,
-- the current file name is used as a fallback.
local home = is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
local root_dir = require("jdtls.setup").find_root({ ".git", "gradlew", "mvnw", "pom.xml", "gradle.properties", "settings.gradle.kts" })
local function make_project_name(path)
	return vim.fn.fnamemodify(path, ":t") .. "-" .. vim.fn.sha256(path):sub(1, 8)
end
local project = root_dir and make_project_name(root_dir)
	or make_project_name(vim.api.nvim_buf_get_name(0))
local workspace = home .. "/.eclipse/jdtls-workspace/" .. project

local config = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	-- command to start the language server
	cmd = {
		"java",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",

		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		jdtls_launcher,
		"-configuration",
		jdtls_config,
		"-data",
		workspace,
	},

	-- identify project root directory
	root_dir = root_dir,

	-- configuration of eclipse.jdt.ls specific settings
	settings = {
		java = {},
	},

	-- Language server initialization options
	init_options = {
		bundles = bundles,
	},

	on_attach = function(client, bufnr)
		vim.lsp.default_keymaps({ buffer = bufnr })

		-- Java specific actions from nvim-jdtls
		vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { buffer = bufnr, desc = "Organize Imports" })
		vim.keymap.set("n", "<leader>ev", jdtls.extract_variable, { buffer = bufnr, desc = "Extract Variable" })
		vim.keymap.set("n", "<leader>ec", jdtls.extract_constant, { buffer = bufnr, desc = "Extract Constant" })
		vim.keymap.set(
			"v",
			"<leader>em",
			[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
			{ buffer = bufnr, desc = "Extract Method" }
		)

		-- Test integration based on java-test bundle
		vim.keymap.set("n", "<leader>tc", jdtls.test_class, { buffer = bufnr, desc = "Test Class" })
		vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { buffer = bufnr, desc = "Test Nearest Method" })

		--  Disables semantic highlighting because
		--  it caused problems with treesitter and rose-pine.
		--  I want to use the treesitter syntax highlighting.
		client.server_capabilities.semanticTokensProvider = nil
	end,
}

jdtls.start_or_attach(config)
