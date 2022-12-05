local autocmd = vim.api.nvim_create_autocmd

-- Set the cursor color for insert mode
vim.cmd([[highlight CursorInsert guifg=red guibg=red]])

-- stop auto commenting new lines
vim.api.nvim_command('autocmd FileType * setlocal formatoptions-=cro')
