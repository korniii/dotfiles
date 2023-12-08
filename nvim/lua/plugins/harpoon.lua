return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    require("which-key").register({
      h = {
        name = "+harpoon", -- optional group name
        a = {
          function()
            harpoon:list():append()
          end,
          "[H]arpoon [A]dd mark",
        },
        m = {
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          "[H]arpoon [M]enu",
        },
      },
      j = {
        function()
          harpoon:list():select(1)
        end,
        "Navigate to file 1",
      },
      k = {

        function()
          harpoon:list():select(2)
        end,
        "Navigate to file 2",
      },
      l = {
        function()
          harpoon:list():select(3)
        end,
        "Navigate to file 3",
      },
    }, { prefix = "<leader>" })
  end,
}
