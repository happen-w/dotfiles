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


-- 切换窗口
map("n", "<C-h>", "<C-w><C-h>", opt)
map("n", "<C-j>", "<C-w><C-j>", opt)
map("n", "<C-k>", "<C-w><C-k>", opt)
map("n", "<C-l>", "<C-w><C-l>", opt)


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

map("n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opt)
map("n", "<leader>i", "<cmd>lua require('jdtls').organize_imports()<CR>", opt)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opt)

map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opt)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opt)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opt)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opt)

map("n", "R", "<cmd>lua require('renamer').rename()<cr>", opt)
map("n", "==", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", opt)

