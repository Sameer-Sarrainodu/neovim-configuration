return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard", -- "hard", "soft", "medium"
				transparent_mode = false, -- Set to true for transparency
				overrides = {
					-- Prevent Gruvbox from overriding Lualine
					StatusLine = { link = "Normal" },
					StatusLineNC = { link = "Normal" },
				},
			})
		end,
	},
}
