return {
  {
    "jose-elias-alvarez/typescript.nvim",
    enabled = false,
    priority = 100,
    config = function()
      local util = require("lspconfig/util")

      require("typescript").setup({
        server = {
          root_dir = util.root_pattern(".git"),
          preferences = {
            includeCompletionsForModuleExports = false,
          },
          on_attach = function(client, bufnr)
            -- your other on_attach stuff here if you have any
            -- ...
            vim.lsp.inlay_hint.enable(true)
          end,
        },
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  }
}
