return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>c", "<cmd>ChatGPT<cr>", "ChatGPT" }
  },
  config = function()
    require("chatgpt").setup()
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
