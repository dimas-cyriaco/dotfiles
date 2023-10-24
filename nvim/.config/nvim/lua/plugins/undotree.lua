return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  keys = {
    { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Open Panel" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "horizontal",
        },
      },
    })
    require("telescope").load_extension("undo")
  end,
}
