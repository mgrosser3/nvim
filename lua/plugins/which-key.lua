return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local wk = require("which-key")

      wk.register({
        ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
        ["e"] = { "<cmd>Oil<CR>", "Explorer" },
        ["b"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
        ["f"] = { "<cmd>Telescope git_files<CR>", "Git Files" },
        ["o"] = { "<cmd>Telescope oldfiles<CR>", "Old Files" },
        ["p"] = { "<cmd>Telescope projects<CR>", "Projects" },
        ["r"] = {
          '<cmd>:lua require("fzf-lua").lsp_references({ jump_to_single_result = true })<CR>',
          "References",
        },
        ["d"] = {
          '<cmd>:lua require("fzf-lua").lsp_definitions({ jump_to_single_result = true })<CR>',
          "Definitions",
        },
        ["t"] = { '<cmd>:lua require("fzf-lua").lsp_typedefs({ jump_to_single_result = true })<CR>', "Type" },
        ["R"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        ["s"] = { "<cmd>w<CR>", "Save Buffer" },
        -- ["S"] = { "<cmd>wall<CR>", "Save All" },
        S = {
          "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
          "Workspace Symbols",
        },

        ["i"] = { "<cmd>TypescriptAddMissingImports<CR>", "Add Missing Imports" },

        g = {
          name = "Git",
          ["g"] = { "<cmd>Neogit<CR>", "Git" },
          j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
          k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
          l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
          p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
          r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
          R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
          s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
          u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
          },
          o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
          b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
          c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
          C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)",
          },
          d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Git Diff",
          },
        },

        T = {
          name = "Typescript",
          i = { "<cmd>TSToolsAddMissingImports<CR>", "Add Missing Imports" },
          R = { "<cmd>TSToolsRenameFile<CR>", "Rename File" },
          r = { "<cmd>TSToolsRemoveUnused<CR>", "Remove Unused" },
          f = { "<cmd>TSToolsFixAll<CR>", "Fix All" },
        },

        l = {
          name = "LSP",
          r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
          s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
          S = {
            "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
            "Workspace Symbols",
          },
        },
        C = {
          name = "LunarVim",
          C = { "<cmd>:e  ~/.config/nvim/init.lua<CR>", "Edit Config" },
          L = { "<cmd>Lazy<CR>", "Lazy" },
          M = { "<cmd>Mason<CR>", "Mason" },
        },

        B = {
          name = "Diff",
          ["b"] = { "<Esc>:diffthis<Cr>gg<C-w>w:diffthis<Cr>gg", "Diff Buffers" },
          ["o"] = { "<Esc>:diffoff<CR>", "Diff Off" },
          ["f"] = { "<Esc>:DiffviewFileHistory %<CR>", "Diff View File" },
          ["t"] = { "<Esc>:windo diffthis<CR>", "Diff This" },
          ["q"] = { "<Esc>:windo diffoff<CR>", "Diff This Off" },
        },
      }, { prefix = "<leader>" })
    end,
  },
}
