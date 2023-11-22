return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
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
    opts = {
      adapters = {
        ["neotest-go"] = {
          -- Here we can set options for neotest-go, e.g.
          -- args = { "-tags=integration" }
        },
        -- ["neotest-jest"] = {
        --   jestCommand = "pnpm test --",
        --   -- jestConfigFile = "custom.jest.config.ts",
        --   -- env = { CI = true },
        --   -- cwd = function()
        --   --   return vim.fn.getcwd()
        --   -- end,
        -- },
      },
    },
    -- opts = function(_, opts)
    --   table.insert(
    --     opts.adapters,
    --     require("neotest-jest")({
    --       jestCommand = "pnpm test --",
    --       -- jestConfigFile = "custom.jest.config.ts",
    --       -- env = { CI = true },
    --       cwd = function()
    --         return vim.fn.getcwd()
    --       end,
    --     }),
    --   )
    -- end,
  },
}
