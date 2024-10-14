return {
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.keymap.set("n", "<leader>t", "<cmd>:FloatermToggle<CR>", { desc = "Toggle Float Terminal" })
      vim.keymap.set("t", "<leader>t", "<cmd>:FloatermToggle<CR>", { desc = "Toggle Float Terminal" })
    end
  },
}
