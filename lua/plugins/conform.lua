return {

  {
    'stevearc/conform.nvim',
    opts = {},

    config = function()
      local mason_ext = require('mgrosser3.ext.mason')
      local formatters = { "black", "isort", "stylua", "prettier", "ormolu" }
      mason_ext.ensure_installed(formatters)

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          html = { 'prettier' },
          css = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier_markdown' },
          haskell = { 'ormolu' },
        },

        formatters = {
          prettier_markdown = {
            command = "prettier",
            args = {
              "--prose-wrap",
              "always",
              "--print-width",
              "80",
              "--stdin-filepath",
              "$FILENAME",
            },
          },
        },

        format_on_save = {
          -- I recommend these options. See :help conform.format for details.
          lsp_fallback = true,
          timeout_ms   = 500,
        },
      }
    end
  }

}
