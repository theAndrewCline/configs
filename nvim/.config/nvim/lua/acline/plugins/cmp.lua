return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'onsails/lspkind.nvim',
    'zbirenbaum/copilot.lua',
    'zbirenbaum/copilot-cmp',
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    -- copilot.setup({
    --   suggestion = { enabled = true },
    --   panel = { enabled = false },
    -- })
    --
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        -- { name = "copilot" },
        -- { name = 'buffer' },
        -- { name = 'path' },
        -- { name = 'cmdline' },
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
        })
      }
    })
  end
}
