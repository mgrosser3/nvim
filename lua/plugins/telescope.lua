return {

  {
    'nvim-telescope/telescope.nvim',
    branch = "0.1.x",

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

          -- key maps
          mappings = {
            i = {                                          -- insert mode
              ["<C-k>"] = actions.move_selection_previous, -- move to prev
              ["<C-j>"] = actions.move_selection_next,     -- move to next
            }
          }

        } -- defaults
      })

      --
      -- Key Bindings
      --

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "files" })
      vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "git files" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "buffers" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "help tags" })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = "grep string" })
      vim.keymap.set('n', '<leader>fd', builtin.live_grep, { desc = "live grep" })
      vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "registers" })
    end

  }

}
