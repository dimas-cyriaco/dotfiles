return {
  "ivanjermakov/troublesum.nvim",
  event = "LazyFile",
  config = function()
    require("troublesum").setup({
      severity_format = { "", "", "", "" },
    })
  end,
}
