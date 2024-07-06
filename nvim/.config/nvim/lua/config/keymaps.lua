local Util = require("lazyvim.util")

vim.keymap.set(
  "n",
  "gv",
  "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
  { silent = true, desc = "Go to Definition (split)" }
)
vim.keymap.set("i", "tn", "<esc>", { silent = true })
vim.keymap.set("n", "<leader>a", "<cmd>w<cr>", { silent = true, desc = "Save File" })
vim.keymap.set("n", "<leader>qt", "<cmd>tabclose<cr>", { silent = true, desc = "Close Tab" })
vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>H", { silent = true, desc = "Change Split to Horizontal" })
vim.keymap.set("n", "<leader>wk", "<C-w>t<C-w>K", { silent = true, desc = "Change Split to Vertical" })
vim.keymap.set(
  "n",
  "<leader>ce",
  "<cmd>Neotree document_symbols toggle<cr>",
  { silent = true, desc = "Open Symbol tree" }
)

-- vim.keymap.set(
--   "n",
--   "<leader>sg",
--   ":lua require('telescope.builtin').live_grep({ additional_args = { '--hidden' } })<cr>",
--   { silent = true, desc = "Find in Files" }
-- )

vim.keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
end, { silent = true, desc = "Copy file relative path" })

vim.keymap.set("n", "<c-;>", "<cmd>e #<cr>", { desc = "Go to previous file" })

vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("n", "<leader>uk", function()
  vim.cmd("TWToggle")
end, { silent = true, desc = "Toggle scrolloff" })
