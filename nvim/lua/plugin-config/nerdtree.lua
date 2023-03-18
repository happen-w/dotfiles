local map = vim.g.kmap
local opt = vim.g.kopt
local autocmd = vim.api.nvim_create_autocmd

map("n", "<leader>n", ":NERDTree<cr>", opt)

autocmd("BufEnter", {
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree then
      vim.cmd "quit"
    end
  end
}
)

vim.g.NERDTreeShowBookmarks = 1
vim.g.NERDTreeShowHidden = 1
