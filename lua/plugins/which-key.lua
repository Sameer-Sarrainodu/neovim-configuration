return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({
			plugins = { spelling = { enabled = false } },
			win = { border = "single" },
			delay = 0, -- No delay for leader key popups
			timeout = true, -- Ensure timeout works properly
			timeoutlen = 500, -- Default timeout length (adjust as needed)
		})
	end,
}
