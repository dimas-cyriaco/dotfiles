return {
  "antosha417/nvim-lsp-file-operations",
  ft = { "neo-tree" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neo-tree/neo-tree.nvim",
  },
  config = function()
    require("lsp-file-operations").setup({})
  end,
}
