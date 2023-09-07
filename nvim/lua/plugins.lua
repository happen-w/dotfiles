local install = function(use)
  use 'wbthomason/packer.nvim'

  use { 'akinsho/toggleterm.nvim', commit = '26f16d3bab1761d0d11117a8e431faba11a1b865' }
  use { 'lukas-reineke/indent-blankline.nvim', commit = '018bd04d80c9a73d399c1061fa0c3b14a7614399' }
  -- 文件树
  use { 'preservim/nerdtree', commit = 'fc85a6f07c2cd694be93496ffad75be126240068'}
  -- 窗口选择
  use { 't9md/vim-choosewin', commit = '839da609d9b811370216bdd9d4512ec2d0ac8644' }
  -- nerdtree 打开文件窗口选择
  use 'happen-w/nerdtree_choosewin-plugin'
  use { 'ryanoasis/vim-devicons', commit = '71f239af28b7214eebb60d4ea5bd040291fb7e33'}
  use { 'preservim/nerdcommenter', commit = '20452116894a6a79f01a1e95d98f02cf085e9bd6' }
  -- 主题
  use { 'vim-airline/vim-airline', commit = '5891a3f7bedb5d0b23a546189a607836913814bb' }
  use { 'vim-airline/vim-airline-themes', commit = 'dd81554c2231e438f6d0e8056ea38fd0e80ac02a' }
  use { 'NTBBloodbath/doom-one.nvim', commit = '60eb78255472bd9a2ca483ce70757cfda57cc706', config = function()
    vim.cmd('colorscheme doom-one')
  end }
  use { 'morhetz/gruvbox', commit = 'bf2885a95efdad7bd5e4794dd0213917770d79b7', config = function()
    -- vim.cmd('colorscheme gruvbox')
  end }
  -- 移动查找
  use { 'phaazon/hop.nvim', branch = 'v2' }
  use { 'tpope/vim-unimpaired', commit = '6d44a6dc2ec34607c41ec78acf81657248580bf1' }
  use { 'bagrat/vim-buffet', commit = '3ee5c836cd7ded3526902122e06110cd3f8549cb' } -- buffer 移动
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- markdown
  use({
    'iamcco/markdown-preview.nvim',
    commit = '02cc3874738bc0f86e4b91f09b8a0ac88aef8e96',
    run = function() vim.fn['mkdp#util#install']() end,
  })
  use { 'dhruvasagar/vim-table-mode', commit = '9555a3e6e5bcf285ec181b7fc983eea90500feb4'}
  use { 'mzlogin/vim-markdown-toc', commit = '7ec05df27b4922830ace2246de36ac7e53bea1db'}

  -- lsp
  use { 'neovim/nvim-lspconfig', commit = '6f1d124bbcf03c4c410c093143a86415f46d16a0' }
  use { 'williamboman/mason.nvim', commit = '08b2fd308e0107eab9f0b59d570b69089fd0b522' }
  use { 'williamboman/mason-lspconfig.nvim', commit = 'c55d18f3947562e699d34d89681edbf9f0e250d3' }
  use { 'hrsh7th/nvim-cmp', commit = '3ac8d6cd29c74ff482d8ea47d45e5081bfc3f5ad'}
  use { 'hrsh7th/cmp-nvim-lsp', commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef'}     -- LSP source for nvim-cmp
  use { 'saadparwaiz1/cmp_luasnip', commit = '18095520391186d634a0045dacaa346291096566' } -- Snippets source for nvim-cmp
  use { 'L3MON4D3/LuaSnip', commit = 'ec7fba1d119fb5090a901eb616145450ffb95e31'   }      -- Snippets plugin
  use { 'rafamadriz/friendly-snippets', commit = 'f674dae71b9daf5ba4a4daf0734f7780417237b1'}
  use { 'hrsh7th/cmp-buffer', commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa'}
  use { 'hrsh7th/cmp-path', commit = '91ff86cd9c29299a64f968ebb45846c485725f23' }
  use { 'RRethy/vim-illuminate', commit = 'a2907275a6899c570d16e95b9db5fd921c167502' }
  use { 'jiangmiao/auto-pairs', commit = '39f06b873a8449af8ff6a3eee716d3da14d63a76' }
  use { 'mfussenegger/nvim-jdtls', commit = '355de7458fd63ccef9c6485d952ea118ba2cb46a'}
  use({
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  })
  use({
    'thinca/vim-quickrun',
    commit = '50f9ced186cf2651f4356aa3548c2306e181ec3b',
    config = function()
      vim.cmd("let g:quickrun_config = { '*': { 'outputter/buffer/opener': 'new' }, }")
    end
  })
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- DAP
  -- use 'mfussenegger/nvim-dap'
  -- use 'jay-babu/mason-nvim-dap.nvim'
  -- use 'rcarriga/nvim-dap-ui'
  -- use 'theHamsta/nvim-dap-virtual-text'
  use {'sakhnik/nvim-gdb', commit = 'fc0173b4058265b225d98429599bc4f47f0a940e'}

  -- 不经常用的
  use { 'simrat39/symbols-outline.nvim', commit = '512791925d57a61c545bc303356e8a8f7869763c'}

  -- leetcode
  use 'mbledkowski/neuleetcode.vim'

end

local util = require('util')
local fn = vim.fn
local ensure_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    print('installing packer')
    fn.system(util.split('git clone --depth 1 https://kgithub.com/wbthomason/packer.nvim ' .. install_path, ' '))
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
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
