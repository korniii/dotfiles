return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      "luarocks.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    ft = "norg",
    cmd = "Neorg",
    keys = {
      { "<leader>fN", "<cmd>Telescope find_files search_dirs=~/notes/<cr>", desc = "Find Neorg File" },
      { "<leader>no", "<cmd>Neorg<cr>", desc = "[O]pen [N]eorg" },
      { "<leader>njt", "<cmd>Neorg journal today<cr>", desc = "neorg: journal (today)" },
      { "<leader>njn", "<cmd>Neorg journal tomorrow<cr>", desc = "neorg: journal (tomorrow)" },
      { "<leader>njp", "<cmd>Neorg journal yesterday<cr>", desc = "neorg: journal (yesterday)" },
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            hook = function(keybinds)
              keybinds.unmap("norg", "n", "<Leader>nid")
              keybinds.remap_event("norg", "n", "<Leader>nc", "core.looking-glass.magnify-code-block")
              keybinds.remap_event("norg", "n", "<Leader>ni", "core.integrations.telescope.insert_link")
              keybinds.remap_event("norg", "n", "<Leader>nwl", "core.integrations.telescope.switch_workspace")
            end,
            neorg_leader = "<Leader>n",
          },
        },
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "notes",
            folder_name = "journal",
          },
        },
      },
    },
  },
}
