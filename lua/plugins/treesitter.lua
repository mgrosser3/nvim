-- Syntax Highlighting Plugin nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

return {

  {
    'nvim-treesitter/nvim-treesitter',

    -- build is executed when the plugin is installed or updated
    build = ':TSUpdate',

    config = function()
      -- Set the fold method to expression and use Tree-sitter's fold expression
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

      require 'nvim-treesitter.configs'.setup {

        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "vim", "vimdoc", "lua", "java" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { "" },

        -- This provides more accurate and language-aware indentation handling
        -- for supported programming languages.
        indent = {
          enable = true, -- Activate Tree-sitter's indention
        },

        -- This allows for more precise and context-aware folding,
        -- making it easier to manage and navigate complex code structures.
        fold = {
          enable = true, -- Activate Tree-Sitter's folding feature
        },

        highlight = {
          enable = true,

          -- List of language that will be disabled
          disable = { "" },

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false
        },
      }
    end -- config
  }
}
