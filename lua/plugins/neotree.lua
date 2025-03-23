return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Optional, for icons
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- Change from `follow_current_file = true` to this
				},
				filtered_items = {
					visible = true, -- Show hidden files
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			window = {
				width = 30,
				mappings = {
					["<space>"] = "none",
				},
			},
		})
	end,
}
