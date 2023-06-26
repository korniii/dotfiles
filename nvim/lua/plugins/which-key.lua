return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>o"] = { name = "+open" },
				["<leader>s"] = { name = "+search" },
        ["<leader>x"] = { name = "+trouble" },
      })
    end,
}
