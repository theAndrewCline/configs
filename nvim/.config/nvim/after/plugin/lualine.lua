require('lualine').setup({
  tabline = {
    lualine_a = { 'buffers' },
    lualine_z = { 'branch' }
  },
  options = {
    theme = "auto",
    icons_enabled = false,
    section_separators = { right = '', left = '' },
    component_separators = { right = '', left = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filename' },
    lualine_z = { 'filetype' }
  },
})
