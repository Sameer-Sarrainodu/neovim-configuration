return {
	"Yggdroot/LeaderF",
	build = ":LeaderfInstallCExtension",
	config = function()
		vim.g.Lf_ShortcutF = "<leader>ff" -- Set shortcut to <leader>ff
	end,
}
