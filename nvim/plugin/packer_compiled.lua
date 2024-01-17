-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/happen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/happen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/happen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/happen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/happen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://kkgithub.com/L3MON4D3/LuaSnip"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://kkgithub.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://kkgithub.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://kkgithub.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://kkgithub.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://kkgithub.com/saadparwaiz1/cmp_luasnip"
  },
  ["doom-one.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme doom-one\bcmd\bvim\0" },
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://kkgithub.com/NTBBloodbath/doom-one.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://kkgithub.com/rafamadriz/friendly-snippets"
  },
  gruvbox = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://kkgithub.com/morhetz/gruvbox"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://kkgithub.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://kkgithub.com/lukas-reineke/indent-blankline.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://kkgithub.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://kkgithub.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://kkgithub.com/williamboman/mason.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://kkgithub.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://kkgithub.com/preservim/nerdtree"
  },
  ["nerdtree_choosewin-plugin"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nerdtree_choosewin-plugin",
    url = "https://kkgithub.com/happen-w/nerdtree_choosewin-plugin"
  },
  ["neuleetcode.vim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/neuleetcode.vim",
    url = "https://kkgithub.com/mbledkowski/neuleetcode.vim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://kkgithub.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/happen/.local/share/nvim/site/pack/packer/opt/nvim-code-action-menu",
    url = "https://kkgithub.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-gdb"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nvim-gdb",
    url = "https://kkgithub.com/sakhnik/nvim-gdb"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://kkgithub.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://kkgithub.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://kkgithub.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://kkgithub.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://kkgithub.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://kkgithub.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://kkgithub.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://kkgithub.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://kkgithub.com/akinsho/toggleterm.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://kkgithub.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://kkgithub.com/vim-airline/vim-airline-themes"
  },
  ["vim-buffet"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-buffet",
    url = "https://kkgithub.com/bagrat/vim-buffet"
  },
  ["vim-choosewin"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-choosewin",
    url = "https://kkgithub.com/t9md/vim-choosewin"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://kkgithub.com/ryanoasis/vim-devicons"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://kkgithub.com/RRethy/vim-illuminate"
  },
  ["vim-markdown-toc"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-markdown-toc",
    url = "https://kkgithub.com/mzlogin/vim-markdown-toc"
  },
  ["vim-quickrun"] = {
    config = { "\27LJ\2\nj\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Klet g:quickrun_config = { '*': { 'outputter/buffer/opener': 'new' }, }\bcmd\bvim\0" },
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-quickrun",
    url = "https://kkgithub.com/thinca/vim-quickrun"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://kkgithub.com/dhruvasagar/vim-table-mode"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/happen/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://kkgithub.com/tpope/vim-unimpaired"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-quickrun
time([[Config for vim-quickrun]], true)
try_loadstring("\27LJ\2\nj\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Klet g:quickrun_config = { '*': { 'outputter/buffer/opener': 'new' }, }\bcmd\bvim\0", "config", "vim-quickrun")
time([[Config for vim-quickrun]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: doom-one.nvim
time([[Config for doom-one.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme doom-one\bcmd\bvim\0", "config", "doom-one.nvim")
time([[Config for doom-one.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'CodeActionMenu', function(cmdargs)
          require('packer.load')({'nvim-code-action-menu'}, { cmd = 'CodeActionMenu', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-code-action-menu'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('CodeActionMenu ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
