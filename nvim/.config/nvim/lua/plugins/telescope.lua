return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup({
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
    })
  end,
}
