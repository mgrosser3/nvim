return {
  {
    "mizlan/iswap.nvim",
    keys = {
      {"gS", ":ISwapNode<CR>"},
    },
    config = function()
      require("iswap").setup()
    end,
  }
}
