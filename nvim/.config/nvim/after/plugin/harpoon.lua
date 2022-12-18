local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local nmap = function(key, fn, desc)
  vim.keymap.set('n', key, fn, { desc = desc })
end

nmap('<leader>a', mark.add_file, "[H]arpoon [A]dd mark")
nmap(ui.toggle_quick_menu, '<leader>hl', "[H]arpoon [U]i")

nmap('<leader>1', function() ui.nav_file(1) end, "[H]arpoon 1")
nmap('<leader>2', function() ui.nav_file(2) end, "[H]arpoon 2")
nmap('<leader>3', function() ui.nav_file(3) end, "[H]arpoon 3")
nmap('<leader>4', function() ui.nav_file(4) end, "[H]arpoon 4")
