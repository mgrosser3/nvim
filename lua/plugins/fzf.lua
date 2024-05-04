return {
  {
    "ibhagwan/fzf-lua",
    -- commit = "3da9ad3",
    config = function()
      local actions = require("fzf-lua.actions")
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
