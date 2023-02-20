return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file" },
      { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show menu" },
      { "gj", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to Harpoon file 1" },
      { "gk", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to Harpoon file 2" },
      { "gl", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to Harpoon file 3" },
      { "g;", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to Harpoon file 4" },
    },
  },
}
