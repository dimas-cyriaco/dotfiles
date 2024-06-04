return {
  "Pocco81/auto-save.nvim",
  keys = {
    {
      "<leader>ua", "<cmd>ASToggle<cr>", desc = "Toggle auto save"
    }
  },
  config = function()
    require("auto-save").setup({
      execution_message = {
        message = "",
      },
    })
  end,
}
