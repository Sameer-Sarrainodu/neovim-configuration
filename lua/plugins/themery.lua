return {
	"zaldih/themery.nvim",
	priority = 1000,
	config = function()
		require("themery").setup({
			themes = {
				"gruvbox-material",
				"tokyonight",
				"catppuccin",
				"everforest",
				"rose-pine",
				"nord",
				"onedark",
				"everforest",
			}, -- Add your installed themes here
			themeConfigFile = nil, -- Remove this because it's deprecated
			livePreview = true, -- Preview theme before applying
		})
	end,
}
