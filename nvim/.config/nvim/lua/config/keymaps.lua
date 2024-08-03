local Util = require("lazyvim.util")

vim.keymap.set(
  "n",
  "gv",
  "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>",
  { silent = true, desc = "Go to Definition (split)" }
)

vim.keymap.set("n", "<c-;>", "<cmd>e #<cr>", { desc = "Go to previous file" })

vim.keymap.set("n", "<c-n>", function()
  require("lazyvim.util").terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("t", "<c-n>", function()
  require("lazyvim.util").terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("n", "<leader>a", "<cmd>w<cr>", { silent = true, desc = "Save File" })

vim.keymap.set(
  "n",
  "<leader>ce",
  "<cmd>Neotree document_symbols toggle<cr>",
  { silent = true, desc = "Open Symbol tree" }
)

vim.keymap.set("n", "<leader>dW", "<Plug>(DBUI_SaveQuery)", { silent = true, desc = "Save Query" })

vim.keymap.set("n", "<leader>n", "<cmd>Neotree reveal toggle<cr>", { silent = true, desc = "Neotree Reveal Foo" })

vim.keymap.set("n", "<leader>ft", function()
  Util.terminal(nil, { border = "rounded" })
end, { silent = true, desc = "Term with border" })

vim.keymap.set("n", "<leader>fy", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
end, { silent = true, desc = "Copy file relative path" })

vim.keymap.set("n", "<leader>qt", "<cmd>tabclose<cr>", { silent = true, desc = "Close Tab" })

vim.keymap.set("n", "<leader>uk", function()
  if vim.opt.scrolloff == 999 then
    vim.opt.scrolloff = 10
  else
    vim.opt.scrolloff = 999
  end
end, { silent = true, desc = "Toggle scrolloff" })

vim.keymap.set("n", "<leader>ut", "<cmd>TWToggle<cr>", { silent = true, desc = "Toggle Typewritter" })

vim.keymap.set("n", "<leader>W", "<cmd>close<cr>", { silent = true, desc = "Close window" })

vim.keymap.set("n", "<leader>wh", "<C-w>t<C-w>H", { silent = true, desc = "Change Split to Horizontal" })

vim.keymap.set("n", "<leader>wk", "<C-w>t<C-w>K", { silent = true, desc = "Change Split to Vertical" })

vim.keymap.set("n", "zR", require("ufo").openAllFolds)

vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)

vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)

vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)
