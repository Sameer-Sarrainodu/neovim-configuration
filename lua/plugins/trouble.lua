return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional, for icons
	},
	lazy = true,
	cmd = "Trouble", -- Load on :Trouble command
	opts = {
		auto_preview = false,
		modes = {
			diagnostics = {
				sort = { "severity", "pos", "filename", "message" },
			},
			snacks = {
				sort = { "pos", "filename", "severity", "message" },
			},
			snacks_files = {
				sort = { "pos", "filename", "severity", "message" },
			},
			quickfix = {
				sort = { "pos", "filename", "severity", "message" },
			},
			loclist = {
				sort = { "pos", "filename", "severity", "message" },
			},
		},
	},
}
