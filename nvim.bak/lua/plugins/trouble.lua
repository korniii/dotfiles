return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "[X] Toggle Trouble" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" , desc = "Trouble [W]orkspace diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" , desc = "Trouble [D]ocument diagnostics" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>" , desc = "Trouble [L]oclist" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" , desc = "Toggle [Q]uickfix" },
		{ "gR", "<cmd>TroubleToggle lsp_references<cr>" , desc = "Trouble [g]o to [R]eference" },
	}
}
