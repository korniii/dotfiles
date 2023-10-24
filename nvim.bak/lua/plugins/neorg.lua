return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neorg/neorg-telescope",
	},
	config = function()
		require("neorg").setup {
			vim.keymap.set("n", "<leader>sn", "<cmd>Telescope neorg find_norg_files<cr>", { desc = "[S]earch [N]eorg" }),
			vim.keymap.set("n", "<leader>on", "<cmd>Neorg index<cr>", { desc = "[O]pen [N]eorg" }),
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
