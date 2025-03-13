
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make" -- Automatically runs `make` after installation
      },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "➜ ",
          layout_config = { horizontal = { preview_width = 0.5 } },
          sorting_strategy = "ascending",
          winblend = 10, -- Transparency effect
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
  }
}
