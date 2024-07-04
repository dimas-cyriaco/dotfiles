return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      -- "markemmons/neotest-deno",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
        -- ["neotest-deno"] = {},
      },
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        function()
          require("neotest").run.run({ jestCommand = "pnpm test --watch " })
        end,
        desc = "Run Watch",
      },
    },
  },
}
