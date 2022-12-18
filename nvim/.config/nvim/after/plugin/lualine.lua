require('lualine').setup({
  tabline = {
    lualine_a = { 'buffers' },
    lualine_z = { 'branch' }
  },
  options = {
    theme = "auto",
    section_separators = { right = '', left = '' },
    component_separators = { right = '', left = '' },
  }
})
