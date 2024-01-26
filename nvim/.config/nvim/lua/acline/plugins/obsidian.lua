return {
  "epwalsh/obsidian.nvim",
  version = "*", 
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    checkboxes = {
      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      [" "] = { char = "⊡", hl_group = "ObsidianTodo" },
      ["x"] = { char = "✓", hl_group = "ObsidianDone" },
      -- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      -- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      -- Replace the above with this if you don't have a patched font:
      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

      -- You can also add more custom ones...
    },
    ui = { enable = true, },
    workspaces = {
      { 
        name = "brain",
        path = "~/brain",
      }
    }
  }
}
