local overrides = require("custom.plugins.overrides")

return {
	-- multicursors
	["mg979/vim-visual-multi"] = {},

	-- tmux-navigator
	["christoomey/vim-tmux-navigator"] = {},

	-- replace without override buffer
	["vim-scripts/ReplaceWithRegister"] = {},

	-- complete other plugins
	["tpope/vim-repeat"] = {},

	-- better buffer delete
	["famiu/bufdelete.nvim"] = {},

	-- surround
	["tpope/vim-surround"] = {},

	-- search and replace
	["nvim-pack/nvim-spectre"] = {},

	-- git view diff
	["sindrets/diffview.nvim"] = {
		requires = "nvim-lua/plenary.nvim",
	},

	-- markdown-preview
	["iamcco/markdown-preview.nvim"] = {
		ft = { "markdown" },
		run = "cd app && yarn install",
	},

	-- bufferline
	["akinsho/bufferline.nvim"] = {
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("custom.plugins.bufferline")
		end,
	},

	-- create indices for language programming
	["preservim/tagbar"] = {},

	-- parameters hings
	["ray-x/lsp_signature.nvim"] = {},

	-- use lazy git inner nvim
	["kdheepak/lazygit.nvim"] = {},

	-- comments for react
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},

	-- keep the context
	["nvim-treesitter/nvim-treesitter-context"] = {},

	-- highlights context under cursor
	["RRethy/vim-illuminate"] = {
		config = function()
			require("custom.plugins.illuminate")
		end,
	},

	-- highlights git conflicts
	["akinsho/git-conflict.nvim"] = {
		config = function()
			require("custom.plugins.git-conflict")
		end,
	},

	-- bottom panel for errors and warnings
	["folke/trouble.nvim"] = {
		config = function()
			require("custom.plugins.trouble")
		end,
	},

	-- todo comments
	["folke/todo-comments.nvim"] = {
		config = function()
			require("custom.plugins.todo-comments")
		end,
	},

	-- move around
	["phaazon/hop.nvim"] = {
		config = function()
			require("custom.plugins.hop")
		end,
	},

	-- ts auto tag
	["windwp/nvim-ts-autotag"] = {
		ft = { "html", "javascriptreact" },
		after = "nvim-treesitter",
		config = function()
			require("custom.plugins.ts-autotag")
		end,
	},

	-- harpoon
	["ThePrimeagen/harpoon"] = {
		config = function()
			require("custom.plugins.harpoon")
		end,
	},

	-- transparent nvim
	["xiyaowong/nvim-transparent"] = {
		enable = true, -- boolean: enable transparent
		extra_groups = {
			"BufferLineTabClose",
			"BufferlineBufferSelected",
			"BufferLineFill",
			"BufferLineBackground",
			"BufferLineSeparator",
			"BufferLineIndicatorSelected",
			"BufferTab",
			"NvimTreeNormal",
		},
		exclude = {},
	},

	-- fold code
	["kevinhwang91/nvim-ufo"] = {
		requires = "kevinhwang91/promise-async",
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = ("  %d "):format((endLnum - lnum) + 1)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
				fold_virt_text_handler = handler,
			})
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
			vim.keymap.set("n", "K", function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					-- choose one of coc.nvim and nvim lsp
					vim.lsp.buf.hover()
				end
			end)
		end,
	},

	-- status bar
	["nvim-lualine/lualine.nvim"] = {
		config = function()
			require("custom.plugins.lualine")
		end,
	},

	-- improve code actions menu
	["weilbith/nvim-code-action-menu"] = {
		cmd = "CodeActionMenu",
	},

	-- override plugin configs
	["nvim-telescope/telescope.nvim"] = {
		override_options = overrides.telescope,
	},

	-- commnet by context
	["numToStr/Comment.nvim"] = {
		override_options = overrides.comment,
	},

	-- enable highlights
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	-- packet manager
	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	-- file explorer
	["nvim-tree/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- default plugins
	-- Override plugin definition options
	["NvChad/ui"] = {
		override_options = overrides.ui,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		override_options = overrides.blankline,
	},

	-- language server configs
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- Install a plugin
	["max397574/better-escape.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- remove plugin
	-- ["hrsh7th/cmp-path"] = false,
}
