return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local dap = require("dap")

    dap.adapters.ocaml = {
      type = "executable",
      command = "ocamlearlybird",
      args = { "debug" },
      -- cwd = "${workspaceFolder}",
    }

    dap.configurations.ocaml = {
      {
        name = "OCaml Debug Main",
        type = "ocaml",
        request = "launch",
        program = "${workspaceFolder}/_build/default/bin/hello.bc",
      },
    }
  end,
}
