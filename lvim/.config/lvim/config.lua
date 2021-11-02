-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

lvim.leader = ";"
-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "nord"

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldcolumn = "1"
vim.o.foldlevelstart = 1

function _G.custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart)
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	return line .. " " .. line_count .. " lines"
end

vim.opt.foldtext = "v:lua.custom_fold_text()"
vim.opt.fillchars = { eob = "-", fold = " " }
vim.opt.viewoptions:remove("options")
-- keymappings [view all the defaults by pressing <leader>Lk]
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
-- local actions = require("telescope.actions")
-- local bufnr = actions.get_selected_entry()
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

require("telescope").setup({
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = false,
			sort_mru = true,
			previewer = false,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
				n = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
	},
})

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.bufferline.active = false
vim.cmd([[ set showtabline=0 ]])

lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}

lvim.builtin.which_key.mappings["f"] = {
	"<cmd>Telescope find_files find_command=fd,--hidden,--follow,--type,file,--exclude,'.git',--exclude,'node_modules'<cr>",
	"Files",
}

lvim.builtin.which_key.mappings["b"] = {
	b = {
		"<cmd>Telescope buffers<cr>",
		"Buffers",
	},
}

vim.cmd("set timeoutlen=150")
vim.cmd("set relativenumber")
vim.cmd("set spelllang=pt_br,en")

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.hide_dotfiles = 0
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.update_cwd = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.plugins = {
	{ "christoomey/vim-tmux-navigator" },
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()

			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
			t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
			t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
			t["<C-k>"] = { "scroll", { "-1", "true", "0", nil } }
			t["<C-j>"] = { "scroll", { "1", "true", "0", nil } }
			t["zt"] = { "zt", { "250" } }
			t["zz"] = { "zz", { "250" } }
			t["zb"] = { "zb", { "250" } }

			require("neoscroll.config").set_mappings(t)
		end,
	},
	{ "mateusbraga/vim-spell-pt-br" },
	{ "scalameta/nvim-metals" },
	{ "arcticicestudio/nord-vim" },
	{ "folke/trouble.nvim" },
}
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.lua.formatters = {
	{
		exe = "stylua",
		args = {},
	},
}
lvim.lang.python.formatters = {
	{
		exe = "black",
		args = {},
	},
}
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- lvim.lang.typescriptreact.formatters = { { exe = 'eslint' } }
-- lvim.lang.typescriptreact.linters = { { exe = 'eslint' } }
-- lvim.lang.typescript.formatters = { { exe = 'eslint' } }
-- lvim.lang.typescript.linters = { { exe = 'eslint' } }

-- Prettier configuration
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "prettier",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"json",
			"markdown",
		},
	},
})

-- ESLint
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		exe = "eslint",
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"vue",
		},
	},
})

vim.cmd([[augroup scala]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(require'metals'.bare_config)]])
vim.cmd([[augroup end]])
--
vim.g["metals_server_version"] = "0.10.2+46-e7ab8592-SNAPSHOT"
-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
require("neoscroll").setup()
vim.cmd("let g:nvim_tree_group_empty = 1")

require("zk_config")
