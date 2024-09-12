return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = {
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ["<CR>"] = cmp.mapping(
          --   cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          --   { "i", "c" }
          -- ),
        },
        sources = {
          {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
              return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
            end,
          },
          -- { name = "buffer" },
          -- { name = "path" },
          -- { name = "cmdline" },
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = "buffer" },
        }),
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = {
          -- ["<CR>"] = cmp.mapping(
          --   cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          --   { "i", "c" }
          -- ),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        },
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = {
          -- ["<CR>"] = cmp.mapping(
          --   cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          --   { "i", "c" }
          -- ),
          ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        },
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
