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
      -- Telescope Setup
      --

      telescope.setup({
        defaults = {

          -- key maps 
          mappings = {
            i = { -- insert mode
              ["<C-k>"] = actions.move_selection_previous, -- move to prev 
              ["<C-j>"] = actions.move_selection_next,     -- move to next  
            }
          }

        } -- defaults
      })

      --
      -- Key Bindings
      --

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
    end

  }

}
