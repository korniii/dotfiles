return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-null-ls").setup({
			ensure_installed = {
				-- Opt to list sources here, when available in mason.
			},
			automatic_installation = false,
			handlers = {
				prettierd = function()
					local null_ls = require "null-ls"
					null_ls.register(
						null_ls.builtins.formatting.prettierd.with {
							extra_filetypes = { "astro" }
						}
					)
				end,
			},
		})
		require("null-ls").setup({
			log_level = "warn",
			sources = {
				-- Anything not supported by mason.
			}
		})
	end,
}
