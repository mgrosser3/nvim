return {
  {
    "dstein64/nvim-scrollview",
    config = function()
      vim.g.scrollview_excluded_filetypes = { "NvimTree", "packer", "Trouble" }
    end,
  }
}
