local status_ok, toggleterm = pcall(require, "toggleterm")
if status_ok then
  toggleterm.setup({
    direction = 'float',
    close_on_exit = true,
    shell = "zsh"
  })
end
