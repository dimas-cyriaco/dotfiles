return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      javascript = { "cspell" },
      typescript = { "cspell" },
      lua = { "cspell" },
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
    },
  },
}
