return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
		keys = {
			-- { "<leader>gd", "<cmd>DiffviewOpen<cr>",  desc = "[G]it [D]iffView" },
			-- { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "[G]it [C]lose DiffView" },
			{
				'<leader>gd',
				function()
					if next(require("diffview.lib").views) == nil then
						vim.cmd('DiffviewOpen')
					else
						vim.cmd('DiffviewClose')
					end
				end,
				desc = "[G]it [D]iffView"
			},
			{
				"<leader>gh",
				function()
					vim.ui.input({ prompt = "Git Pickaxe (empty = full history)" }, function(query)
						if not query then return end
						if query ~= "" then query = string.format(" -G'%s'", query) end
						vim.cmd("DiffviewFileHistory %" .. query)
						vim.cmd.wincmd("w") -- go directly to file window
						vim.cmd.wincmd("|") -- maximize
					end)
				end,
				desc = "[G]it File [H]istory"
			}
		},
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local advanced = require("telescope").load_extension("advanced_git_search")

			vim.api.nvim_create_user_command(
				"DiffCommitLine",
				"lua require('telescope').extensions.advanced_git_search.diff_commit_line()",
				{ range = true }
			)

			vim.api.nvim_set_keymap(
				"v",
				"<leader>sc",
				":DiffCommitLine<CR>",
				{ noremap = true }
			)

			vim.keymap.set("n", "<leader>sc", advanced.search_log_content_file, { desc = "[S]earch current File [C]ommits" })
			-- vim.keymap.set("n", "<leader>sC", builtin.git_commits, { desc = "[S]earch current Branch [C]ommits" })
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require("gitlinker").setup()

			vim.api.nvim_set_keymap('n', '<leader>go',
				'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
				{ silent = true, desc = "[G]it [O]pen in Browser" })
			vim.api.nvim_set_keymap('v', '<leader>go',
				'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
				{ silent = true, desc = "[G]it [O]pen in Browser" })
		end
	}
}
