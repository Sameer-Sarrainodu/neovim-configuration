-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.winblend = 0 -- or keep it below 10

-----------neoterm-----------

-- Terminal settings
vim.opt.termguicolors = true -- Enable true color support in terminals

-- Open new split windows above the current window by default
vim.opt.splitbelow = true

-- Set the height of terminal windows (adjust if necessary)
vim.g.neoterm_size = 20 -- Height of the terminal window

-- Enable the terminal buffer to automatically scroll as new output is added
vim.g.neoterm_autoscroll = 1

-- Customize how the terminal behaves when switching between windows
vim.g.neoterm_default_mod = "toggle" -- Toggle terminal mode (opens and closes with the same key)

-- Optional: Allow for smooth switching between terminal and other windows
vim.opt.hidden = true
vim.opt.scrolloff = 8 -- Always show some context above/below the cursor

--------themery---------------
-- Load last used theme
local ok, _ = pcall(vim.cmd, "colorscheme " .. vim.g.colors_name)
if not ok then
	vim.cmd("colorscheme catppuccin-mocha") -- Fallback theme
end
