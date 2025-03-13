return {
	-- Install nvim-dap and UI
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- Lua Debug Adapter (for Neovim)
			dap.adapters.nlua = function(callback, _)
				local server = require("osv").launch({ port = 8086 })
				callback({ type = "server", host = "127.0.0.1", port = 8086 })
			end

			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			-- Python Debugging (using debugpy)
			dap.adapters.python = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return "python" -- Change if using virtualenv
					end,
				},
			}
		end,
	},

	-- DAP UI for a better debugging experience
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()

			-- Automatically open/close DAP UI when debugging starts/stops
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- Required dependency for dap-ui
	{
		"nvim-neotest/nvim-nio",
	},
}
