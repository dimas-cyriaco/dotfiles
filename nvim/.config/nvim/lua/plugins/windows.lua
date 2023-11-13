return {
  "anuvyklack/windows.nvim",
  event = { "LazyFile" },
  dependencies = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
  keys = {
    {
      "<leader>wm",
      "<cmd>WindowsMaximize<cr>",
      desc = "Maximize Window",
    },
    {
      "<leader>we",
      "<cmd>WindowsEqualize<cr>",
      desc = "Equalize Window",
    },
    {
      "<leader>uw",
      "<cmd>WindowsToggleAutowidth<cr>",
      desc = "Toggle auto windows width",
    },
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require("windows").setup()
  end,
}
