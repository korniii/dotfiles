return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neorg/neorg-telescope",
  },
  ft = "norg",
  cmd = "Neorg",
  keys = {
    { "<leader>fN", "<cmd>Telescope neorg find_norg_files<cr>", desc = "Find Neorg File" },
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
      ["core.integrations.telescope"] = {},
    },
  },
}
