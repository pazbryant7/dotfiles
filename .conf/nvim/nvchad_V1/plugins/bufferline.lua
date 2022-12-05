local present, bufferline = pcall(require, "bufferline")

if not present then
	return
end

local config = {
	options = {
		diagnostics = false,
		diagnostics_update_in_insert = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				text_align = "left",
				separator = true,
			},
		},
	},
	highlights = {
		background = {
			bg = "NONE",
		},
		fill = {
			bg = "NONE",
		},
		close_button = {
			bg = "NONE",
		},
		separator_visible = {
			bg = "NONE",
		},
		tab_close = {
			bg = "NONE",
		},
	},
}

bufferline.setup(config)
