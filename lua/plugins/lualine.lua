return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure icons are available
	config = function()
		local lualine_theme = "powerline" -- Set your desired theme (unchanged by Themery)

		require("lualine").setup({
			options = {
				theme = lualine_theme, -- This prevents Themery from changing Lualine
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
		})

		-- Prevent Themery from modifying Lualine when switching themes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				require("lualine").setup({
					options = { theme = lualine_theme },
				})
			end,
		})
	end,
}
