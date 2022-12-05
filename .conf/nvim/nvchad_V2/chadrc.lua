---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require('custom.highlights')

M.ui = {
  theme_toggle = { 'github_light', 'github_light' },
  theme = 'github_light',
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = false,

  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = false,
    overriden_modules = nil,
  },

  cmp = {
    icons = true,
    lspkind_text = true,
    style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
    disabled = false,
  },

  lsp = {
    signature = {
      disabled = false,
      silent = true,
    },
  },
}

M.plugins = 'custom.plugins'

-- check core.mappings for table structure
M.mappings = require('custom.mappings')

return M
