return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = {
				"bash",
				"css",
				"fish",
				"gitignore",
				"go",
				"graphql",
				"help",
				"html",
				"http",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
				"terraform",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"yaml",
				"json",
			},
			highlight = {
				enable = true,
			},
		}
	end
}
