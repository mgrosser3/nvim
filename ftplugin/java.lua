local status, jdtls = pcall(require, 'jdtls')

if not status then
  return
end

local is_windows = vim.fn.has('win32') == 1
-- assumption: jdtls was installed via Mason
local jdtls_launcher = vim.fn.glob(vim.fn.stdpath("data") ..
  "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar", true, true)

if type(jdtls_launcher) == "table" and #jdtls_launcher > 0 then
  jdtls_launcher = jdtls_launcher[1]
else
  vim.notify("JDTLS Launcher JAR could not be found!", vim.log.levels.ERROR)
  return
end

-- location to the config.ini of jdtls
local jdtls_config = vim.fn.stdpath("data") .. '/mason/packages/jdtls/config_'
    .. (is_windows and 'win' or 'linux')

-- The JDT Language Server requires a workspace directory to store metadata,
-- caches, and project configurations. It is recommended to keep this workspace
-- in a central location rather than inside individual projects. A good practice
-- is to place the workspace inside the home directory, similar to how Gradle
-- stores its metadata.
local home = is_windows and os.getenv 'USERPROFILE' or os.getenv 'HOME'
local project = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
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

  root_dir = vim.fs.root(0, { ".git", "gradlew", "gradle.properties", "settings.gradle.kts" }),

  -- configuration of eclipse.jdt.ls specific settings
  settings = {
    java = {}
  },

  -- Language server initialization options
  init_options = {
    bundles = {}
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

jdtls.start_or_attach(config)
