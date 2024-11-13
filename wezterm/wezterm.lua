local wezterm = require("wezterm")

local config = {
	default_prog = { "/opt/homebrew/bin/fish" },
	max_fps = 120,
	color_scheme = "Wez",
	window_background_opacity = 0.80,
	macos_window_background_blur = 40, -- Set the blur radius
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono"),
	font_size = 18.0,
	native_macos_fullscreen_mode = true,
	window_padding = {
		left = 4,
		right = 0,
		top = 6,
		bottom = 0,
	},
}

return config
