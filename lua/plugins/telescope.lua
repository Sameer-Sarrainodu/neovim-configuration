return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make", -- Automatically runs `make` after installation
			},
			"nvim-telescope/telescope-ui-select.nvim",
			"folke/trouble.nvim", -- Added Trouble dependency
		},
		config = function()
			local telescope = require("telescope")
			local trouble = require("trouble.sources.telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = "🔍 ",
					selection_caret = "➜ ",
					layout_config = { horizontal = { preview_width = 0.5 } },
					sorting_strategy = "ascending",
					winblend = 10, -- Transparency effect
					mappings = {
						i = {
							["<c-t>"] = trouble.open, -- Open search results in Trouble
						},
						n = {
							["<c-t>"] = trouble.open,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Load extensions
			pcall(telescope.load_extension, "fzf") -- Prevent error if FZF is not built
			pcall(telescope.load_extension, "ui-select")
		end,
	},
}
