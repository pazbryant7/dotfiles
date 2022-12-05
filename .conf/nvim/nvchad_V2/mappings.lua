---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- nvimtree
    ['<C-n>'] = '',
    -- lsp references
    ['gr'] = '',
    -- lsp highlight
    ['<Esc>'] = '',

    -- enable tmuxnavigator
    ['<C-h>'] = '',
    ['<C-l>'] = '',
    ['<C-j>'] = '',
    ['<C-k>'] = '',
  },

  i = {
    -- navigate insert mode
    ['<C-h>'] = '',
    ['<C-l>'] = '',
    ['<C-j>'] = '',
    ['<C-k>'] = '',
  },
}

M.tmuxnavigator = {
  n = {
    ['<C-h'] = {
      '<cmd> LspInfo <CR>',
      'switch window left',
    },
    ['<C-l'] = {
      '<cmd> TmuxNavigateRight <CR>',
      'switch window right',
    },
    ['<C-j'] = {
      '<cmd> TmuxNavigateDown <CR>',
      'switch window down',
    },
    ['<C-k'] = {
      '<cmd> TmuxNavigateUp <CR>',
      'switch window up',
    },
  },
}

M.text = {
  i = {
    -- Move line up and down
    ['<C-Up>'] = { '<cmd> :m-2<CR>', ' Move up' },
    ['<C-Down>'] = { '<cmd> :m+<CR>', ' Move down' },
    -- Navigate
    ['<A-Left>'] = { '<ESC>I', ' Move to beginning of line' },
    ['<A-Right>'] = { '<ESC>A', ' Move to end of line' },
  },

  n = {
    -- Navigate
    ['<A-Left>'] = { '<ESC>_', '󰜲 Move to beginning of line' },
    ['<A-Right>'] = { '<ESC>$', '󰜵 Move to end of line' },
    ['<F3>'] = { 'n', ' Next' },
    ['<S-F3>'] = { 'N', ' Previous' },
    -- Move line up and down
    ['<C-Up>'] = { '<cmd> :m-2<CR>', '󰜸 Move line up' },
    ['<C-Down>'] = { '<cmd> :m+<CR>', '󰜯 Move line down' },
    ['<leader>fm'] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      ' Lsp formatting',
    },
  },

  v = {
    ['<C-Up>'] = {
      ":m'<-2<CR>gv=gv",
      '󰜸 Move selection up',
      opts = { silent = true },
    },
    ['<C-Down>'] = {
      ":m'>+1<CR>gv=gv",
      '󰜯 Move selection down',
      opts = { silent = true },
    },
    ['"'] = { 'xi"<esc>pa"<esc>', '󱀡 Insert double quote' },
    ["'"] = { "xi'<esc>pa'<esc>", '󱀢 Insert single double' },
    ['v['] = { 'xi[<esc>pa]<esc>', '󰅪 Insert [' },
    ['v]'] = { 'xi[<esc>pa]<esc>', '󰅪 Insert ]' },
    ['v{'] = { 'xi{<esc>pa}<esc>', ' Insert {' },
    ['v}'] = { 'xi{<esc>pa}<esc>', ' Insert }' },
    ['('] = { 'xi(<esc>pa)<esc>', '󱃗 Insert (' },
    [')'] = { 'xi(<esc>pa)<esc>', '󱃗 Insert )' },
    -- Indent backward/forward:
    ['<'] = { '<gv', 'ident backward', opts = { silent = false } },
    ['>'] = { '>gv', 'ident forward', opts = { silent = false } },
  },
}

M.general = {
  n = {
    [';'] = { ':', '󰘳 Enter command mode', opts = { nowait = true } },
    ['<leader>q'] = { '<cmd> qa! <CR>', '󰗼 Exit' },
    ['P'] = { '"0p', 'paste last yank' },
    ['<C-tab>'] = { '<cmd> b# <CR>', 'switch to last buffer' },
    ['<leader>ca'] = { '<cmd> CodeActionMenu <CR>', 'CodeActionMenu' },
  },

  i = {
    ['<C-tab>'] = { '<cmd> b# <CR>', 'switch to last buffer' },
  },
}

M.treesitter = {
  n = {
    ['<leader>cu'] = {
      '<cmd> TSHighlightCapturesUnderCursor <CR>',
      'find media',
    },
  },
}

M.spell = {
  n = {
    ['<leader>z'] = {
      '<cmd> Telescope spell_suggest <CR>',
      '   List spell suggest',
    },
    ['<leader>s'] = { '<cmd> set spell! <CR>', '󰓆 toggle spell' },
  },
}

M.diffview = {
  n = {
    ['<leader>gv'] = {
      '<cmd> DiffviewOpen <CR>',
      ' open diffview',
    },
  },
}

