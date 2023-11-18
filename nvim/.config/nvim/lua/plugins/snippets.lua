return {
  {
    "benfowler/telescope-luasnip.nvim",
    dependencies = { "L3MON4D3/LuaSnip" },
    keys = {
      {
        "<leader>sp",
        "<cmd>Telescope luasnip<cr>",
        desc = "Snippets",
      },
    },
    config = function()
      require("telescope").load_extension("luasnip")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      region_check_events = "InsertEnter",
      delete_check_events = "TextChanged",
    },
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
    end,
  },
}
