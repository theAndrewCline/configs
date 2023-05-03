local builtin = require('telescope.builtin')

require('telescope').setup {
	pickers = { file_browser = { initial_mode = 'normal' } }
}

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>F', builtin.git_files, { desc = 'Find Git Files'})

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
