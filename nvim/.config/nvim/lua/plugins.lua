return require('packer').startup(function()
  use {'wbthomason/packer.nvim', otp = true}

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  use { 'tjdevries/nlua.nvim' }
  use { 'arcticicestudio/nord-vim' }

  use { 'editorconfig/editorconfig-vim' }
  use { 'lambdalisue/gina.vim' }
  use { 'alvan/vim-closetag' }
  use { 'tpope/vim-commentary' }
  use { 'junegunn/vim-easy-align' }
  use { 'itchyny/vim-gitbranch' }
  use { 'airblade/vim-gitgutter' }
  use { 'yuezk/vim-js' }
  use { 'maxmellon/vim-jsx-pretty' }
  use { 'sheerun/vim-polyglot' }
  use { 'prettier/vim-prettier', branch = 'release/0.x', run = 'yarn install' }
  use { 'mhinz/vim-startify' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'reedes/vim-wheel' }
  use { 'liuchengxu/vim-which-key' }
  use { 'SirVer/ultisnips' }
  use { 'honza/vim-snippets' }
  use { 'jiangmiao/auto-pairs' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'glepnir/galaxyline.nvim' , branch = 'main' }
end)

