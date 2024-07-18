return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  keys = {
    { "<leader>hp", ":lua require('kulala').jump_prev()<CR>", desc = "Run request under cursor" },
    { "<leader>hn", ":lua require('kulala').jump_next()<CR>", desc = "Run request under cursor" },
    { "<leader>hr", ":lua require('kulala').run()<CR>", desc = "Run request under cursor" },
    { "<leader>ht", ":lua require('kulala').toggle_view()<CR>", desc = "Toggle between request header/body" },
  },
  config = function()
    require("kulala").setup()
  end,
}
