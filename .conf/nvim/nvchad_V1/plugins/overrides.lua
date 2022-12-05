local M = {}

M.blankline = {
	indentLine_enabled = 1,
	filetype_exclude = {
		"help",
		"terminal",
		"alpha",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"mason",
	},
}

M.treesitter = {
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"gitignore",
		"css",
		"html",
		"markdown",
		"lua",
		"vim",
		"python",
		"rust",
		"scss",
		"gitignore",
		"graphql",
		"prisma",
		"regex",
		"sql",
		"yaml",
		"dockerfile",
		"toml",
	},
	playground = {
		enable = true,
	},
	auto_install = true,
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	additional_vim_regex_highlighting = false,
}

M.comment = {
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

M.ui = {
	statusline = {
		separator_style = "default", -- default/round/block/arrow
		overriden_modules = function()
			local X = {}
			X.modes = function()
				return ""
			end
			X.fileInfo = function()
				return ""
			end

			X.git = function()
				return ""
			end
			X.LSP_progress = function()
				return ""
			end
			X.LSP_Diagnostics = function()
				return ""
			end
			X.LSP_status = function()
				return ""
			end
			X.cwd = function()
				return ""
			end

			X.cursor_position = function()
				return ""
			end
			return X
		end,
	},

	tabufline = {
		enabled = false,
	},
}

M.mason = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua",

		-- javascript/typescript
		"typescript-language-server",
		"emmet-ls",

		-- python
		"pyright",
		"blue",
		"isort",

		-- rust
		"rust-analyzer",
		"rustfmt",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"json-lsp",
		"jsonlint",
		"eslint_d",

		-- formatter
		"prettier",

		-- markdown
		"markdownlint",
		"marksman",
		"alex",
	},
}

M.telescope = {
	vimgrep_arguments = { "-u" },
	defaults = {
		file_ignore_patterns = { "node_modules", ".docker", ".git" },
		extensions_list = { "themes", "terms", "harpoon" },
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},
	view = {
		side = "left",
		width = 70,
		hide_root_folder = true,
		cursorline = false,
	},
	renderer = {
		highlight_opened_files = "name",
		group_empty = true,
		indent_width = 4,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	hijack_unnamed_buffer_when_opening = true,
	hijack_cursor = true,
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			error = "",
		},
	},
	sync_root_with_cwd = true,
	tab = {
		sync = {
			open = true,
			close = true,
		},
	},
}

return M
