local on_attach = function(_, bufnr)
	-- copied from kickstart.nvim
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('gt', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	-- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	nmap('dp', vim.diagnostic.goto_prev, '[D]iagnostic [P]revious')
	nmap('dn', vim.diagnostic.goto_next, '[D]iagnostic [N]ext')

	nmap('<leader>f', function() vim.lsp.buf.format { async = true } end, '[F]ormat')

end

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",

			-- nicer snippets
			"onsails/lspkind-nvim",
		},
		config = function()

			local lsp = require('lsp-zero')

			lsp.preset('recommended')

			lsp.ensure_installed({
				"tsserver",
				"sumneko_lua",
				"gopls",
				"rust_analyzer",
				"marksman"
			})

			lsp.configure('sumneko_lua', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
					},
				},
			})

			local cmp = require('cmp')
			local ls = require('luasnip')

			-- Previous snippet region
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.jumpable(-1) then ls.jump(-1) end
			end, { silent = true })

			-- Next snippet region
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.jumpable(1) then ls.jump(1) end
			end, { silent = true })

			-- Cycle "choices" for current snippet region
			vim.keymap.set({ "i", "s" }, "<C-l>", function()
				if ls.choice_active() then ls.change_choice(1) end
			end)

			local ok, lspkind = pcall(require, "lspkind")
			if not ok then
				return
			end

			lspkind.init()

			lsp.setup_nvim_cmp({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},

				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
					["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<c-y>"] = cmp.mapping(
						cmp.mapping.confirm {
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						},
						{ "i", "c" }
					),
				},

				sources = {
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 5 },
				},

				formatting = {
					format = lspkind.cmp_format {
						with_text = true,
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[api]",
							path = "[path]",
							luasnip = "[snip]",
							gh_issues = "[issues]",
							tn = "[TabNine]",
						},
					},
				},
			})


			lsp.on_attach(on_attach)

			lsp.setup()

			vim.diagnostic.config({
				virtual_text = true,
			})
		end
	},
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")

			rt.setup({
				server = {
					on_attach = on_attach
				},
			})
		end
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require "fidget".setup {}
		end
	}
}
