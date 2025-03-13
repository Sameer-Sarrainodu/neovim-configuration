-- ==================== Keymaps Configuration ====================
local vim = vim
-- ==================== General Keymaps ====================
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" }) -- Save File

-- ==================== Neo-tree ====================
vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- ==================== Telescope (Fuzzy Finder) ====================
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "Find Help" })
vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<CR>", { desc = "Pick Colorscheme" })
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>ss", "<cmd>Telescope grep_string<CR>", { desc = "Find Word Under Cursor" })
vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>sm", "<cmd>Telescope man_pages<CR>", { desc = "Find Man Pages" })

-- ==================== LeaderF (Alternative Fuzzy Finder) ====================
vim.keymap.set("n", "<leader>lf", ":Leaderf file<CR>", { desc = "Find Files (LeaderF)" })

-- ==================== Bufferline (Buffer Navigation) ====================
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })

-- ==================== Terminal ====================
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- ==================== Markdown ====================
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

-- ==================== Hop.nvim (Motion Navigation) ====================
vim.keymap.set("n", "<leader>hw", ":HopWord<CR>", { desc = "Hop to Word" })
vim.keymap.set("n", "<leader>hl", ":HopLine<CR>", { desc = "Hop to Line" })

-- ==================== Better Escape (jj to Escape) ====================
-- No keymaps needed, works automatically.

-- ==================== Autopairs ====================
-- No keymaps needed, works automatically.

-- ==================== Whick-key.nvim (Popup Keybinding Guide) ====================
-- No keymaps needed, works automatically.

-- ==================== Diagnostics ====================
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })

-- ==================== Linting ====================
vim.keymap.set("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Run Linter" })

-- ==================== Toggle Inline Diagnostics ====================
local diagnostics_enabled = true
vim.keymap.set("n", "<leader>td", function()
	diagnostics_enabled = not diagnostics_enabled
	vim.diagnostic.config({
		virtual_text = diagnostics_enabled,
		signs = true,
		update_in_insert = false,
		severity_sort = true,
	})
	print("Inline Diagnostics " .. (diagnostics_enabled and "Enabled" or "Disabled"))
end, { desc = "Toggle Inline Errors" })

-- ==================== Toggle Format-on-Save ====================
local format_on_save = true
vim.keymap.set("n", "<leader>tf", function()
	format_on_save = not format_on_save
	if format_on_save then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format()
			end,
			group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
		})
	else
		vim.api.nvim_del_augroup_by_name("FormatOnSave")
	end
	print("Format on Save " .. (format_on_save and "Enabled" or "Disabled"))
end, { desc = "Toggle Format on Save" })

vim.keymap.set("n", "<leader>aa", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Buffer" })
-- ==================== LSP Keymaps ====================
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local buf = event.buf
		local function buf_keymap(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, noremap = true, silent = true, desc = desc })
		end

		buf_keymap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
		buf_keymap("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
		buf_keymap("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
		buf_keymap("n", "gr", vim.lsp.buf.references, "Find References")
		buf_keymap("n", "K", vim.lsp.buf.hover, "Show Hover Info")
		buf_keymap("n", "<C-k>", vim.lsp.buf.signature_help, "Show Signature Help")
		buf_keymap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
		buf_keymap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
		buf_keymap("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, "Format Code")
	end,
})

-- ==================== Debugger (DAP) ====================
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open Debug REPL" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })

-- ==========================themery==========================
vim.keymap.set("n", "<leader>st", "<cmd>Themery<CR>", { desc = "Change Theme" })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "themery",
	callback = function()
		local opts = { buffer = true, noremap = true, silent = true }
		vim.keymap.set("n", "<C-j>", "j", opts) -- Move down in Themery list
		vim.keymap.set("n", "<C-k>", "k", opts) -- Move up in Themery list
	end,
})

-- =============================disable space to move==============================
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- ===============================vimsurround vimrepeat=======================
-- lua/config/keymaps.lua

-- vim-surround key mappings
-- These are the default keymaps for vim-surround. You can customize them as you like.
vim.api.nvim_set_keymap("n", "ds", "<Plug>Dsurround", { noremap = false })
vim.api.nvim_set_keymap("n", "cs", "<Plug>Csurround", { noremap = false })
vim.api.nvim_set_keymap("n", "ys", "<Plug>Ysurround", { noremap = false })
vim.api.nvim_set_keymap("x", "S", "<Plug>VSurround", { noremap = false })

-- vim-repeat key mappings
-- vim-repeat automatically makes most commands repeatable with `.`
-- This plugin makes commands more repeatable without requiring any explicit keymap configuration.

-- You can also add custom repeat behavior if needed, but default behavior is generally enough.
