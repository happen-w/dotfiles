local install = function(use)
  use 'wbthomason/packer.nvim'

  use { "morhetz/gruvbox", config = function()
    vim.cmd("colorscheme gruvbox")
  end }

  -- 文件树
  use "preservim/nerdtree"
  use 't9md/vim-choosewin'
  use 'happen-w/nerdtree_choosewin-plugin'
  use "ryanoasis/vim-devicons"
  use "preservim/nerdcommenter"
  -- 主题
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- 移动查找
  use { 'phaazon/hop.nvim', branch = 'v2' }
  use 'tpope/vim-unimpaired'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }


  -- lsp
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip'         -- Snippets plugin
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
