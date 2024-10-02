return {
  "ramilito/kubectl.nvim",
  keys = {
    { "<leader>k", "<cmd>lua require('kubectl').toggle()<cr>", desc = "Open k8s" },
  },
  config = function()
    require("kubectl").setup()
  end,
}
