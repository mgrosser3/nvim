local status, jdtls = pcall(require, 'jdtls')

if not status then
  return
end

local id = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace = "~/.cache/jdtls/workspace/" .. id

local config = {
  -- command to start the language server
  cmd = {
    'java',

    -- define some java properties
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',

    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- requirement: jdtls was installed with mason
    '-jar', vim.stdpath("data") .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar',

    -- location to the config.ini of jdtls (only windows)
    -- TODO: OS dependent configuration (linux, mac and windows)
    '-configuration', vim.stdpath("data") .. '/mason/packages/jdtls/config_win',

    -- jdtls data directory
    -- TODO: I would  like use '<root_dir>/.cache/jdtls'.
    '-data', workspace
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
