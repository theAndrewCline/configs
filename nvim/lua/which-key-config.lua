local wk = require("which-key")

wk.register({
  p = { ':Telescope git_files<cr>', 'Search Files' },
  [";"] = { ":Telescope buffers<cr>", "List Buffers" },
  a = { ':Lspsaga code_action<cr>', 'Code Action' },
  s = { ':Telescope grep_string<cr>', 'Search' },
  t = { ':Telescope<cr>', 'Telescope<cr>' },
  d = { ":Telescope lsp_workspace_diagnostics<cr>", "Code Diagnostics"},
  u = {  ":so $MYVIMRC<cr>", "Refresh vimrc" },
  f = { ":Goyo<cr>", "Focus Mode" },
  g = {
    name = 'Git Actions',
    c = { ':Git commit<cr>', 'Git Commit' },
    s = { ':G<cr>', 'Git Status' },
    p = { ':Git pull<cr>', 'Git Pull' },
    P = { ':Git push<cr>', 'Git Push' },
  }


}, { prefix = "<leader>" })
