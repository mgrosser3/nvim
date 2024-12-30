return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = "kevinhwang91/promise-async",

    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          -- default is LSP folding and fallback should be indent mode
          return { 'lsp', 'indent' }
        end
      })
    end
  }
}
