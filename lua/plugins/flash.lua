return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      treesitter = {
        labels = "jklöfdsauioprewqhm,.-gvcxyztbn",
      },
      highlight = {
        label = {
          rainbow = {
            enabled = true,
            -- number between 1 and 9
            shade = 5,
          },
        },
      },
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<Space>",
        mode = { "x", "o" },
        function()
          require("flash").treesitter_search()
        end,
      },
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "ö",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
  }
}
