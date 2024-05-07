return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    keys = {
      { "<C-,>", "<cmd>Telescope smart_open theme=ivy<cr>", desc = "Smart Open" },
    },
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  }
}
