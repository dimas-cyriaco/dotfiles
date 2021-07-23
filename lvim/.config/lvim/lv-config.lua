--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

O.lang.scala.metals.active = true

O.auto_close_tree = 0
O.colorscheme = "spacegray"
O.completion.autocomplete = true
-- O.default_options.scrolloff = 999
O.default_options.timeoutlen = 100
O.default_options.wrap = true
O.format_on_save = true
O.keys.leader_key = ";"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.terminal.active = true
O.plugin.zen.active = false
O.plugin.zen.window.height = 0.90
O.plugin.nvimtree.side = "left"
O.plugin.nvimtree.show_icons.git = 0
O.plugin.terminal.active = true

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "maintained"
O.treesitter.ignore_install = { "haskell" }
O.treesitter.highlight.enabled = true

-- python
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true
-- to change default formatter from yapf to black
-- O.lang.python.formatter.exe = "black"
-- O.lang.python.formatter.args = {"-"}

-- go
-- to change default formatter from gofmt to goimports
-- O.lang.formatter.go.exe = "goimports"

-- javascript
O.lang.tsserver.linter = nil

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

O.user_plugins = {
	{ "folke/tokyonight.nvim" },
	{ "nvim-telescope/telescope-project.nvim" },
	{ "karb94/neoscroll.nvim" },
	lsp_signature_config,
	hop_config,
	trouble_config,
	gitlinker_config,
	orgmode_config,
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Leader bindings for WhichKey
O.user_which_key = {
	T = {
		name = "Tabs",
		t = { "<cmd>BufferPick<cr>", "Select Tab" },
		p = { "<cmd>BufferPrevious<cr>", "Go to previous Tab" },
		n = { "<cmd>BufferNext<cr>", "Go to next Tab" },
		c = { "<cmd>BufferCloseAllButCurrent<cr>", "Close others" },
	},
	D = {
		name = "Diagnostics",
		t = { "<cmd>TroubleToggle<cr>", "trouble" },
		w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
		d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
	},
	l = {
		h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
	},
	t = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects" },
  d = { "<cmd>b#<cr>", "Switch Buffers" }
}

require("telescope").load_extension("project")
require("gitlinker").setup()
require("neoscroll").setup()

vim.cmd("let g:nvim_tree_group_empty = 1")

-- vim.cmd("nnoremap <silent> <leader>lh :lua vim.lsp.buf.signature_help()<CR>")
