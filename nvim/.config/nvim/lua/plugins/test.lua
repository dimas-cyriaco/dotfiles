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
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "pnpm test --",
          -- jestConfigFile = "custom.jest.config.ts",
          -- env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
    end,
  },
}
-- return {
--   "David-Kunz/jester",
--   keys = {
--     {
--       "<leader>tt",
--       function()
--         require("jester").run()
--       end,
--       desc = "Run nearest test",
--     },
--     {
--       "<leader>tf",
--       function()
--         require("jester").run_file()
--       end,
--       desc = "Run file",
--     },
--     {
--       "<leader>tl",
--       function()
--         require("jester").run_last()
--       end,
--       desc = "Watch last test",
--     },
--     {
--       "<leader>tw",
--       function()
--         require("jester").run_file({ path_to_jest_run = "ipnpm jest --watchAll" })
--       end,
--       desc = "Watch file",
--     },
--     {
--       "<leader>tW",
--       function()
--         require("jester").run({ path_to_jest_run = "ipnpm jest --watchAll" })
--       end,
--       desc = "Watch nearest test",
--     },
--   },
--   config = function()
--     require("jester").setup({
--       path_to_jest_run = "ipnpm jest",
--       path_to_jest_debug = "ipnpm jest",
--       dap = {
--         console = "externalTerminal",
--       },
--     })
--
--     local dap = require("dap")
--     dap.adapters.node2 = {
--       type = "executable",
--       command = "node-debug2-adapter",
--       -- args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
--       -- args = { require("mason-core.path").package_prefix("node-debug2-adapter") .. "/out/src/nodeDebug.js" },
--       args = {},
--     }
--     dap.configurations.javascript = {
--       {
--         name = "Launch",
--         type = "node2",
--         request = "launch",
--         program = "${file}",
--         cwd = vim.fn.getcwd(),
--         sourceMaps = true,
--         protocol = "inspector",
--         console = "integratedTerminal",
--       },
--       {
--         -- For this to work you need to make sure the node process is started with the `--inspect` flag.
--         name = "Attach to process",
--         type = "node2",
--         request = "attach",
--         processId = require("dap.utils").pick_process,
--       },
--     }
--   end,
-- }
