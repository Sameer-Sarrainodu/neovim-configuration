vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 🌟 Bootstrap Lazy.nvim inside init.lua (No separate lazy.lua file)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 🌟 Setup Lazy.nvim Plugin Manager
require("lazy").setup("plugins")

-- 🌟 Load Configs from lua/config/
require("config.options")  -- Loads Neovim options
require("config.keymaps")  -- Loads keymaps
require("config.autocmds") -- Loads autocommands
