return {
	"goolord/alpha-nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local stats = require("lazy").stats()
		local total_plugins = stats.count
		local startuptime = string.format("%.2f", stats.startuptime)
		local datetime = os.date("%Y-%m-%d %H:%M:%S")

		-- Set dashboard header █   headerheader

		dashboard.section.header.val = {
			"                      .;lxO0KXXXXXKOkoc,.                   ",
			"                   ,xNMMMMMMMMMMMWWWWWWWWKo'                ",
			".                ;XMMMMMWNKOkxxddoddxk0XMMMMXc              ",
			"                xMMMNOl;;,'..       ....':xKMMK.            ",
			"               xMWxc,...  ....    .........,ckMN.           ",
			"              .WW;',          ...,          ',oMx           ",
			"              .Mk ,            ':            '.NX           ",
			"               Wd.'        ███  : ███         ,0X           ",
			"               d0.;        ███  : ███        ,Kk           ",
			"             ..'K:'.       ███  : ███        ':N:.          ",
			"            .. ,., ..  ..    .         . ..  ..;.. ,         ",
			"            '.;;l.   .......................  ,ll.,         ",
			"             . .c       .                     .d;.'         ",
			"              ..,'    '.,,,''.,               ,...          ",
			"                .c,;;,;:.    .c...........   .'.            ",
			"              ;:.    .;       ;     ...     ..              ",
			"            .:.     .,       ,'...''...   ..                ",
			"          .',.      ;        ;     ;  .,...                 ",
			"         ..,.      ;        ,.     ;   ..                   ",
			"         ,.'      '.        ;      ,    :..                 ",
			"         ,.       ,        '.      ;    ;..'.               ",
			"         .'       .       .,      .'    ;...,               ",
			"          ..                      '     ;....,              ",
			"           ,                           .c....'.             ",
			"           ,                           ;;.....'             ",
			"           c.                        .;..;....,             ",
			"          .,.'                     .''...:'''.;             ",
			"           , ..                ..''......;    ,             ",
			"           ..             ...'''.........;    ,             ",
			"             ...        .''..............;    ..            ",
			"                .....,.'.................,.    '            ",
			"                    ......................;    '            ",
			"                    ......................,    .            ",
		}
		-- Dashboard buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
			dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		}

		-- Footer with plugin count and startup time
		dashboard.section.footer.val = {
			"⚡ Neovim loaded " .. total_plugins .. " plugins in " .. startuptime .. "ms",
			"  " .. datetime,
		}

		-- Setup Alpha
		alpha.setup(dashboard.opts)
	end,
}
