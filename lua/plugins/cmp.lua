return {

  {
    -- https://github.com/hrsh7th/nvim-cmp
    'hrsh7th/nvim-cmp',

    dependencies = {

      -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp',

      -- https://github.com/hrsh7th/cmp-nvim-lua
      'hrsh7th/cmp-nvim-lua',

      -- https://github.com/L3MON4D3/LuaSnip
      'L3MON4D3/LuaSnip',
    },

    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
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
  }
}
