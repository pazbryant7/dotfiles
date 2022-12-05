-- basic config
local opt = vim.opt
opt.relativenumber = false
opt.number = false
opt.swapfile = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = false
opt.numberwidth = 1
opt.smarttab = true
opt.fileencoding = 'utf-8'
opt.termguicolors = true
opt.smartcase = true
opt.guifont = { 'Maple Mono NF' }
opt.cmdheight = 0
opt.pumheight = 10
opt.showmode = false
opt.showcmd = false
opt.undofile = true -- enable persistent undo
opt.updatetime = 100
opt.spell = false
opt.spelllang = { 'en_us', 'es_mx' }
opt.guicursor = vim.o.guicursor .. ',i:ver25-CursorInsert'

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap(
  'i',
  '<C-CR>',
  'copilot#Accept("<CR>")',
  { silent = true, expr = true }
)

-- diagnostics
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = 'always',
  },
})
