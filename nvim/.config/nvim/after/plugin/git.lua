vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })

vim.keymap.set('n', '<leader>gp',
  function()
    vim.cmd.Git({ args = { "pull" } })
  end,
  { desc = '[G]it [P]ull' }
)

vim.keymap.set('n', '<leader>gP',
  function()
    vim.cmd.Git({ args = { "push" } })
  end,
  { desc = '[G]it [P]ush' }
)

vim.keymap.set('n', '<leader>lg',
  function() vim.cmd.LazyGit() end,
  { desc = '[L]azy [G]it' }
)

require('gitsigns').setup {
  current_line_blame = true,
}
