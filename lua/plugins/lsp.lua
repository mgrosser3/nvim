return {

  --
  -- Language Server Protocol (LSP) Setup
  --

  {
    -- Collection of functions that will help you setup Neovim's LSP client,
    -- so you can get IDE-like features with minimum effort.
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    'VonHeikemen/lsp-zero.nvim',

    dependencies = {

      -- https://github.com/neovim/nvim-lspconfig
      'neovim/nvim-lspconfig',

      -- https://github.com/williamboman/mason-lspconfig.nvim
      'williamboman/mason-lspconfig.nvim',

      -- https://github.com/hrsh7th/nvim-cmp
      'hrsh7th/nvim-cmp',

      -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp',

      -- https://github.com/hrsh7th/cmp-nvim-lua
      'hrsh7th/cmp-nvim-lua',

      -- https://github.com/L3MON4D3/LuaSnip
      'L3MON4D3/LuaSnip',
    },

    config = function()
      local lsp_zero = require('lsp-zero')

      -- Appearance Settings
      lsp_zero.set_sign_icons({
        error = "✘",
        warn = " ",
        hint = "",
        info = "",
      })

      -- Keybindings
      lsp_zero.on_attach(function(client, bufnr)
        -- default keybindings
        -- see :help lsp-zero-keybinding
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      -- Install and configure Language Server
      -- with mason, mason-lspconfig and lspconfig.
      require('mason-lspconfig').setup({

        -- Language Servers are listed here
        ensure_installed = { 'vimls', 'lua_ls', 'jdtls', 'pylsp' },

        handlers = {
          -- this is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          -- Configure lua language server for Neovim
          -- .luarc.json is necessary!
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })

      require('lspconfig').jdtls.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)
          print('Hello Java Language Server')
        end
      })

      -- Setup cmp
      -- TODO: move this to cmp.lua
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<ESC>'] = cmp.mapping.abort(),
          ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
          ['<C-j>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
          ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
          ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item({ behavior = 'insert' })
            else
              cmp.complete()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        formatting = {
          -- changing the order of fields so the icon is the first
          fields = { 'abbr', 'kind', 'menu' },

          -- here is where the change happens
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = '[nvim_lsp]',
              luasnip = '[luasnip]',
              buffer = '[buffer]',
              path = '[path]',
              nvim_lua = '[nvim_lua]',
            }

            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },

      })
    end
  },
}
