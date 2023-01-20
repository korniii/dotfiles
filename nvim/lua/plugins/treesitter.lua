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
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
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
