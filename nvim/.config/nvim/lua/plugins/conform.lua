return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- sql = { "sql_formatter" },
      go = { "goimports-reviser", "gofumpt", "golines" },
      -- gotmpl = { "djlint" },
    },
  },
}
