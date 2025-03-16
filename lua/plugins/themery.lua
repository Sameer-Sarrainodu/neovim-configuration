return {
	{
		"folke/themery.nvim",
		config = function()
			local theme_file = vim.fn.stdpath("config") .. "/themery.json"

			require("themery").setup({
				themes = { "tokyonight", "catppuccin", "gruvbox", "rose-pine", "nord", "onedark", "everforest" }, -- Add your themes here
				live_preview = true, -- Enables live preview
				theme_config = function(theme)
					vim.cmd.colorscheme(theme)
				end,
				save_on_quit = true, -- Ensures theme is saved on quit
				save_path = theme_file, -- Path to save the selected theme
			})

			-- 🔥 Load the last saved theme, or fallback to 'tokyonight'
			local function load_last_theme()
				local f = io.open(theme_file, "r")
				if f then
					local last_theme = f:read("*a"):match('"([%w%-_]+)"') -- Extract theme name from JSON
					f:close()
					if last_theme then
						vim.cmd.colorscheme(last_theme)
						return
					end
				end
				vim.cmd.colorscheme("tokyonight") -- Fallback to tokyonight if no saved theme
			end

			load_last_theme()
		end,
	},
}
