---@diagnostic disable: unused-local
local wezterm = require("wezterm")

local bindings = require("bindings")
local hyperlink_rules = require("hiperlinks")

local color_scheme = "Catppuccin Latte"

return {
	default_cwd = "/usr/bin/env zsh",

	freetype_load_target = "Light",

	cell_width = 1,

	font = wezterm.font_with_fallback({
		{
			family = "Maple Mono",
			harfbuzz_features = {
				"cv01=1",
				"cv02=1",
				"cv04=1",
				"ss01=1",
				"ss02=1",
				"ss03=1",
				"ss04=1",
				"ss05=1",
			},
		},
		{ family = "Symbols Nerd Font Mono", scale = 0.80 },
		"Maple Mono SC NF",
		"Noto Color Emoji",
		"JetBrains Mono",

		-- icons
		"Font Awesome 6 Pro Solid",
		"MesloLGSDZ Nerd Font Mono",
	}),

	font_size = 9.5,
	allow_square_glyphs_to_overflow_width = "Never",

	color_scheme = color_scheme,

	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 15,
	},

	window_background_opacity = 1,
	window_decorations = "NONE",
	window_close_confirmation = "NeverPrompt",

	scrollback_lines = 5000,
	pane_focus_follows_mouse = true,

	enable_tab_bar = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = true,

	hyperlink_rules = hyperlink_rules,

	disable_default_key_bindings = true,
	leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = bindings,
}
