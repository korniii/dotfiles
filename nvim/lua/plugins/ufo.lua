return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		'kevinhwang91/promise-async'
	},
	event = "BufReadPost",
	opts = {
		open_fold_hl_timeout = 0,
		fold_virt_text_handler = function(text, lnum, endLnum, width)
			local suffix    = "  "
			local lines     = ('[%d lines] '):format(endLnum - lnum)

			local cur_width = 0
			for _, section in ipairs(text) do
				cur_width = cur_width + vim.fn.strdisplaywidth(section[1])
			end

			suffix = suffix .. (' '):rep(width - cur_width - vim.fn.strdisplaywidth(lines) - 3)

			table.insert(text, { suffix, 'Comment' })
			table.insert(text, { lines, 'Todo' })
			return text
		end,
		close_fold_kinds = { 'imports', 'comment' },
		preview = {
			win_config = {
				border       = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
				winblend     = 0,
				winhighlight = "Normal:LazyNormal",
			}
		}
	},
	init = function()
		vim.keymap.set("n", "zR", function()
			require("ufo").openAllFolds()
		end)
		vim.keymap.set("n", "zM", function()
			require("ufo").closeAllFolds()
		end)
		vim.keymap.set("n", "zp", function()
			require("ufo").peekFoldedLinesUnderCursor()
		end)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
		}
		local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
		for _, ls in ipairs(language_servers) do
			require('lspconfig')[ls].setup({
				capabilities = capabilities
				-- you can add other fields for setting up lsp server in this table
			})
		end
		require('ufo').setup()
	end
}
