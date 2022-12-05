local M = {
	new_hlgroups = {
		FoldColumn = {
			bg = "none",
		},
		StatusLine = {
			fg = "none",
			bg = "none",
		},
		KeyMenuFloatBorder = {
			fg = "none",
			bg = "none",
			bold = true,
		},
		BufferTabpageFill = {
			fg = "none",
			bg = "none",
		},
		BufferInactive = {
			fg = "none",
			bg = "none",
		},
		BufferInactiveSign = {
			fg = "none",
			bg = "none",
		},
		CmpDocBorder = {
			fg = "none",
			bg = "none",
		},
	},

	overridden_hlgroups = {
		CursorLine = {
			bg = "none",
		},
		CmpDocBorder = {
			fg = "none",
			bg = "none",
		},
		KeyMenuFloatBorder = {
			fg = "none",
			bg = "none",
		},
		StatusLine = {
			fg = "none",
			bg = "none",
		},
		SpellBad = {
			strikethrough = true,
			fg = "red",
			undercurl = false,
		},
		SpellCap = {
			strikethrough = true,
			fg = "#d79921",
			undercurl = false,
		},
		SpellRare = {
			strikethrough = true,
			fg = "#88c0d0",
			undercurl = false,
		},
		SpellLocal = {
			strikethrough = true,
			fg = "#b48ead",
			undercurl = false,
		},
	},
}

return M
