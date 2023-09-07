return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neorg/neorg-telescope",
	},
	config = function()
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.keybinds"] = {
					config = {
						neorg_leader = " "
					}
				},
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = {  -- Manages Neorg workspaces
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
					}
				},
				["core.integrations.telescope"] = {},
			},
		}
	end,
}
