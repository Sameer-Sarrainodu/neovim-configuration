return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "auto", -- auto, main, moon, or dawn
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
