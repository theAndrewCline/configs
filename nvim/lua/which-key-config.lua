local wk = require("which-key")

wk.register({
  p = { ':Telescope git_files<cr>', 'Search Files' },
  [";"] = { ":Telescope buffers<cr>", "List Buffers" },
  a = { ':Lspsaga code_action<cr>', 'Code Action' },
  s = { ':Telescope live_grep<cr>', 'Search' },
  S = { ':PackerSync<cr>', 'Update Plugins' },
  t = { ':Telescope<cr>', 'Telescope' },
  d = { ":Telescope lsp_workspace_diagnostics<cr>", "Code Diagnostics"},
  u = { ":so $MYVIMRC<cr>", "Refresh vimrc" },
  f = { ":ZenMode<cr>", "Zen Mode" },
  b = { ":Telescope file_browser<cr>", "Browse Files" },
  j = { ":cn<CR>", "Next in quick fix"},
  k = { ":cp<CR>", "Previous in quick fix"},
  e = { ":TroubleToggle<CR>", "LSP Errors"},
  g = {
    name = 'Git Actions',
    c = { ':Git commit<cr>', 'Git Commit' },
    s = { ':G<cr>', 'Git Status' },
    p = { ':Git pull<cr>', 'Git Pull' },
    P = { ':Git push<cr>', 'Git Push' },
  }


}, { prefix = "<leader>" })
