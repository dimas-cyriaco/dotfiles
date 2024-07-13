return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LazyFile",
  config = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({ virtual_text = false })
  end,
}
