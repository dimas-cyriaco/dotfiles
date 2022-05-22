require("user.options")
require("user.plugins")
require("user.treesitter")
require("user.neoscroll")
require("user.keymaps")
require("user.colorscheme")
require("user.nvim-tree")
require("user.snippets")
require("user.completion")
require("user.lsp")
require("user.telescope")
require("user.lightbulb")
require("user.toggleterm")
require("user.gitsigns")
require("user.context_vt")
require("user.telekasten")

-- local ui = vim.api.nvim_list_uis()[1]

require("jabs").setup({
	position = "center", -- center, corner
	width = 80,
	height = 20,
	border = "shadow", -- none, single, double, rounded, solid, shadow, (or an array or chars)

	-- -- Options for preview window
	-- preview_position = 'left', -- top, bottom, left, right
	-- preview = {
	--     width = 40,
	--     height = 30,
	--     border = 'double', -- none, single, double, rounded, solid, shadow, (or an array or chars)
	-- },
	--
	--    	-- the options below are ignored when position = 'center'
	-- col = ui.width,  -- Window appears on the right
	-- row = ui.height/2, -- Window appears in the vertical middle
})

vim.wo.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false

vim.cmd([[set guifont=FiraCode\ Nerd\ Font:h18,\ MesloLGS\ NF:h18,DejavuSans:h18]])
