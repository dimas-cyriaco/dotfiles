local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.api.nvim_create_augroup("packer_user_config", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "packer_user_config",
	pattern = "plugins.lua",
	command = "source <afile> | PackerSync",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("[ERROR] Unable to load Packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("christoomey/vim-tmux-navigator")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("rcarriga/nvim-notify")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/nvim-cmp")
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("moll/vim-bbye")
	use("David-Kunz/jester")
	use("mrjones2014/legendary.nvim")
	use("stevearc/dressing.nvim")
	use("kosayoda/nvim-lightbulb")
	use("matbme/JABS.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("akinsho/toggleterm.nvim")
	use("kevinhwang91/nvim-bqf")
	use("karb94/neoscroll.nvim")
	use("haringsrob/nvim_context_vt")
	use("romgrk/nvim-treesitter-context")

	use({
		"renerocksai/telekasten.nvim",
		requires = {
			"renerocksai/calendar-vim",
			"nvim-telescope/telescope-symbols.nvim",
			"mzlogin/vim-markdown-toc",
		},
	})

	use({ "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" })

	use({
		"jghauser/fold-cycle.nvim",
		config = function()
			require("fold-cycle").setup()
		end,
	})

	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({})
			require("pretty-fold.preview").setup({
				key = "h", -- 'h', 'l' or nil (if you would like to set your own keybinding)

				-- 'none', "single", "double", "rounded", "solid", 'shadow' or table
				-- For explanation see: :help nvim_open_win()
				border = "rounded",
			})
		end,
	})

	use({
		"henriquehbr/nvim-startup.lua",
		config = function()
			require("nvim-startup").setup()
		end,
	})

	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	use({
		"ThePrimeagen/harpoon",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
		},
	})

	use({
		"ggandor/lightspeed.nvim",
		event = "BufRead",
	})

	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				dimInactive = true,
				globalStatus = true,
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- Automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
