return {
  "stevearc/overseer.nvim",
  keys = {
    {
      "<leader>oo",
      function()
        overseer.open()
      end,
      desc = "Open Panel",
    },
    {
      "<leader>or",
      function()
        local overseer = require("overseer")

        overseer.run_template(nil, function(task)
          if task then
            -- overseer.open({ enter = true })
            overseer.run_action(task, "open float")
          end
        end)
      end,
      desc = "Run Task",
    },
  },
  opts = {
    open_on_start = true,
  },
}
