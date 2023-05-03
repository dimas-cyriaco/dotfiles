return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "pnpm test --",
            -- jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })

      vim.diagnostic.config({ virtual_text = true }, vim.api.nvim_create_namespace("neotest"))
    end,
    keys = {
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Run test file" },
      { "<leader>tt", "<cmd>lua require('neotest').output_panel.toggle()<cr>",       desc = "Run test file" },
      -- { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show menu" },
      -- { "gj", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to Harpoon file 1" },
      -- { "gk", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to Harpoon file 2" },
      -- { "gl", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to Harpoon file 3" },
      -- { "g;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to Harpoon file 4" },
    },
  },
}
