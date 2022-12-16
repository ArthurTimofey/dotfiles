local ensure_packer = function()
  local fn = vim.fn
  local home_path = os.getenv("HOME")
  local install_path = home_path .. '/.config/nvim/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Misc
  use {
    -- Plugins
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'lukas-reineke/indent-blankline.nvim',
    'windwp/nvim-autopairs',
    'terrortylor/nvim-comment',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'nvim-lualine/lualine.nvim',
    'github/copilot.vim',
    'nvim-tree/nvim-tree.lua',
    'nvim-treesitter/nvim-treesitter',
    'glepnir/dashboard-nvim',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    'lewis6991/gitsigns.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    'nvim-telescope/telescope.nvim',
    'onsails/lspkind-nvim',
    -- themes
    'ellisonleao/gruvbox.nvim',
    'navarasu/onedark.nvim',
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
