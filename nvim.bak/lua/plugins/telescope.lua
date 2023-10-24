return {
	"nvim-lua/plenary.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	init = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sr", builtin.live_grep, { desc = "[S]earch in Files with [R]ipgrep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "[S]earch in [B]uffer" })
		vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[S]earch in [G]it Files" })
		vim.keymap.set("n", "<leader>ss", builtin.grep_string, { desc = "[S]earch current [S]tring" })
	end,
}
