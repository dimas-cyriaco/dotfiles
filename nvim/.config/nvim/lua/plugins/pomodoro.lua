return {
  "dbinagi/nomodoro",
  cmd = { "NomoWork" },
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("nomodoro").setup({
      work_time = 25,
      break_time = 5,
      menu_available = true,
      texts = {
        on_break_complete = "TIME IS UP!",
        on_work_complete = "TIME IS UP!",
        status_icon = " ",
        timer_format = "!%0M:%0S", -- To include hours: '!%0H:%0M:%0S'
      },
      on_work_complete = function()
        vim.cmd([[colorscheme monochrome]])
      end,
      on_break_complete = function()
        vim.cmd([[colorscheme tokyonight-storm]])
      end,
    })

    local lualine = require("lualine")

    lualine.setup({
      sections = {
        lualine_x = {
          require("nomodoro").status,
        },
      },
    })
  end,
}
