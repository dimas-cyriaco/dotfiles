lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["j"] = {
  name = "+Jest",
  j = { "<cmd>lua require'jester'.run{ path_to_jest = './node_modules/.bin/jest' }<CR>", "Run nearest Test" },
  f = { "<cmd>lua require'jester'.run_file{ path_to_jest = './node_modules/.bin/jest' }<CR>", "Run file" },
  l = { "<cmd>lua require'jester'.run_last{ path_to_jest = './node_modules/.bin/jest' }<CR>", "Run last Test" },
}

lvim.builtin.which_key.mappings["a"] = {
  name = "+Harpoon",
  m = { "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<cr>", "Show List" },
  a = { "<cmd>lua require'harpoon.mark'.add_file()<cr>", "Add Mark" },
  u = { "<cmd>lua require'harpoon.ui'.nav_file(1)<cr>", "Add Mark" },
  i = { "<cmd>lua require'harpoon.ui'.nav_file(2)<cr>", "Add Mark" },
  o = { "<cmd>lua require'harpoon.ui'.nav_file(3)<cr>", "Add Mark" },
  p = { "<cmd>lua require'harpoon.ui'.nav_file(4)<cr>", "Add Mark" }
}

lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"

lvim.keys.normal_mode["<M-j>"] = ":lua require('neoscroll').scroll(1, true, 100)<CR>"
lvim.keys.normal_mode["<M-k>"] = ":lua require('neoscroll').scroll(-1, true, 100)<CR>"

lvim.keys.normal_mode["<leader>i"] = ":lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>"
