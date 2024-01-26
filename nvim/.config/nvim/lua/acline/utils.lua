local utils = {}

function utils.nmap(key, cmd, desc)
  vim.keymap.set('n', key, cmd, { desc = desc, noremap = true, silent = true })
end

function utils.vmap(key, cmd, desc)
  vim.keymap.set('v', key, cmd, { desc = desc, noremap = true, silent = true })
end

function utils.preserve_cursor(args)
  local args = string.format("keepjumps keeppatterns execute %q", args)
  -- local original_cursor = vim.fn.winsaveview()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_command(args)
  local lastline = vim.fn.line("$")
  -- vim.fn.winrestview(original_cursor)
  if line > lastline then
    line = lastline
  end
  vim.api.nvim_win_set_cursor({ 0 }, { line, col })
end

return utils
