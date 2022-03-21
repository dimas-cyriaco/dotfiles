local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.api.nvim_create_augroup('packer_user_config',  { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'packer_user_config',
  pattern = 'plugins.lua',
  command = "source <afile> | PackerSync"
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("[ERROR] Unable to load Packer")
  return
end

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  use "christoomey/vim-tmux-navigator"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "rcarriga/nvim-notify"
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/nvim-cmp"
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'L3MON4D3/LuaSnip'
  use "rafamadriz/friendly-snippets"

  use {
    'windwp/nvim-autopairs',
    config = function ()
      require('nvim-autopairs').setup{}
    end
  }

  use {
    "rebelot/kanagawa.nvim",
    config = function ()
      require('kanagawa').setup({
        dimInactive = true,
        globalStatus = true,
      })
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require'nvim-tree'.setup {
        hide_root_folder = true,
        update_focused_file = {
          enable = true,
        },
      }

      vim.cmd [[let g:nvim_tree_group_empty = 1]]
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  use { "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
    end
  }

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
