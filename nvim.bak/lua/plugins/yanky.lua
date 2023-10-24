return {
	-- yank ring
	"gbprod/yanky.nvim",
	dependencies = { "kkharji/sqlite.lua" },
	enabled = true,
	event = "VeryLazy",
	opts = {
		highlight = { timer = 200 },
	},
	keys = {
		{ "<leader>sp", function() require("telescope").extensions.yank_history.yank_history({}) end,
			desc = "[S]earch [P]aste from Yanky" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
		{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
		{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
		{ "<c-n>", "<Plug>(YankyCycleForward)" },
		{ "<c-p>", "<Plug>(YankyCycleBackward)" },
		{ "]p", "<Plug>(YankyPutIndentAfterLinewise)" },
		{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)" },
		{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)" },
		{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)" },
		{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)" },
		{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)" },
		{ "=p", "<Plug>(YankyPutAfterFilter)" },
		{ "=P", "<Plug>(YankyPutBeforeFilter)" },
	},
}
