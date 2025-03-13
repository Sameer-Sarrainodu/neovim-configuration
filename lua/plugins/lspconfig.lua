return {
	-- Mason: LSP Installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSPConfig: Bridges Mason & lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "pylsp", "lua_ls" }, -- Auto-install LSPs
				automatic_installation = true, -- Enable automatic LSP installation
			})
		end,
	},

	-- Neovim LSPConfig: Core LSP setup
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local nvim_lsp = require("lspconfig")

			-- Extend LSP capabilities for autocompletion
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- Python LSP Setup (pylsp)
			nvim_lsp.pylsp.setup({
				capabilities = lspconfig_defaults.capabilities,
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W391" }, -- Ignore trailing blank line warning
								maxLineLength = 100, -- Set max line length to 100
							},
							flake8 = { enabled = true }, -- Enable flake8 linting
							pylint = { enabled = true }, -- Enable pylint
						},
					},
				},
			})

			-- Lua LSP Setup (lua_ls)
			nvim_lsp.lua_ls.setup({
				capabilities = lspconfig_defaults.capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } }, -- Recognize `vim` as a global variable
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					},
				},
			})
		end,
	},

	-- Autocompletion setup (nvim-cmp + LuaSnip + VSCode snippets)
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP autocompletion
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-cmdline", -- Command-line completions
			"rafamadriz/friendly-snippets", -- VSCode-style snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load VSCode-style snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Use LuaSnip for snippets
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-Space>"] = function()
						if cmp.visible() then
							cmp.abort() -- Close if visible
						else
							cmp.complete() -- Open if not visible
						end
					end,
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<Tab>"] = cmp.mapping.select_next_item(), -- Alternative for next
					["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Alternative for prev
					["<C-j>"] = cmp.mapping.select_next_item(), -- Move down
					["<C-k>"] = cmp.mapping.select_prev_item(), -- Move up
				}),
				sources = {
					{ name = "nvim_lsp" }, -- LSP-powered completions
					{ name = "luasnip" }, -- Snippets from LuaSnip
					{ name = "path" }, -- File path completions
					{ name = "buffer" }, -- Buffer word completions
				},
				window = {
					completion = cmp.config.window.bordered(), -- Bordered completion menu
					documentation = cmp.config.window.bordered(), -- Bordered documentation
				},
				formatting = {
					format = function(entry, vim_item)
						-- Add source name in completion menu
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				completion = {
					completeopt = "menu,menuone,noselect",
				},
			})
		end,
	},
	-- Function to check if LSP is attached and print confirmation
	lsp_confirmation = function()
		-- Check if an LSP is attached to the current buffer
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			print("LSP Attached: ❌ No")
		else
			print("LSP Attached: ✅ Yes")
		end
	end,
}
