require("zk").setup({
	debug = false,
	log = true,
	default_keymaps = true,
	default_notebook_path = vim.env.ZK_NOTEBOOK_DIR or "",
	fuzzy_finder = "TELESCOPE", -- or "telescope"
	link_format = "markdown", -- or "wiki"
})

vim.cmd([[ command! -nargs=0 ZkIndex :lua require'lspconfig'.zk.index() ]])
vim.cmd([[ command! -nargs=? ZkNew :lua require'lspconfig'.zk.new(<args>) ]])

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

configs.zk = {
	default_config = {
		cmd = { "zk", "lsp", "--log", "/tmp/zk-lsp.log" },
		filetypes = { "markdown" },
		root_dir = lspconfig.util.root_pattern(".zk"),
		settings = {},
	},
}

configs.zk.index = function()
	vim.lsp.buf.execute_command({
		command = "zk.index",
		arguments = { vim.api.nvim_buf_get_name(0) },
	})
end

lspconfig.zk.setup({
	on_attach = function(_, bufnr)
		-- Key mappings
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		local opts = { noremap = true, silent = true }

		buf_set_keymap("n", "<CR>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("n", "<leader>zi", ":ZkIndex<CR>", opts)
		buf_set_keymap("v", "<leader>zn", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
		buf_set_keymap("n", "<leader>zn", ":ZkNew {title = vim.fn.input('Title: ')}<CR>", opts)
		buf_set_keymap("n", "<leader>zl", ":ZkNew {dir = 'log'}<CR>", opts)
		buf_set_keymap("n", "<leader>n", "<cmd>lua require('telescope').extensions.zk.zk_notes()<CR>", opts)
	end,
})

require("telescope").load_extension("zk")
