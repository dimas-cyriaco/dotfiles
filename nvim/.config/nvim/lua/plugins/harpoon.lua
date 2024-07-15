return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = {
      { "<leader>ha", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Add file" },
      { "<leader>hf", "<cmd>Telescope harpoon marks<cr>", desc = "Show menu" },
      {
        "<leader>hh",
        "<cmd>lua require('harpoon.ui'):toggle_quick_menu(require('harpoon'):list())<cr>",
        desc = "Show menu",
      },
      { "gn", "<cmd>lua require('harpoon'):list():select(1)<cr>", desc = "Go to Harpoon file 1" },
      { "ge", "<cmd>lua require('harpoon'):list():select(2)<cr>", desc = "Go to Harpoon file 2" },
      { "gi", "<cmd>lua require('harpoon'):list():select(3)<cr>", desc = "Go to Harpoon file 3" },
      { "go", "<cmd>lua require('harpoon'):list():select(4)<cr>", desc = "Go to Harpoon file 4" },
    },
  },
}
