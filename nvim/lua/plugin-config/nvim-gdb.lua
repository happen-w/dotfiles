vim.cmd([[
    let g:nvimgdb_disable_start_keymaps = 1
    let g:nvimgdb_use_find_executables = 0
    let g:nvimgdb_use_cmake_to_find_executables = 0
    let w:nvimgdb_termwin_command = "rightbelow vnew"
    let w:nvimgdb_codewin_command = "vnew"
    let g:nvimgdb_config_override = {
      \ 'key_next': ';n',
      \ 'key_step': ';s',
      \ 'key_finish': ';f',
      \ 'key_continue': ';c',
      \ 'key_until': ';u',
      \ 'key_breakpoint': ';b',
  \ }
]])

-- 开启调试
_G.StartGdbSession = function()
  local exec_file = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  vim.api.nvim_command(":GdbStart gdb -q " .. exec_file)
  vim.api.nvim_command("NERDTreeClose")
end

_G.GdbSessionInit = function()
  -- restore breakpoints if possible
  -- 断点持久化
  --  local utils = require("user.utils")
  --  if utils.exists('.bps.txt') then
  --    vim.defer_fn(function()
  --      vim.api.nvim_command(":Gdb source .bps.txt")
  --    end, 12000)
  --  end

  -- create bt & info locals window
  -- vim.api.nvim_command(":belowright GdbCreateWatch thread apply all bt")
  -- vim.api.nvim_command(":wincmd h")
  vim.api.nvim_command(":belowright GdbCreateWatch info locals")
  vim.api.nvim_command(":set wrap")

  -- move cursor back to gdb terminal
  vim.api.nvim_command(":wincmd l")
  vim.api.nvim_command(":wincmd k")
end

_G.CloseWatchBuffers = function()
  vim.defer_fn(function()
    vim.api.nvim_command(":bd! info")
  end, 10)
end


-- vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua StartGdbSession()<CR>", {})
vim.cmd([[
  autocmd User NvimGdbStart :lua GdbSessionInit()
]])
vim.cmd([[
  autocmd User NvimGdbCleanup :lua CloseWatchBuffers()
]])
