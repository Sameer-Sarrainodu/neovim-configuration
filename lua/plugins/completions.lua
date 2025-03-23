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
				python = { "flake8" }, -- Use Pylint & Flake8 for Python
				lua = { "luacheck" }, -- Use Luacheck for Lua
			}
		end,
	},
}
