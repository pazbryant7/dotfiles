local wezterm = require("wezterm")
local wezterm_action = wezterm.action

return {

	-- leader key
	{ key = "b", mods = "LEADER|CTRL", action = wezterm_action({ SendString = "\x01" }) },

	-- panels
	{ key = "x", mods = "LEADER", action = wezterm_action({ CloseCurrentPane = { confirm = true } }) },
	{ key = '"', mods = "LEADER|SHIFT", action = wezterm_action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "%", mods = "LEADER", action = wezterm_action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	-- panels
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "h", mods = "LEADER", action = wezterm_action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm_action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm_action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm_action({ ActivatePaneDirection = "Right" }) },
	{ key = "o", mods = "LEADER", action = wezterm_action({ ActivatePaneDirection = "Next" }) },
	{ key = ";", mods = "LEADER", action = wezterm_action({ ActivatePaneDirection = "Prev" }) },
	{ key = "h", mods = "LEADER|SHIFT", action = wezterm_action({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "j", mods = "LEADER|SHIFT", action = wezterm_action({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "k", mods = "LEADER|SHIFT", action = wezterm_action({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "l", mods = "LEADER|SHIFT", action = wezterm_action({ AdjustPaneSize = { "Right", 5 } }) },

	-- tabs
	{ key = "c", mods = "LEADER", action = wezterm_action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "n", mods = "LEADER", action = wezterm_action.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = wezterm_action.ActivateTabRelative(-1) },
	{ key = "1", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER|SHIFT", action = wezterm_action({ ActivateTab = 8 }) },
	{ key = "x", mods = "LEADER|SHIFT", action = wezterm_action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "[", mods = "LEADER", action = wezterm_action.ActivateCopyMode },

	-- other tmux configurations
	{
		key = "w",
		mods = "LEADER",
		action = wezterm_action.ShowTabNavigator,
	},

	{
		key = ",",
		mods = "LEADER",
		action = wezterm_action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	{
		key = "{",
		mods = "LEADER",
		action = wezterm_action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }),
	},

	-- Default keybindings
	{ key = "Enter", mods = "SHIFT", action = wezterm_action.SendString("\x1b[13;2u") },
	{ key = "=", mods = "CTRL", action = wezterm_action.ResetFontSize },
	{ key = "+", mods = "CTRL|SHIFT", action = wezterm_action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm_action.DecreaseFontSize },
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm_action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm_action.PasteFrom("Clipboard") },
}
