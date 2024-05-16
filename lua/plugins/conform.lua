return {

  {
    'stevearc/conform.nvim',
    opts = {},

    config = function()
      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
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
