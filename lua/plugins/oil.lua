return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>e", "<CMD>Oil<CR>", desc = "Open parent directory" },
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        view_options = {
          sort = {
            { "mtime", "desc" },
            { "name",  "asc" },
          },
        },
        keymaps = {
          ["q"] = "actions.close",
        }
      })
    end,
  }
}
