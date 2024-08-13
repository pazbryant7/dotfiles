---@diagnostic disable: unused-local
local wezterm = require("wezterm")

local function modify_colorscheme(colorscheme)
	local file_path = os.getenv("HOME") .. "/.config/wezterm/wezterm.lua"
	local _f = assert(io.open(file_path, "r"))
	local data = _f:read("*a")
	_f:close()

	local f = assert(io.open(file_path, "w"))
	data = data:gsub('local color_scheme = "[^%%]-"', ('local color_scheme = "%s"'):format(colorscheme))
	f:write(data)
	f:close()
end

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "Nvim_Colorscheme" then
		overrides.color_scheme = value
		modify_colorscheme(value)
	end
	window:set_config_overrides(overrides)
end)

local color_scheme = "default"

return {
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
		"Maple Mono NF",
		"Noto Color Emoji",
		"JetBrains Mono NF",

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

	enable_tab_bar = false,
	use_fancy_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = false,

	hyperlink_rules = {
		{
			regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
		{
			regex = "\\bfile://\\S*\\b",
			format = "$0",
		},
	},

	disable_default_key_bindings = true,
	keys = {
		{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\x1b[13;2u") },
		{ key = "=", mods = "CTRL", action = wezterm.action.ResetFontSize },
		{ key = "+", mods = "CTRL|SHIFT", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	},
}
