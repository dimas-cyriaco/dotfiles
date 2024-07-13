return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LazyFile",
  config = function()
    require("tiny-inline-diagnostic").setup()
  end,
}
