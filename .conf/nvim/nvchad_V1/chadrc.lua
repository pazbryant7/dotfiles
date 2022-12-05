local M = {}

-- Path to overriding theme and highlights files
local themes = require("custom.overridden_themes")
local highlights = require("custom.highlights")

M.ui = {
	theme = "catppuccin_latte",
	theme_toggle = { "nord", "onenord" },

	changed_themes = themes,

	hl_override = highlights.overridden_hlgroups,
	hl_add = highlights.new_hlgroups,
	-- transparency = true,
}

M.plugins = require("custom.plugins")

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
