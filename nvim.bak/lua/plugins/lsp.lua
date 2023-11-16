local on_attach = function(_, bufnr)
	-- copied from kickstart.nvim
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- TODO: fix - activate experimental support for inlay hints gcc
	-- vim.lsp.buf.inlay_hint(bufnr, true)

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
				"lua_ls",
				"gopls",
				"rust_analyzer",
				"marksman"
			})

			-- don't initialize this language server
			-- we will use rust-tools to setup rust_analyzer
			lsp.skip_server_setup({ 'rust_analyzer' })

			lsp.configure('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' },
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							arrayIndex = "Disable",
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
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
					{ name = "crates" },
					{ name = "buffer",  keyword_length = 5 },
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
							crates = "[crates]",
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
					on_attach = on_attach,
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy"
							},
						}
					}
				},
			})
		end
	},
	{
		"saecki/crates.nvim",
		enabled = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufRead", "BufReadPre", "BufNewFile" },
		ft = { "toml" },
		lazy = true,
		config = function()
			require("crates").setup {
				on_attach = function(_, bufnr)
					local nmap = function(keys, func, desc)
						if desc then
							desc = 'LSP: ' .. desc
						end
						vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
					end

					nmap("K", "<cmd>lua require('crates').show_popup()<CR>", "Hover Documentatio")
					nmap("<leader>Cr", "<cmd>lua require('crates').reload()<CR>", "Reload")
					nmap("<leader>Cv", "<cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions")
					nmap("<leader>Cf", "<cmd>lua require('crates').show_features_popup()<CR>", "Show Features")
					nmap("<leader>Cd", "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies Pop")
					nmap("<leader>Cu", "<cmd>lua require('crates').update_crate()<CR>", "Update Crate")
					nmap("<leader>Ca", "<cmd>lua require('crates').update_all_crates()<CR>", "Update All Crates")
					nmap("<leader>CU", "<cmd>lua require('crates').upgrade_crate<CR>", "Upgrade Crate")
					nmap("<leader>CA", "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", "Upgrade All Crates")
					nmap("<leader>CH", "<cmd>lua require('crates').open_homepage()<CR>", "Open Homepage")
					nmap("<leader>CR", "<cmd>lua require('crates').open_repository()<CR>", "Open Repository")
					nmap("<leader>CD", "<cmd>lua require('crates').open_documentation()<CR>", "Open Documentation")
					nmap("<leader>CC", "<cmd>lua require('crates').open_crates_io()<CR>", "Open Crate.io")
				end,
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
				popup = {
					autofocus = true,
					border = "rounded",
				},
			}
		end,
	},
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup()
	-- 	end
	-- },
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require "fidget".setup {}
		end
	}
}