vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })

vim.keymap.set('n', '<leader>gp',
  function ()
    vim.cmd.Git({ args = { "pull" } })
  end,
  { desc = '[G]it [P]ull' }
)

vim.keymap.set('n', '<leader>gP',
  function ()
    vim.cmd.Git({ args = { "push" } })
  end,
  { desc = '[G]it [P]ush' }
)
