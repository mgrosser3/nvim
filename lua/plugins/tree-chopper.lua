return {
  {
    dir = "~/Software/misc/tree-chopper.nvim",
    config = function()
      -- vim.keymap.set("n", "D", ':lua require("treesitter-unit").deleteUntilParentEnd()<CR>')
      vim.keymap.set("n", "C", ':lua require("treesitter-unit").changeUntilParentEnd()<CR>', { silent = true })
      vim.keymap.set("n", "dI", ':lua require("treesitter-unit").deleteContent()<CR>', { silent = true })
      vim.keymap.set("n", "<A-i>", ':lua require("treesitter-unit").deleteContent()<CR>', { silent = true })
      vim.keymap.set("n", "<A-I>", ':lua require("treesitter-unit").deleteForward()<CR>', { silent = true })
      vim.keymap.set("n", "<A-l>", ':lua require("treesitter-unit").jumpNext()<CR>', { silent = true })
      vim.keymap.set("n", "<A-h>", ':lua require("treesitter-unit").jumpPrev()<CR>', { silent = true })
      vim.keymap.set(
      "n",
      "<A-p>",
      ':lua require("treesitter-unit").goto_stoppping_parent_start()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "<leader>vu",
      ':lua require("treesitter-unit").markClosestTopLevelNode()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "<M-C-H>",
      ':lua require("treesitter-unit").markClosestTopLevelNode()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "ga",
      ':lua require("treesitter-unit").gotoStartOfClosestTopLevelNode()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "ge",
      ':lua require("treesitter-unit").gotoEndOfClosestTopLevelNode()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "<M-C-P>",
      ':lua require("treesitter-unit").gotoStartOfClosestTopLevelNode()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "<leader>ve",
      ':lua require("treesitter-unit").markUntilEolOrParentEnd()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "D",
      ':lua require("treesitter-unit").deleteUntilEolOrParentEnd()<CR>',
      { silent = true }
      )
      vim.keymap.set(
      "n",
      "C",
      ':lua require("treesitter-unit").changeUntilEolOrParentEnd()<CR>',
      { silent = true }
      )
    end,
  }
}
