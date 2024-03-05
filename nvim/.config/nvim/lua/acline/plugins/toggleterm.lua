return {
  'akinsho/toggleterm.nvim',
  keys = {
    { '<leader>t', ':ToggleTerm<CR>' }
  },
  version = "*",
  config = {
    direction = 'float',
    float_opts = {
      border = 'curved',
    }
  }
}
