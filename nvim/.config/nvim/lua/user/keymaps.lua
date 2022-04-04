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

keymap({ "n" }, "<M-S-j>", "<cmd>lua require('neoscroll').scroll(1, true, 100)<CR>", options)
keymap({ "n" }, "<M-S-k>", "<cmd>lua require('neoscroll').scroll(-1, true, 100)<CR>", options)

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
	{ "<leader>s", "<cmd>wa<CR>", description = "Write all buffers." },
	{ "<leader>w", "<cmd>w<CR>", description = "Write current buffers." },
	{ "<leader>q", "<cmd>q<CR>", description = "Close current window." },
	{ "<leader>c", "<cmd>Bdelete<CR>", description = "Delete current buffer." },
	{ "<leader>h", "<cmd>nohlsearch<CR>", description = "Disable search highlight." },
	{ "<leader>;", require("legendary").find, description = "Search commands." },
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
	{ "<leader>bb", "<cmd>JABSOpen<cr>", description = "List Buffers." },
	{
		"<leader>f",
		":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>",
		description = "Find file.",
	},
	{ "<leader>st", ":Telescope live_grep<CR>", description = "Find file." },
	{ "<s-l>", ":bnext<cr>", description = "Go to next buffer." },
	{ "<s-h>", ":bprevious<cr>", description = "Go to previous buffer." },
	{ "<leader>e", ":NvimTreeToggle<cr>", description = "Toggle file explorer." },
	{ "<leader>am", require("harpoon.ui").toggle_quick_menu, description = "Show favorite buffers." },
	{
		"<leader>aa",
		require("harpoon.mark").add_file,
		description = "Add current buffer to favorites.",
	},
	{ "<leader>au", "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", description = "Go to favorite bufffer #1." },
	{ "<leader>ai", "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", description = "Go to favorite bufffer #2." },
	{ "<leader>ao", "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", description = "Go to favorite bufffer #3." },
	{ "<leader>ap", "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", description = "Go to favorite bufffer #4." },
	{ "<leader>ld", vim.diagnostic.setloclist, description = "Show diagnostic list." },
	{ "<leader>lf", vim.lsp.buf.rename, description = "Rename current file." },
	{ "<leader>lc", vim.lsp.codelens.run, description = "Run codelens." },
	{ "<leader>lj", vim.diagnostic.goto_next, description = "Go to next diagnostic." },
	{ "<leader>lk", vim.diagnostic.goto_prev, description = "Go to previous diagnostic." },
	{ "<leader>lf", vim.lsp.buf.formatting, description = "Format file." },
	{ "<leader>lf", vim.lsp.buf.formatting_sync, description = "Format buffer." },
	{ "<leader>la", "<cmd>CodeActionMenu<cr>", description = "Code action menu." },
	{ "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", description = "Open LazyGit." },
	{ "<c-g>", "<cmd>lua _TEST_TERM_TOGGLE()<cr>", mode = { "n", "t" }, description = "Open test terminal." },
	{ "<c-k>", description = "Show signature help." },
	{
		"<c-]>",
		require("fold-cycle").open,
		description = "Open the next level of (nested) folds.",
	},
	{
		"<c-[>",
		require("fold-cycle").close,
		description = "Close the next level of (nested) folds.",
	},
	{
		"<c-s-]>",
		require("fold-cycle").open_all,
		description = "Open the next level of (nested) folds.",
	},
	{
		"<c-s-[>",
		require("fold-cycle").close_all,
		description = "Close the next level of (nested) folds.",
	},
}

legendary.bind_keymaps(keymaps)
