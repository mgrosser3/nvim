--
-- Language Server Protocol (LSP)
-- Plugins and Configuration
--

return {

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

  -- https://github.com/williamboman/mason-lspconfig.nvim
  -- ----------------------------------------------------
  -- The plugin mason-lspconfig closes some gaps between mason.nvim
  -- (see mason.lua) and nvim-lspconfig.
  {
    'williamboman/mason-lspconfig.nvim',

    lazy = false,

    dependencies = {

      { 'williamboman/mason.nvim' },

      -- https://github.com/neovim/nvim-lspconfig
      -- ----------------------------------------
      -- The plugin nvim-lspconfig provides defauit LSP client configurations
      -- for a lot of different LSP servers.
      { 'neovim/nvim-lspconfig' },

      -- https://github.com/hrsh7th/cmp-nvim-lsp
      -- ---------------------------------------
      -- Completion source for Neovim's built-in language server client.
      --
      { 'hrsh7th/cmp-nvim-lsp' },
    },

    config = function()
      local lspconfig = require('lspconfig')
      local lspconfig_mason = require('mason-lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- Default Keymaps (since Neovim 0.11)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

        -- Custom Keymaps
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "]e",
          function()
            vim.diagnostic.jump({
              count = 1,
              severity = vim.diagnostic.severity.ERROR
            })
          end, opts)
      end

      lspconfig_mason.setup({
        ensure_installed = { 'lua_ls', 'pyright', 'jdtls' },

        handlers = {
          -- Default handler applies to every installed language server
          -- without a "custom handler"
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,

          -- Java Language Server JDTLS
          -- ---------------------------
          -- It is managed by `nvim-jdtls`, so no configuration is needed here.
          -- For the full Language Server setup, see `ftplugin/java.lua`.
          ["jdtls"] = function()
          end,
        }
      })
    end,

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

      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' }, -- Wichtig für Snippets
    },

    config = function()
      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local luasnip = require('luasnip')

      cmp.setup({

        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },

        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),

          -- select next completion item OR jump to the next snippet field
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          -- select previous completion item OR jump to the previous snippet field
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jump_prev() then
              luasnip.jump_prev()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        ['<C-Space>'] = cmp.mapping.complete(),

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
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
