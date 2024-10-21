return {
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.keymap.set("n", "<leader>tt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle Float Terminal" })
      vim.keymap.set("t", "<leader>tt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle Float Terminal" })
    end
  },
}
