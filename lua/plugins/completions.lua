return {
	-- Mason ensures required formatters & linters are installed
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pylsp" }, -- Auto-install LSPs
				automatic_installation = true,
			})
		end,
	},
	-- Formatting with conform.nvim
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "black", "isort" }, -- Use Black & Isort for Python
					lua = { "stylua" }, -- Use Stylua for Lua
				},
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
			})
		end,
	},
	-- Linting with nvim-lint
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				python = { "pylint", "flake8" }, -- Use Pylint & Flake8 for Python
				lua = { "luacheck" }, -- Use Luacheck for Lua
			}

			-- Auto-run linting on file save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})

			-- Ensure diagnostics are displayed properly
			vim.diagnostic.config({
				virtual_text = true, -- Show inline errors
				signs = true, -- Show error signs in gutter
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
