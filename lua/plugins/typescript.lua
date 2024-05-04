return {
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      local util = require("lspconfig/util")

      require("typescript").setup({
        server = {
          root_dir = util.root_pattern(".git"),
          preferences = {
            includeCompletionsForModuleExports = false,
          },
        },
      })
    end,
  }
}
