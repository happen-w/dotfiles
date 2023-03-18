-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
local map = vim.g.kmap
local opt = vim.g.kopt

map('n', 'ff', ":Telescope find_files<CR>", opt)
map('n', 'fg', ":Telescope live_grep<CR>", opt)
