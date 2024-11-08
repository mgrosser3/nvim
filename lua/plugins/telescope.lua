function my_live_grep()
  local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
  if vim.v.shell_error == 0 then
    require("telescope.builtin").live_grep({ cwd = root })
  else
    require("telescope.builtin").live_grep()
  end
end

return {

  {
    'nvim-telescope/telescope.nvim',
    branch = "master",

    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')

      --
      -- Plugin Setup
      --

      telescope.setup({
        defaults = {
          path_display = {
            "filename_first"
          },

          -- key maps
          mappings = {
            i = { -- insert mode
              ["<C-k>"] = actions.move_selection_previous, -- move to prev
              ["<C-j>"] = actions.move_selection_next, -- move to next
              ["ĸ"] = actions.move_selection_previous, -- move to prev
              ["ʒ"] = actions.move_selection_next, -- move to next
            }
          }

        } -- defaults
      })

      --
      -- Key Bindings
      --

      vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
      vim.keymap.set("n", "gr", builtin.lsp_references, {})
      vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
      vim.keymap.set("n", "ð", builtin.lsp_definitions, {})

      vim.keymap.set("n", "đ", builtin.buffers, {})
      vim.keymap.set("n", "<C-4>", my_live_grep, {})
      vim.keymap.set("n", "<C-7>", builtin.oldfiles, {})
      vim.keymap.set("n", "<C-8>", builtin.buffers, {})
      vim.keymap.set("n", "<C-9>", builtin.git_files, {})
      vim.keymap.set("n", "ŋ", builtin.git_files, {})
      vim.keymap.set("n", "<C-ß>", builtin.lsp_dynamic_workspace_symbols, {})
      vim.keymap.set("n", "<M-o>", builtin.jumplist, {})

      vim.keymap.set("n", "<M-C-S-F>", ":lua require('telescope.builtin').live_grep({ cwd = '~/Software' })<CR>")
      vim.keymap.set("n", "<M-F>", ":lua require('telescope.builtin').find_files({ cwd = '~/' })<CR>")
      vim.keymap.set("n", "<M-f>", ":lua require('telescope.builtin').find_files({ cwd = '~/Software' })<CR>")
      vim.keymap.set("n", "<M-C-F>", builtin.current_buffer_fuzzy_find, {})

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})

      vim.keymap.set(
        "n",
        "ſ",
        "<cmd>:Telescope lsp_dynamic_workspace_symbols<CR>"
      )
    end

  }

}
