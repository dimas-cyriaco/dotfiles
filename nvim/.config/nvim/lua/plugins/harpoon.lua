return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Add file" },
      { "<leader>hf", "<cmd>Telescope harpoon marks<cr>",                       desc = "Show menu" },
      { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show menu" },
      { "gn",         "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Go to Harpoon file 1" },
      { "<c-n>",      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Go to Harpoon file 1" },
      { "ge",         "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Go to Harpoon file 2" },
      { "<c-m>",      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Go to Harpoon file 2" },
      { "gi",         "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Go to Harpoon file 3" },
      { "<c-,>",      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Go to Harpoon file 3" },
      { "go",         "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Go to Harpoon file 4" },
      { "<c-.>",      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Go to Harpoon file 4" },
      { "gm",         "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",   desc = "Go to Harpoon terminal 1" },
      { "g,",         "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>",   desc = "Go to Harpoon terminal 2" },
    },
  },
}
