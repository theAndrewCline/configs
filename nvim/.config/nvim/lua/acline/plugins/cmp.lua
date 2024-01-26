return {
  'echasnovski/mini.completion',
  version = '*',
  config = function()
    require('mini.completion').setup({
      lsp_completion = {
        source_func = "omnifunc",
      },
    })
  end
}
