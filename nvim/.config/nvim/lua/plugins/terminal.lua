return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  keys = {
    {
      "<leader>ux",
      mode = { "n", "x" },
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        Terminal:new({ cmd = "taskwarrior-tui", direction = "float", hidden = true }):toggle()
      end,
      desc = "Open Taskwarrior",
    },
  },

}
