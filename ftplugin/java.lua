local status, jdtls = pcall(require, 'jdtls')

if not status then
  return
end

-- NOTE: jdtls was installed via Mason
local jdtls_launcher = vim.fn.findfile("org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
  vim.fn.stdpath("data") .. '/mason/packages/jdtls/plugins/', 1)

-- location to the config.ini of jdtls (only windows)
-- NOTE: only Windows
-- TODO: OS dependent configuration (linux and windows)
local jdtls_config = vim.fn.stdpath("data") .. '/mason/packages/jdtls/config_win'

local jdtls_data = '.jdtls'

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
    '-data', jdtls_data
  },

  -- identify project root directory
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),

  -- configuration of eclipse.jdt.ls specific settings
  settings = {
    java = {}
  },

  -- Language server initialization options
  init_options = {
    bundles = {}
  }
}

jdtls.start_or_attach(config)
