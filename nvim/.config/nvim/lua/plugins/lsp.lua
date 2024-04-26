---@diagnostic disable: missing-fields, undefined-global

return {
  -- {
  --   "hinell/lsp-timeout.nvim",
  --   event = "LazyFile", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
  --   dependencies = { "neovim/nvim-lspconfig" },
  -- },
  {
    "Wansmer/symbol-usage.nvim",
    event = "LazyFile", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require("symbol-usage").setup({
        ---@type 'above'|'end_of_line'|'textwidth' above by default
        vt_position = "end_of_line",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    keys = {
      {
        "<leader>cxr",
        "<cmd>LspRestart<cr>",
        desc = "Restart LSP",
      },
      {
        "<leader>cxs",
        "<cmd>LspStop<cr>",
        desc = "Stop LSP",
      },
    },
    opts = {
      inlay_hints = {
        enabled = true,
      },
    },
  },
}
