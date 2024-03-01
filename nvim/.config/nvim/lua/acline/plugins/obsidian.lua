return {
  "epwalsh/obsidian.nvim",
  lazy = false,
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>nt", "<cmd>ObsidianToday<cr>",              desc = "Today's Notes" },
    { "<leader>ny", "<cmd>ObsidianYesterday<cr>",          desc = "Yesterday's Notes" },
    { "<leader>nn", "<cmd>ObsidianNew<cr>",                desc = "New Note" },
    { "<leader>ns", "<cmd>ObsidianQuickSwitch<cr>",        desc = "Quick Switch Notes" },
    { "<leader>ng", "<cmd>ObsidianSearch<cr>",             desc = "Grep Notes" },
    { "<leader>nl", "<cmd>ObsidianLinkNew<cr>",            desc = "New Link" },
    { "<leader>nf", "<cmd>ObsidianFollowLink<cr>",         desc = "FollowLink" },
    { "<leader>no", "<cmd>ObsidianOpen<cr>",               desc = "Open Obsidian" },
    { "<leader>nw", "<cmd>ObsidianWorkspace work<cr>",     desc = "Switch to Work Workspace" },
    { "<leader>np", "<cmd>ObsidianWorkspace personal<cr>", desc = "Switch to Personal Workspace" },
    { "<leader>nb", "<cmd>ObsidianWorkspace brain<cr>",    desc = "Switch to Brain Workspace" },
  },
  opts = {
    checkboxes = {
      [" "] = { char = "⊡", hl_group = "ObsidianTodo" },
      ["x"] = { char = "✓", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      -- Replace the above with this if you don't have a patched font:
      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

    },
    daily_notes = {
      folder = "dailys",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil
    },
    note_id_func = function(title)
      local prefix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        prefix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          prefix = prefix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. prefix
    end,
    ui = { enable = true, },
    workspaces = {
      {
        name = "brain",
        path = "~/brain",
      },
      {
        name = "work",
        path = "~/brain",
        overrides = { notes_subdir = "work" },
      },
      {
        name = "personal",
        path = "~/brain",
        overrides = { notes_subdir = "personal" },
      },
    }
  },
}
