-- general

lvim.leader = ";"
lvim.auto_close_tree = 0
lvim.colorscheme = "nord"
lvim.format_on_save = true

vim.cmd("set timeoutlen=150")
vim.cmd("set relativenumber")
vim.cmd("set spelllang=pt_br,en")

lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.terminal.active = true

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local hop_config = {
	"phaazon/hop.nvim",
	event = "BufRead",
	config = function()
		require("hop").setup()
		vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
		vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
	end,
}

local trouble_config = {
	"folke/trouble.nvim",
	cmd = "TroubleToggle",
	config = function()
		-- local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
				},
			},
		})
	end,
}

local lsp_signature_config = {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").on_attach()
	end,
	event = "InsertEnter",
}

local gitlinker_config = {
	"ruifm/gitlinker.nvim",
	requires = "nvim-lua/plenary.nvim",
}

local orgmode_config = {
	"kristijanhusak/orgmode.nvim",
	config = function()
		require("orgmode").setup({
			org_agenda_files = { "~/Documents/org/*" },
			org_default_notes_file = "~/Documents/org/Notes.org",
			org_agenda_templates = {
				j = {
					description = "Journal",
					template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
					target = "~/Documents/org/Journal.org",
				},
			},
		})

		-- require("compe").setup({
		-- 	source = {
		-- 		orgmode = true,
		-- 	},
		-- })
	end,
}

-- { "vhyrro/neorg" },
lvim.plugins = {
	{ "nvim-telescope/telescope-project.nvim" },
	{ "karb94/neoscroll.nvim" },
	{ "arcticicestudio/nord-vim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "mateusbraga/vim-spell-pt-br" },
	{ "scalameta/nvim-metals" },
	{ "megalithic/zk.nvim" },
	{ "romgrk/doom-one.vim" },
  { "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
  { "mboughaba/i3config.vim" },
	lsp_signature_config,
	hop_config,
	trouble_config,
	gitlinker_config,
	orgmode_config,
}

require("zk_config")

vim.cmd([[augroup scala]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(require'metals'.bare_config)]])
vim.cmd([[augroup end]])
--
vim.g["metals_server_version"] = "0.10.2+46-e7ab8592-SNAPSHOT"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- lvim.builtin.which_key = {
-- d = { "<cmd>b#<cr>", "Switch Buffers" },
-- D = {
-- name = "Diagnostics",
-- d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
-- l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
-- q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
-- r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
-- t = { "<cmd>TroubleToggle<cr>", "trouble" },
-- w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
-- },
-- f = { "<cmd>Telescope find_files find_command=fd,--hidden,--exclude,.git,--type,f<CR>", "Find File" },
-- l = {
-- h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
-- },
-- t = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
-- T = {
-- name = "Tabs",
-- c = { "<cmd>BufferCloseAllButCurrent<cr>", "Close others" },
-- n = { "<cmd>BufferNext<cr>", "Go to next Tab" },
-- p = { "<cmd>BufferPrevious<cr>", "Go to previous Tab" },
-- t = { "<cmd>BufferPick<cr>", "Select Tab" },
-- },
-- }

require("telescope").load_extension("project")
require("gitlinker").setup()
require("neoscroll").setup()

vim.cmd("let g:nvim_tree_group_empty = 1")

vim.cmd("nnoremap <silent> <leader>lh :lua vim.lsp.buf.signature_help()<CR>")