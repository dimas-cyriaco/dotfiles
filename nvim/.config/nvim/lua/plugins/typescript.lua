return {
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = { "typescript" },
    config = {
      keymaps = {
        toggle = "<leader>dd", -- default '<leader>dd'
        go_to_definition = "<leader>dx", -- default '<leader>dx'
      },
    },
  },
  {
    "dmmulroy/tsc.nvim",
    keys = {
      {
        "<leader>ct",
        "<cmd>TSC<cr>",
        desc = "Type-check Project",
      },
    },
    config = function()
      require("tsc").setup({
        use_trouble_qflist = true,
        use_diagnostics = true,
      })
    end,
  },
}
