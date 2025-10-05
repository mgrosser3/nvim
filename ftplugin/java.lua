-- lua module jdtls is provided by mfussenegger/nvim-jdtls (see lsp.lua)
local status, jdtls = pcall(require, 'jdtls')

if not status then
  return
end

local is_windows = vim.fn.has('win32') == 1

local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
local java_test_path = mason_path .. "/java-test"
local java_debug_path = mason_path .. "/java-debug-adapter"

-- assumption: jdtls was installed via Mason
local jdtls_launcher = vim.fn.glob(mason_path ..
  "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true, true)

if type(jdtls_launcher) == "table" and #jdtls_launcher > 0 then
  jdtls_launcher = jdtls_launcher[1]
else
  vim.notify("JDTLS Launcher JAR could not be found!", vim.log.levels.ERROR)
  return
end

-- location to the config.ini of jdtls
local jdtls_config = mason_path .. '/jdtls/config_'
    .. (is_windows and 'win' or 'linux')

-- Debub Adapter JAR
local java_debug_bundle = vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")

-- Test Runner JARs
local java_test_bundles = vim.split(
  vim.fn.glob(java_test_path .. "/extension/server/*.jar", true), "\n"
)

-- The JDT Language Server requires a workspace directory to store metadata,
-- caches, and project configurations. It is recommended to keep this workspace
-- in a central location rather than inside individual projects. A good practice
-- is to place the workspace inside the home directory, similar to how Gradle
-- stores its metadata.
local home = is_windows and os.getenv 'USERPROFILE' or os.getenv 'HOME'
local root_dir = require('jdtls.setup').find_root({ ".git", "gradlew", "gradle.properties", "settings.gradle.kts" })
local project = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace = home .. '/.eclipse/jdtls-workspace/' .. project

local config = {
  -- command to start the language server
  cmd = {
    'java',

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',

    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', jdtls_launcher,
    '-configuration', jdtls_config,
    '-data', workspace
  },

  -- identify project root directory
  root_dir = root_dir,

  -- configuration of eclipse.jdt.ls specific settings
  settings = {
    java = {}
  },

  -- Language server initialization options
  init_options = {
    bundles = {
      java_debug_bundle,
      java_test_bundles,
    }
  },

  on_attach = function(client, bufnr)
    vim.lsp.default_keymaps({ buffer = bufnr })

    -- Java specific actions from nvim-jdtls
    vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { buffer = bufnr, desc = "Organize Imports" })
    vim.keymap.set("n", "<leader>ev", jdtls.extract_variable, { buffer = bufnr, desc = "Extract Variable" })
    vim.keymap.set("n", "<leader>ec", jdtls.extract_constant, { buffer = bufnr, desc = "Extract Constant" })
    vim.keymap.set("v", "<leader>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
      { buffer = bufnr, desc = "Extract Method" })

    -- Test integration based on java-test bundle
    vim.keymap.set("n", "<leader>tc", jdtls.test_class, { buffer = bufnr, desc = "Test Class" })
    vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { buffer = bufnr, desc = "Test Nearest Method" })

    -- Debug integration based on java-debug-adapter bundle
    vim.keymap.set("n", "<leader>dc", jdtls.test_class, { buffer = bufnr, desc = "Debug Class" })
    vim.keymap.set("n", "<leader>dm", jdtls.test_nearest_method, { buffer = bufnr, desc = "Debug Method" })

    --  Disables semantic highlighting because
    --  it caused problems with treesitter and rose-pine.
    --  I want to use the treesitter syntax highlighting.
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

jdtls.start_or_attach(config)
