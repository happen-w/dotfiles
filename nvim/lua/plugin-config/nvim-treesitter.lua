local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if status_ok then
  configs.setup {
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = { "c", "lua", "vim"},

    -- 启用代码高亮功能
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    -- 启用增量选择
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        node_decremental = '<BS>',
        scope_incremental = '<TAB>',
      }
    },
  }
end
