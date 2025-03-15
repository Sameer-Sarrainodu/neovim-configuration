return {
	{
		"folke/themery.nvim",
		config = function()
			require("themery").setup({
				themes = {
					"tokyonight",
					"catppuccin",
					"gruvbox-material",
					"rose-pine",
					"onedark",
					"nord",
					"everforest",
				}, -- Add your themes here
				live_preview = true, -- Enables live preview
				theme_config = function(theme)
					vim.cmd.colorscheme(theme)
				end,
				save_on_quit = true, -- Saves the selected theme
				save_path = vim.fn.stdpath("config") .. "/themery.json", -- Path to save the theme
			})

			-- Load last saved theme or default to tokyonight
			local ok, theme_data = pcall(vim.fn.readfile, vim.fn.stdpath("config") .. "/themery.json")
			local last_theme = ok and theme_data[1] or "tokyonight"
			vim.cmd.colorscheme(last_theme)
		end,
	},
}
