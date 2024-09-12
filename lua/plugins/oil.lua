return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
      { "<leader>e", "<CMD>Oil<CR>", desc = "Open parent directory" },
      -- { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      function _G.get_oil_winbar()
        local dir = require("oil").get_current_dir()
        if dir then
          return vim.fn.fnamemodify(dir, ":~")
        else
          -- If there is no current directory (e.g. over ssh), just show the buffer name
          return vim.api.nvim_buf_get_name(0)
        end
      end

      require("oil").setup({
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
        },
        view_options = {
          sort = {
            { "mtime", "desc" },
            { "name",  "asc" },
          },
        },
        keymaps = {
          ["q"] = "actions.close",
          ["<C-s>"] = false,
        },
        buf_options = {
          buflisted = true,
        },
        delete_to_trash = true,
        columns = {
          -- "permissions",
          "size",
          "mtime",
          "icon",
        },
      })
    end,
  },
}
