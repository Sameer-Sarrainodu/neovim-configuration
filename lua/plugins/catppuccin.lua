return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Ensure it loads first
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- You can change to "latte", "frappe", "macchiato"
                integrations = {
                    treesitter = true,
                    nvimtree = true,
                    telescope = true,
                    cmp = true,
                    lsp_saga = true,
                },
            })

            -- Set colorscheme
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
