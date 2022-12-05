local M = {}

M.disabled = {
	n = {
		-- nvimtree
		["<C-n>"] = "",

		-- comment
		["<leader>/"] = "",

		-- lsp references
		["gr"] = "",
	},

	i = {
		-- navigate insert mode
		["<C-h>"] = "",
		["<C-l>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",
	},
}

M.marks = {
	n = {
		["<leader>ml"] = { "<cmd> Telescope marks <Cr>", "   List marks" },
		["<leader>md"] = { ":delm! | delm A-Z0-9", "Delete marks" },
	},
}

M.spell = {
	n = {
		["<leader>z"] = { "<cmd> Telescope spell_suggest <CR>", "   List spell suggest" },
		["<leader>sn"] = { "<cmd> set nospell <CR>", "set no spell" },
		["<leader>sp"] = { "<cmd> set spell <CR>", "set spell" },
	},
}

M.diffview = {
	n = {
		["<leader>gv"] = { "<cmd> DiffviewOpen <CR>", "open diffview" },
	},
}

M.tabclose = {
	n = {
		["<leader>tc"] = { "<cmd> tabclose <CR>", "close diffview" },
	},
}

M.spectre = {
	n = {
		["<leader>S"] = {
			function()
				require("spectre").open()
			end,
		},
		["<leader>fs"] = {
			function()
				require("spectre").open_file_search()
			end,
		},
	},
}

M.buffers = {
	n = {
		["<TAB>"] = { "<cmd> bnext <CR>", "goto next buffer" },
		["<S-Tab>"] = { "<cmd> bprevious <CR>", "goto prev buffer" },
		["<A-w>"] = { "<cmd> Bwipeout <CR>", "close buffer" },
	},

	i = {
		["<A-w>"] = { "<cmd> Bwipeout <CR>", "close buffer" },
	},
}

M.lspconfig = {
	n = {
		["<leader>ca"] = { "<cmd> CodeActionMenu <CR>", "Open code action menu" },
	},
}

M.mdpreview = {
	n = {
		["<leader>pw"] = { "<cmd> MarkdownPreview <CR>", "Open Markdown Preview" },
		["<leader>px"] = { "<cmd> MarkdownPreviewStop <CR>", "Close Markdown Preview" },
	},

	i = {
		["<A-p>"] = { "<cmd> MarkdownPreview<CR>" },
		["<A-x>"] = { "<cmd> MarkdownPreviewStop<CR>" },
	},
}

M.navigation = {
	n = {
		["H"] = { "^", "beginning of line" },
		["L"] = { "$", "end of line" },
	},
}

M.lazygit = {
	n = {
		["<leader>gg"] = { "<cmd> LazyGit <Cr>", "open lazygit" },
	},
}

M.general = {
	i = {
		-- save
		["<C-s>"] = { "<cmd> w <CR>", "save file" },
	},
}

M.trouble = {
	n = {
		["<leader>d"] = { "<cmd> TroubleToggle <Cr>", "toggle trouble" },
	},
}

M.Telescope = {
	n = {
		["<leader>ft"] = { "<cmd> TodoTelescope <Cr>", "   Open Todo Telescope" },
	},
}

M.hop = {
	n = {
		-- hop plugin
		["<leader>ha"] = { "<cmd> HopAnywhere <CR>", "hope anywhere" },
		["<leader>hl"] = { "<cmd> HopLine <CR>", "hope line" },
		["<leader>hw"] = { "<cmd> HopWord <CR>", "hope word" },
		["<leader>h"] = { "<cmd> HopWordCurrentLine <CR>", "Hop word current line" },
	},
}

M.harpoon = {
	n = {
		["<leader>ss"] = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
		},
		["<leader>sa"] = {
			function()
				require("harpoon.mark").add_file()
			end,
		},
		["<leader>1"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
		},
		["<leader>2"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
		},
		["<leader>3"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
		},
		["<leader>4"] = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
		},
		["<leader>j"] = {
			function()
				require("harpoon.ui").nav_prev()
			end,
		},
		["<leader>k"] = {
			function()
				require("harpoon.ui").nav_next()
			end,
		},
	},
}

M.PreventArrow = {
	n = {
		["<up>"] = {
			"<nop>",
			"Don't use arrow",
		},
		["<down>"] = {
			"<nop>",
			"Don't use arrow",
		},
		["<right>"] = {
			"<nop>",
			"Don't use arrow",
		},
		["<left>"] = {
			"<nop>",
			"Don't use arrow",
		},
	},
}

M.nvimtree = {
	n = {
		-- toggle
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
	},
}

return M
