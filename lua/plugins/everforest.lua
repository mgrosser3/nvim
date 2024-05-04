return {
  {
    "sainnhe/everforest",
    config = function()
      vim.cmd([[set background=dark]])
      vim.cmd([[let g:everforest_background = 'hard']])
      vim.cmd([[colorscheme everforest]])
    end,
  }
}
