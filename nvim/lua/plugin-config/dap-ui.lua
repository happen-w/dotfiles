local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  vim.notify("dapui not found")
  return
end

local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
  vim.notify("dap not found")
  return
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "o", "<2-LeftMouse>", "<CR>" },
    open = "O",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        'scopes',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'stacks',
        'breakpoints',
        -- 'watches',
      },
      size = 30,
      position = 'right',
    },
    {
      elements = {
        'console',
      },
      size = 17,
      position = 'bottom',
    },
  },
  windows = { indent = 1 },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.cmd "NERDTreeClose"
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.cmd([[command! DapUiClose lua require("dapui").close() ]])
vim.cmd([[command! DapUiOpen lua require("dapui").close() ]])
