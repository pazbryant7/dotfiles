-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
  Comment = {
    italic = true,
  },
  SpellBad = {
    strikethrough = true,
    fg = 'red',
    undercurl = false,
  },
  SpellCap = {
    strikethrough = true,
    fg = '#d79921',
    undercurl = false,
  },
  SpellRare = {
    strikethrough = true,
    fg = '#88c0d0',
    undercurl = false,
  },
  SpellLocal = {
    strikethrough = true,
    fg = '#b48ead',
    undercurl = false,
  },
  NormalFloat = {
    bg = 'none',
  },
  FloatBorder = {
    fg = '#DCDCDC',
  },
  LspSignatureActiveParameter = {
    bg = 'none',
    fg = '#0f0f0f',
  },
  IndentBlanklineContextStart = {
    bg = 'none',
  },
}

---@type HLTable
M.add = {
  LspSignatureActiveParameter = {
    bg = 'none',
    fg = '#0f0f0f',
  },
}

return M
