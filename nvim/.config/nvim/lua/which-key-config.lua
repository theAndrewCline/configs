local wk = require("which-key")

wk.register({
  p = { ':Telescope git_files<cr>', 'Search Files' },
  [";"] = { ":Telescope buffers<cr>", "List Buffers" },
  a = { ':lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
  s = { ':Telescope live_grep<cr>', 'Search' },
  S = { ':PackerSync<cr>', 'Update Plugins' },
  t = { ':Telescope<cr>', 'Telescope' },
  d = { ":DBUIToggle<CR>", "Dadbod Toggle"},
  u = { ":so $MYVIMRC<cr>", "Refresh vimrc" },
  b = { ":Telescope file_browser<cr>", "Browse Files" },
  j = { ":cn<CR>", "Next in quick fix"},
  k = { ":cp<CR>", "Previous in quick fix"},
  g = {
    name = 'Git Actions',
    c = { ':Git commit<cr>', 'Git Commit' },
    s = { ':G<cr>', 'Git Status' },
    p = { ':Git pull<cr>', 'Git Pull' },
    P = { ':Git push<cr>', 'Git Push' },
  }
}, { prefix = "<leader>" })
