return {
  "stevearc/overseer.nvim",
  keys = {
    {
      "<leader>oo",
      function()
        require("overseer").open()
      end,
      desc = "Open Panel",
    },
    {
      "<leader>or",
      function()
        require("overseer").run_template(nil, function(task)
          if task then
            require("overseer").open({ enter = true })
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
