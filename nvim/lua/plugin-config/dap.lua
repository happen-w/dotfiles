
require('mason-nvim-dap').setup({
  ensure_installed = { 'python', 'codelldb' },
  automatic_installation = false,
  automatic_setup = true,
})

require 'mason-nvim-dap'.setup_handlers {
  function(source_name)
    require('mason-nvim-dap.automatic_setup')(source_name)
  end,
}

local dap_breakpoint = {
  error = {
    text = "🛑",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "⭐️",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)


