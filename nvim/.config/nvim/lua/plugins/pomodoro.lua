return {
  "wthollingsworth/pomodoro.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = { "filename", require("pomodoro").statusline },
      },
    })
  end,
}
