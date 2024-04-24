-- Plugin 'mason.vim' is a package manager for Neovim
-- that runs everywhere Neovim runs. Easily install and
-- manage LSP servers, DAP servers, linters, and formatters.

return {

  -- https://github.com/williamboman/mason.nvim
  {
    'williamboman/mason.nvim',

    priority = 100, -- make sure to load this before dependent plugins

    config = function()

      --
      -- Plugin Setup
      --

      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

    end
  }

}
