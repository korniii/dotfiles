return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})

		require("which-key").register({
			name = "Harpoon", -- optional group name
			ha = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "[H]arpoon [A]dd mark" },
			hm = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "[H]arpoon [M]enu" },
			j = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Navigate to file 1" },
			k = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Navigate to file 2" },
			l = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Navigate to file 3" },
			-- s = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Navigate to file 4" },
		}, { prefix = "<leader>" })
	end,
}
