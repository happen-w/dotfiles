local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup {
  keys = 'etovxqpdygfblzhckisuran',
  case_insensitive = false,
  multi_windows = true,
}
local map = vim.g.kmap
local opt = vim.g.kopt
map("n", "ss", ":HopChar2<CR>", opt)
