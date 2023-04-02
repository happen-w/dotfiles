local install = function(use)
  use 'wbthomason/packer.nvim'

  use 'akinsho/toggleterm.nvim'
  -- 文件树
  use "preservim/nerdtree"
  use 't9md/vim-choosewin'
  use 'happen-w/nerdtree_choosewin-plugin'
  use "ryanoasis/vim-devicons"
  use "preservim/nerdcommenter"
  -- 主题
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"
  use { 'NTBBloodbath/doom-one.nvim', commit = '60eb78255472bd9a2ca483ce70757cfda57cc706', config = function()
    vim.cmd("colorscheme doom-one")
  end }
  use { "morhetz/gruvbox", config = function()
    -- vim.cmd("colorscheme gruvbox")
  end }
  -- 移动查找
  use { 'phaazon/hop.nvim', branch = 'v2' }
  use 'tpope/vim-unimpaired'
  use 'bagrat/vim-buffet' -- buffer 移动
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'dhruvasagar/vim-table-mode'
  use 'mzlogin/vim-markdown-toc'

  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'         -- Snippets plugin
  use "rafamadriz/friendly-snippets"
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'RRethy/vim-illuminate'
  use 'jiangmiao/auto-pairs'
  use 'mfussenegger/nvim-jdtls'
  use 'simrat39/symbols-outline.nvim'
  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })
  use({
    'thinca/vim-quickrun',
    config = function()
      vim.cmd("let g:quickrun_config = { '*': { 'outputter/buffer/opener': 'new' }, }")
    end
  })
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- DAP
  use "mfussenegger/nvim-dap"
  use "jay-babu/mason-nvim-dap.nvim"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "sakhnik/nvim-gdb"
end

local util = require('util')
local fn = vim.fn
local ensure_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    print("installing packer")
    fn.system(util.split("git clone --depth 1 https://kgithub.com/wbthomason/packer.nvim " .. install_path, " "))
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  git = {
    default_url_format = 'https://kgithub.com/%s'
  }
})


return packer.startup(function(use)
  install(use)
  if packer_bootstrap then
    require('packer').sync()
  end
end)
