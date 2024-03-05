local wezterm = require("wezterm")

local config = {
	color_scheme = "Atelier Dune (base16)",
	window_background_opacity = 0.80,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono"),
	font_size = 18.0,
	native_macos_fullscreen_mode = true,
	window_padding = {
		left = 15,
		right = 15,
		top = 20,
		bottom = 0,
	},
}

return config
