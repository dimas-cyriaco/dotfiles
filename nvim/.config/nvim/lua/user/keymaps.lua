vim.g.mapleader = ";"
vim.g.localmapleader = ";"

local keymap = vim.keymap.set

local options = { noremap = true, silent = true }
local terminal_options = { silent = true }

-- Exit insert mode
keymap({ "i" }, "jk", "<esc>", options)

-- Terminal --
-- Better terminal navigation
keymap({ "t" }, "<C-h>", "<C-\\><C-N><C-w>h", terminal_options)
keymap({ "t" }, "<C-j>", "<C-\\><C-N><C-w>j", terminal_options)
keymap({ "t" }, "<C-k>", "<C-\\><C-N><C-w>k", terminal_options)
keymap({ "t" }, "<C-l>", "<C-\\><C-N><C-w>l", terminal_options)

keymap({ "n" }, "<M-j>", ":lua require('neoscroll').scroll(1, true, 100)<CR>", options)
keymap({ "n" }, "<M-k>", ":lua require('neoscroll').scroll(-1, true, 100)<CR>", options)

-- keymap({ "n" }, "<leader>i", ":lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>")

local success, legendary = pcall(require, "legendary")
if not success then
	return
end

local keymaps = {
	{ "<c-h", "<cmd>TmuxNavigateRight<CR>", description = "Move to the pane to the right." },
	{ "<c-j", "<cmd>TmuxNavigateDown<CR>", description = "Move to the pane to the bottom." },
	{ "<c-k", "<cmd>TmuxNavigateUp<CR>", description = "Move to the pane to the top." },
	{ "<c-l", "<cmd>TmuxNavigateLeft<CR>", description = "Move to the pane to the left." },
	{ "<leader>s", ":wa<CR>", description = "Write all buffers." },
	{ "<leader>w", ":w<CR>", description = "Write current buffers." },
	{ "<leader>q", ":q<CR>", description = "Close current window." },
	{ "<leader>c", ":Bdelete<CR>", description = "Delete current buffer." },
	{ "<leader>h", ":nohlsearch<CR>", description = "Disable search highlight." },
	{ "<leader>lf", vim.lsp.buf.formatting_sync, description = "Format buffer." },
	{ "<leader>;", "<cmd>lua require('legendary').find()<CR>", description = "Search commands." },
	{
		"<leader>jj",
		"<cmd>lua require'jester'.run{ path_to_jest = './node_modules/.bin/jest' }<CR>",
		description = "Run test under cursor.",
	},
	{
		"<leader>jf",
		"<cmd>lua require'jester'.run_file{ path_to_jest = './node_modules/.bin/jest' }<CR>",
		description = "Run test file.",
	},
	{
		"<leader>jl",
		"<cmd>lua require'jester'.run_last{ path_to_jest = './node_modules/.bin/jest' }<CR>",
		description = "Run last test.",
	},
	{ "<leader>bb", ":JABSOpen<cr>", description = "List Buffers." },
	{
		"<leader>f",
		":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>",
		description = "Find file.",
	},
	{ "<leader>st", ":Telescope live_grep<CR>", description = "Find file." },
	{ "<s-l>", ":bnext<cr>", description = "Go to next buffer." },
	{ "<s-h>", ":bprevious<cr>", description = "Go to previous buffer." },
	{ "<leader>e", ":NvimTreeToggle<cr>", description = "Toggle file explorer." },
	{ "<leader>am", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", description = "Show favorite buffers." },
	{
		"<leader>aa",
		"<cmd>lua require'harpoon.mark'.add_file()<cr>",
		description = "Add current buffer to favorites.",
	},
	{ "<leader>au", "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", description = "Go to favorite bufffer #1." },
	{ "<leader>ai", "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", description = "Go to favorite bufffer #2." },
	{ "<leader>ao", "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", description = "Go to favorite bufffer #3." },
	{ "<leader>ap", "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", description = "Go to favorite bufffer #4." },
	{ "<leader>ld", "<cmd>lua vim.diagnostic.setloclist()<cr>", description = "Show diagnostic list." },
	{ "<leader>lf", "<cmd>lua vim.vim.lsp.buf.rename()<cr>", description = "Reneme current file." },
	{ "<leader>lc", "<cmd>lua vim.lsp.codelens.run()<cr>", description = "Reneme current file." },
	{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", description = "Go to next diagnostic." },
	{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", description = "Go to previous diagnostic." },
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", description = "Format file." },
	{ "<leader>la", "<cmd>CodeActionMenu<cr>", description = "Code action menu." },
	{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", description = "Open LazyGit." },
	{ "<c-g>", "<cmd>lua _TEST_TERM_TOGGLE()<cr>", mode = { "n", "t" }, description = "Open test terminal." },
	{ "<c-k>", description = "Show signature help." },
	{
		"<c-]>",
		"<cmd>lua require('fold-cycle').open()<CR>",
		description = "Open the next level of (nested) folds.",
	},
	{
		"<c-[>",
		"<cmd>lua require('fold-cycle').close()<CR>",
		description = "Close the next level of (nested) folds.",
	},
	{
		"<c-s-]>",
		"<cmd>lua require('fold-cycle').open_all()<CR>",
		description = "Open the next level of (nested) folds.",
	},
	{
		"<c-s-[>",
		"<cmd>lua require('fold-cycle').close_all()<CR>",
		description = "Close the next level of (nested) folds.",
	},
}

legendary.bind_keymaps(keymaps)
