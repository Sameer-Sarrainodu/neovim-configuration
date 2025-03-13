return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night", -- night, storm, moon, or day
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
