return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        javascript = { "cspell" },
        typescript = { "cspell" },
        sh = { "shellcheck" },
        zsh = { "shellcheck" },
      },
    },
  },
}
