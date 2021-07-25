--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

-- lvim.lang.scala.metals.active = true

lvim.leader = ";"
lvim.auto_close_tree = 0
lvim.colorscheme = "nord"
-- lvim.completion.autocomplete = true
-- lvim.default_options.scrolloff = 999
-- lvim.default_options.timeoutlen = 100
-- lvim.default_options.wrap = true
lvim.format_on_save = true

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.show_icons.git = 1
-- lvim.builtin.nvimtree.side = "left"
lvim.builtin.terminal.active = true
-- lvim.builtin.zen.active = false
-- lvim.builtin.zen.window.height = 0.90

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- python
-- lvim.lang.python.diagnostics.virtual_text = true
-- lvim.lang.python.analysis.use_library_code_types = true
-- to change default formatter from yapf to black
-- lvim.lang.python.formatter.exe = "black"
-- lvim.lang.python.formatter.args = {"-"}

-- go
-- to change default formatter from gofmt to goimports
-- lvim.lang.formatter.go.exe = "goimports"

-- javascript
-- lvim.lang.tsserver.linter = nil

-- Additional Plugins
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

		require("compe").setup({
			source = {
				orgmode = true,
			},
		})
	end,
}

lvim.plugins = {
	{ "nvim-telescope/telescope-project.nvim" },
	{ "karb94/neoscroll.nvim" },
	{ "arcticicestudio/nord-vim" },
	{ "christoomey/vim-tmux-navigator" },
	lsp_signature_config,
	hop_config,
	trouble_config,
	gitlinker_config,
	orgmode_config,
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
-- local mappings = {
-- 	d = { "<cmd>b#<cr>", "Switch Buffers" }
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
