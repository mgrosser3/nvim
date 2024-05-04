return {
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({
        ring = {
          history_length = 100,
          storage = "memory",
          sync_with_numbered_registers = true,
        },
        picker = {
          select = {
            action = nil, -- nil to use default put action
          },
          telescope = {
            mappings = nil, -- nil to use default mappings
          },
        },
        system_clipboard = {
          sync_with_ring = true,
        },
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
        preserve_cursor_position = {
          enabled = true,
        },
      })

      vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
      vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
      vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
      vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
      vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
      vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
      vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
      vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

      vim.keymap.set("n", "y", "<Plug>(YankyYank)", {})
      vim.keymap.set("x", "y", "<Plug>(YankyYank)", {})

      vim.api.nvim_set_keymap("n", "<A-y>", "<Plug>(YankyCycleForward)", {})
      vim.api.nvim_set_keymap("n", "<A-S-y>", "<Plug>(YankyCycleBackward)", {})
    end,
  }
}
