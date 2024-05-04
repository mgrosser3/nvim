return {
  {
    "ibhagwan/fzf-lua",
    -- commit = "3da9ad3",
    keys = {
      { "gt", "<cmd>:lua require('fzf-lua').lsp_typedefs({ jump_to_single_result = true })<CR>", desc = "Type Definitions" },
      { "gr", "<cmd>:lua require('fzf-lua').lsp_references({ jump_to_single_result = true })<CR>", desc = "References" },
      { "gd", "<cmd>:lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<CR>", desc = "Definitions" },
    },
    config = function()
      require("fzf-lua").setup({
        "telescope",
        winopts = {
          -- split = "belowright new", -- open in a top split
          on_create = function()
            -- called once upon creation of the fzf main window
            -- can be used to add custom fzf-lua mappings, e.g:
            vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
            vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
          end,
        },
      })
    end,
  }
}
