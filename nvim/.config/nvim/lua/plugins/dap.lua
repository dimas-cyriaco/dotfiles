return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  keys = {
    {
      "<leader>dv",
      function()
        require("dapui").eval(nil, { enter = true })
      end,
      desc = "Toggle auto save"
    }
  },
}
