return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabledd = false,
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
          ["<C-i>"] = cmp.mapping.complete(),
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
        mapping = cmp.mapping.preset.cmdline({
          -- ["<CR>"] = cmp.mapping(
          --   cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          --   { "i", "c" }
          -- ),
          ['<C-i>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        }),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          -- ["<CR>"] = cmp.mapping(
          --   cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
          --   { "i", "c" }
          -- ),
          -- ["<C-i>"] = cmp.mapping.complete(),
          ['<C-i>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
          ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        }),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
  -- {
  --   'saghen/blink.cmp',
  --   lazy = false, -- lazy loading handled internally
  --   -- optional: provides snippets for the snippet source
  --   dependencies = 'rafamadriz/friendly-snippets',
  --
  --   -- use a release tag to download pre-built binaries
  --   version = 'v0.*',
  --   -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  --   -- build = 'cargo build --release',
  --   -- If you use nix, you can build from source using latest nightly rust with:
  --   -- build = 'nix run .#build-plugin',
  --
  --   ---@module 'blink.cmp'
  --   ---@type blink.cmp.Config
  --   opts = {
  --     keymap = {
  --       show = '<C-space>',
  --       hide = '<C-e>',
  --       accept = '<enter>',
  --
  --       -- select_and_accept = {},
  --       select_prev = { '<Up>', '<C-k>' },
  --       select_next = { '<Down>', '<C-j>' },
  --
  --       show_documentation = '<C-space>',
  --       hide_documentation = '<C-space>',
  --       scroll_documentation_up = '<C-b>',
  --       scroll_documentation_down = '<C-f>',
  --
  --       snippet_forward = '<Tab>',
  --       snippet_backward = '<S-Tab>',
  --     },
  --
  --     highlight = {
  --       -- sets the fallback highlight groups to nvim-cmp's highlight groups
  --       -- useful for when your theme doesn't support blink.cmp
  --       -- will be removed in a future release, assuming themes add support
  --       use_nvim_cmp_as_default = true,
  --     },
  --     -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  --     -- adjusts spacing to ensure icons are aligned
  --     nerd_font_variant = 'normal',
  --
  --     -- experimental auto-brackets support
  --     -- accept = { auto_brackets = { enabled = true } }
  --
  --     -- experimental signature help support
  --     -- trigger = { signature_help = { enabled = true } }
  --   }
  -- }
}
