--
-- Language Server Protocol (LSP)
-- Plugins and Configuration
--

return {

  -- https://github.com/VonHeikemen/lsp-zero.nvim
  -- --------------------------------------------
  -- Collection of functions that will help you setup Neovim's LSP client,
  -- so you can get IDE-like features with minimum effort.
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false
  },

  -- https://github.com/williamboman/mason.nvim
  -- ------------------------------------------
  -- Plugin 'mason.vim' is a package manager for Neovim
  -- that runs everywhere Neovim runs. Easily install and
  -- manage LSP servers, DAP servers, linters, and formatters.
  {
    'williamboman/mason.nvim',
    lazy = false,

    config = function()
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
  },

  -- https://github.com/neovim/nvim-lspconfig
  -- ----------------------------------------
  -- The plugin nvim-lspconfig provides defauit LSP client configurations
  -- for a lot of different LSP servers.
  {
    'neovim/nvim-lspconfig',

    dependencies = {

      { 'williamboman/mason.nvim' },

      -- https://github.com/williamboman/mason-lspconfig.nvim
      -- ----------------------------------------------------
      -- The plugin mason-lspconfig closes some gaps between mason.nvim
      -- (see mason.lua) and nvim-lspconfig.
      { 'williamboman/mason-lspconfig.nvim' },

      -- https://github.com/hrsh7th/cmp-nvim-lsp
      -- ---------------------------------------
      -- Completion source for Neovim's built-in language server client.
      --
      { 'hrsh7th/cmp-nvim-lsp' },

    },

    config = function()
      local lsp_zero = require('lsp-zero')

      local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })

      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
        handlers = {
          -- the default handler applies to every language server
          -- without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end
        }
      })
    end
  },

  -- https://github.com/hrsh7th/nvim-cmp
  -- -----------------------------------
  -- It provides a completion engine where the completion sources can be
  -- installed from external repositories (e.g. cmp-nvim-lsp)
  {
    'hrsh7th/nvim-cmp',

    event = 'InsertEnter',

    dependencies = {
      -- https://github.com/L3MON4D3/LuaSnip
      -- -----------------------------------
      {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        -- build = "make install_jsregexp"
      },
    },

    config = function()
      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        }
      })
    end
  },

  -- https://github.com/mfussenegger/nvim-jdtls
  ---------------------------------------------
  -- In the documentation of lspconfig it is recommended to use the nvim-jdtls
  -- plugin to use all features of the java language server.
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jdtls
  {
    'mfussenegger/nvim-jdtls',
  }
}
