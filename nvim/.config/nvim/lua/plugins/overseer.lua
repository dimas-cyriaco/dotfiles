return {
  "stevearc/overseer.nvim",
  -- dependencies = { "rcarriga/nvim-notify" },
  keys = {
    {
      "<leader>oo",
      function()
        require("overseer").toggle()
      end,
      desc = "Open Panel",
    },
    {
      "<leader>or",
      function()
        local overseer = require("overseer")

        overseer.run_template(nil, function(task)
          if task then
            overseer.run_action(task, "open vsplit")
          end
        end)
      end,
      desc = "Run Task",
    },
  },
  config = function()
    require("overseer").setup({
      task_list = {
        bindings = {
          ["?"] = "ShowHelp",
          ["g?"] = "ShowHelp",
          ["<CR>"] = "RunAction",
          ["<C-e>"] = "Edit",
          ["o"] = "Open",
          ["<C-v>"] = "OpenVsplit",
          ["<C-s>"] = "OpenSplit",
          ["<C-f>"] = "OpenFloat",
          ["<C-q>"] = "OpenQuickFix",
          ["p"] = "TogglePreview",
          ["<C->>"] = "IncreaseDetail",
          ["<C-<>"] = "DecreaseDetail",
          ["L"] = "IncreaseAllDetail",
          ["H"] = "DecreaseAllDetail",
          ["["] = "DecreaseWidth",
          ["]"] = "IncreaseWidth",
          ["{"] = "PrevTask",
          ["}"] = "NextTask",
          ["<C-k>"] = "ScrollOutputUp",
          ["<C-j>"] = "ScrollOutputDown",
          ["q"] = "Close",
        },
      },
      default_template_prompt = "allow",
      log = {
        {
          type = "echo",
          level = vim.log.levels.WARN,
        },
        {
          type = "file",
          filename = "overseer.log",
          level = vim.log.levels.WARN,
        },
      },
    })
  end,
}