M.tabclose = {
  n = {
    ['<leader>tc'] = {
      '<cmd> tabclose <CR>',
      ' close diffview',
    },
  },
}

M.spectre = {
  n = {
    ['<leader>S'] = {
      function()
        require('spectre').open()
      end,
      ' Open spectre',
    },
    ['<leader>fs'] = {
      function()
        require('spectre').open_file_search()
      end,
      '󰈞 find and replace',
    },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    ['<tab>'] = {
      function()
        require('nvchad.tabufline').tabuflineNext()
      end,
      '󰒭 Goto next buffer',
    },

    ['<S-tab>'] = {
      function()
        require('nvchad.tabufline').tabuflinePrev()
      end,
      '󰒭 Goto prev buffer',
    },

    -- close buffer + hide terminal buffer
    ['<A-w>'] = {
      function()
        require('nvchad.tabufline').close_buffer()
      end,
      ' Close buffer',
    },
  },

  i = {
    ['<A-w>'] = {
      function()
        require('nvchad.tabufline').close_buffer()
      end,
      ' Close buffer',
    },
  },
}

M.mdpreview = {
  n = {
    ['<leader>pw'] = {
      '<cmd> MarkdownPreview <CR>',
      ' Open Markdown Preview',
    },
    ['<leader>px'] = {
      '<cmd> MarkdownPreviewStop <CR>',
      ' Close Markdown Preview',
    },
  },
  i = {
    ['<A-p>'] = { '<cmd> MarkdownPreview<CR>', ' Open Markdown Preview' },
    ['<A-x>'] = {
      '<cmd> MarkdownPreviewStop<CR>',
      ' Close Markdown Preview',
    },
  },
}

M.navigation = {
  n = {
    ['H'] = { '^', 'beginning of line' },
    ['L'] = { '$', 'end of line' },
  },
  v = {
    ['H'] = { '^', 'beginning of line' },
    ['L'] = { '$', 'end of line' },
  },
}

M.trouble = {
  n = {
    ['<leader>d'] = {
      '<cmd> TroubleToggle <Cr>',
      ' toggle trouble',
    },
  },
}

M.Telescope = {
  n = {
    ['<leader>ft'] = {
      '<cmd> TodoTelescope <Cr>',
      '   Open Todo Telescope',
    },
    ['<leader>tk'] = {
      '<cmd> Telescope keymaps <Cr>',
      '   Open Telescope keymaps',
    },
  },
}

M.hop = {
  n = {
    ['<leader>ha'] = {
      '<cmd> HopAnywhere <CR>',
      ' hope anywhere',
    },
    ['<leader>hl'] = { '<cmd> HopLine <CR>', ' hope line' },
    ['<leader>hw'] = { '<cmd> HopWord <CR>', ' hope word' },
    ['<leader>h'] = {
      '<cmd> HopWordCurrentLine <CR>',
      ' Hop word current line',
    },
  },
}

M.harpoon = {
  n = {
    ['<leader>ss'] = {
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      'show harpoon',
    },
    ['<leader>sa'] = {
      function()
        require('harpoon.mark').add_file()
      end,
      'add new harpoon',
    },
    ['<leader>1'] = {
      function()
        require('harpoon.ui').nav_file(1)
      end,
      'move to harpoon 1',
    },
    ['<leader>2'] = {
      function()
        require('harpoon.ui').nav_file(2)
      end,
      'move to harpoon 2',
    },
    ['<leader>3'] = {
      function()
        require('harpoon.ui').nav_file(3)
      end,
      'move to harpoon 3',
    },
    ['<leader>4'] = {
      function()
        require('harpoon.ui').nav_file(4)
      end,
      'move to harpoon 4',
    },
    ['<leader>j'] = {
      function()
        require('harpoon.ui').nav_prev()
      end,
      'move to harpoon next',
    },
    ['<leader>k'] = {
      function()
        require('harpoon.ui').nav_next()
      end,
      'move to harpoon before',
    },
  },
}

M.nvimtree = {
  n = {
    ['<leader>e'] = {
      function()
        require('nvim-tree.api').tree.toggle(false, true)
      end,
      ' toggle nvimtree',
    },
    ['<leader>rs'] = {
      '<cmd> NvimTreeResize 75 <CR>',
      ' resize nvimtree',
    },
    ['<leader>rsd'] = {
      '<cmd> NvimTreeResize 90 <CR>',
      ' resize default nvimtree',
    },
  },
}

M.lsp = {
  n = {
    ['gi'] = {
      function()
        require('telescope.builtin').lsp_references()
      end,
      '  LSP references',
    },
  },
}

return M
