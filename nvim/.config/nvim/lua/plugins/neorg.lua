return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = { "norg" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.export"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "varied",
            },
          },
          ["core.dirman"] = {
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

      vim.api.nvim_set_hl(0, "@neorg.markup.verbatim", { fg = "#ff9e64", bold = true, italic = true })
    end,
    keys = {
      { "<leader>no", "<cmd>Neorg index<cr>", desc = "Open Notes" },
      { "<leader>nw", "<cmd>Neorg workspace<cr>", desc = "Current Workspace" },
    },
  },
}
