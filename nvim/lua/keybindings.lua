-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.kopt = {
  noremap = true,
  silent = true,
}
vim.g.kmap = vim.api.nvim_set_keymap
local map = vim.g.kmap
local opt = vim.g.kopt

map("v", "<C-c>", "\"*y", opt)
-- 切换窗口
map("n", "<C-h>", "<C-w><C-h>", opt)
map("n", "<C-j>", "<C-w><C-j>", opt)
map("n", "<C-k>", "<C-w><C-k>", opt)
map("n", "<C-l>", "<C-w><C-l>", opt)

map("i", "<C-s>", "<Esc>:w<CR>a", opt)

-- quickfix
map("n", "co", ":copen<CR>", opt)
-- map("n", "cn", ":cn<CR>", opt)
-- map("n", "cp", ":cp<CR>", opt)
map("n", "cc", ":ccl<CR>", opt)

-- unimpaired 取代了 cn
-- ]b [b 变量缓冲区
-- ]f [f 文件
-- ]q [q quickfix
-- ]t [t 标签



-- LSP

map("n", "<C-.>", "<cmd>CodeActionMenu<CR>", opt)
map("n", "<leader>i", "<cmd>lua require('jdtls').organize_imports()<CR>", opt)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opt)

map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opt)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opt)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt)

map("n", "R", "<cmd>lua require('renamer').rename()<cr>", opt)
map("n", "==", "<cmd>lua vim.lsp.buf.format()<cr>", opt)

map("n", '-', "<Plug>(choosewin)", opt)

-- quickrun
map("n", "Q", ":QuickRun<CR>", opt)
map("n", "<leader>q", "<C-w><C-k>:q<CR>", opt)

--
map("n", "<leader>1", "<Plug>BuffetSwitch(1)", opt)
map("n", "<leader>2", "<Plug>BuffetSwitch(2)", opt)
map("n", "<leader>3", "<Plug>BuffetSwitch(3)", opt)
map("n", "<leader>4", "<Plug>BuffetSwitch(4)", opt)
map("n", "<leader>5", "<Plug>BuffetSwitch(5)", opt)
map("n", "<leader>6", "<Plug>BuffetSwitch(6)", opt)
map("n", "<leader>7", "<Plug>BuffetSwitch(7)", opt)
map("n", "<leader>8", "<Plug>BuffetSwitch(8)", opt)
map("n", "<leader>9", "<Plug>BuffetSwitch(9)", opt)
map("n", "<Tab>", ":bn<CR>", opt);
map("n", "<S-Tab>", ":bp<CR>", opt);
map("n", "<leader><Tab>", ":Bw<CR>", opt);
map("n", "<leader><S-Tab>", ":Bw!<CR>", opt);



-- debug
map("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opt)
map("n", "<leader>dd", "<cmd>lua require'dap'.clear_breakpoints()<cr>", opt)

-- 启动/继续运行
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opt)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opt)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opt)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opt)

map("n", "<leader>to", "<cmd>:ToggleTerm<cr>", opt)
