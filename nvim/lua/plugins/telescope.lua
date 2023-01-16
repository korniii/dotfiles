return {
	"nvim-lua/plenary.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim"
	},
  init = function()

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>sr", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<leader>sg", builtin.git_files, {})

  end
}

