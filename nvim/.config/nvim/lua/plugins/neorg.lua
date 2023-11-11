return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = { "norg" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icon_preset = "varied",
            },
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/org",
                motrix = "~/motrix",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
    keys = {
      { "<leader>no", "<cmd>Neorg index<cr>", desc = "Open Notes" },
      { "<leader>nw", "<cmd>Neorg workspace", desc = "Change Workspace" },
    },
  },
}
