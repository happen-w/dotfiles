--基础配置
require("basic")
-- 快捷键映射
require("keybindings")

require("plugins")
require("reload")

-- 插件配置
require("plugin-config.airline")
require("plugin-config.nerdtree")
require("plugin-config.nerdcommenter")
-- require("plugin-config.telescope")
require("plugin-config.hop")
require("plugin-config.mason")
require("plugin-config.lspconfig")
require("plugin-config.nvim-cmp")
require("plugin-config.symbols-outline")
require("plugin-config.nvim-treesitter")
require("plugin-config.toggleterm")
require("plugin-config.nvim-gdb")
require("plugin-config.nvim-dap-virtual-text")
require("plugin-config.indent-blankline")

-- require("plugin-config.dap")
-- require("plugin-config.dap-ui")


_G.load_cscope = function()
  local current_file = vim.fn.expand('%:p')                -- 获取当前文件的完整路径
  local file_name = 'cscope.out'                           -- 要检查的文件名

  local file_path = vim.fn.fnamemodify(current_file, ':h') -- 获取当前文件所在的目录路径
  local full_path = file_path .. '/' .. file_name          -- 拼接文件的完整路径

  local stat = vim.loop.fs_stat(full_path)

  if stat ~= nil then
    vim.cmd(":cs add cscope.out")
    print('自动加载cscope.out文件')
  end
end
vim.cmd('autocmd VimEnter * lua load_cscope()')
